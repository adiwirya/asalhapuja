import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:asalhapuja/data/utils/utils.dart';
import 'package:asalhapuja/domain/db_helper.dart';
import 'package:asalhapuja/domain/models/models.dart';
import 'package:asalhapuja/domain/repository/server_repository.dart';
import 'package:asalhapuja/presentation/widget/widgets.dart';
import 'package:asalhapuja/routes/app_routes.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class FormController extends GetxController {
  final formKey = GlobalKey<FormState>();
  TextEditingController ktp = TextEditingController();
  TextEditingController nama = TextEditingController();
  TextEditingController namaCetak = TextEditingController();
  TextEditingController alamat = TextEditingController();
  TextEditingController nohp = TextEditingController();
  RxString vihara = ''.obs;
  RxInt viharaId = 0.obs;
  RxString size = 'XS'.obs;
  RxString baju = ''.obs;
  RxString celana = ''.obs;
  RxString meal = ''.obs;
  RxString title = ''.obs;
  RxString btnText = ''.obs;
  RxString jenisKelamin = ''.obs;
  RxBool isPhoto = false.obs;
  RxBool isEdit = false.obs;
  RxBool isChange = false.obs;
  RxBool isNew = false.obs;
  File image = File('');
  RxString imagePath = ''.obs;
  RxList<Region> listRegion = <Region>[].obs;
  RxList<bool> isChecked =
      [
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
      ].obs;
  final client = Server(Dio(BaseOptions(contentType: 'application/json')));
  List<String> listSize = ['XS', 'SS', 'S', 'M', 'L', 'XL', 'XXL', 'XXXL'];
  List<String> listBaju = ['XS', 'SS', 'S', 'M', 'L', 'XL', 'XXL', 'XXXL'];
  List<String> listCelana = [
    '26',
    '27',
    '28',
    '29',
    '30',
    '31',
    '32',
    '33',
    '34',
    '35',
    '36',
    '37',
    '38',
    '39',
    '40',
  ];
  @override
  Future<void> onInit() async {
    final nik = Get.arguments;
    final user = User.fromJson(gs.read('User') as Map<String, dynamic>);
    listRegion.value = user.regions;
    print(nik);
    if (nik != null) {
      isEdit.value = true;
      title.value = 'Edit Data';
      btnText.value = 'Ubah';
      await DBHelper.instance.openDB();
      final data = await DBHelper.instance.getPesertabyNik(nik as String);
      await DBHelper.instance.closeDB();
      ktp.text = data.ktp;
      nama.text = data.name;
      namaCetak.text = data.printed_name;
      alamat.text = data.address;
      nohp.text = data.phone_number;
      meal.value = data.meal;
      jenisKelamin.value = data.gender;
      vihara.value = data.organization;
      imagePath.value = data.photo;
      size.value = data.size;
      baju.value = data.baju;
      celana.value = data.celana;
      isPhoto.value = true;
      for (final region in listRegion) {
        if (region.vihara == vihara.value) {
          viharaId.value = region.id;
          break;
        }
      }
      final listTahun = jsonDecode(data.tahun_ikut) as List<dynamic>;
      var tahun = 2015;
      for (var i = 0; i < isChecked.length; i++) {
        for (var j = 0; j < listTahun.length; j++) {
          if (listTahun[j] == tahun) {
            isChecked[i] = true;
          }
        }
        tahun = tahun + 1;
      }
      print(isChecked);
      print(listTahun);
    } else {
      title.value = 'Form Data';
      btnText.value = 'Simpan';
      vihara.value = listRegion[0].vihara;
      viharaId.value = listRegion[0].id;
      // ktp.text = generateRandomString(16);
      // nama.text = 'Dominic';
      // namaCetak.text = 'Dominic';
      // alamat.text = 'Jl. Raya Cipinang Besar Selatan No. 1';
      // nohp.text = '081234567890';
      // meal.value = 'V';
      // jenisKelamin.value = 'L';
    }

    super.onInit();
  }

  void setNamaCetak(String value) {
    final debouncer = Debouncer(milliseconds: 1);
    if (value.length < 26) {
      debouncer.run(() => namaCetak.text = value);
    }
  }

  void cekNik(String value) {
    final debouncer = Debouncer(milliseconds: 1);
    if (15 < value.length) {
      debouncer.run(() async {
        await DBHelper.instance.openDB();
        final check = await DBHelper.instance.checkStatus(value);
        await DBHelper.instance.closeDB();
        if (check > 0) {
          isNew.value = false;
          baju.value = '';
          celana.value = '';
        } else {
          isNew.value = true;
          baju.value = 'XS';
          if (value == 'P') {
            celana.value = '27';
          } else if (value == 'L') {
            celana.value = '26';
          }
        }
      });
    }
  }

  Future<void> submit() async {
    if (isEdit.value) {
      await ubah();
    } else {
      await simpan();
    }
    return;
  }

  Future<void> ubah() async {
    final user = User.fromJson(gs.read('User') as Map<String, dynamic>);
    if (meal.value == '') {
      Snackbar().error('Jenis Makanan Wajib Diisi');
      return;
    }
    if (jenisKelamin.value == '') {
      Snackbar().error('Jenis Kelamin Wajib Diisi');
      return;
    }
    if (imagePath.value == '') {
      Snackbar().error('Foto belum diambil');
      return;
    }
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      Snackbar().error('Input masih ada yang kosong');
      return;
    }
    try {
      String paths;
      if (isChange.value) {
        paths = await saveImage(File(imagePath.value), ktp.text);
      } else {
        paths = imagePath.value;
      }
      final tahunIkut = <String>[];
      var tahun = 2015;
      for (var i = 0; i < isChecked.length; i++) {
        if (isChecked[i]) {
          tahunIkut.add(tahun.toString());
        }
        tahun = tahun + 1;
      }
      final data = Forms(
        nik_koordinator: user.nik,
        organization: vihara.value,
        ktp: ktp.text,
        name: nama.text,
        printed_name: namaCetak.text,
        gender: jenisKelamin.value,
        address: alamat.text,
        phone_number: nohp.text,
        meal: meal.value,
        photo: paths,
        region_f_id: viharaId.value,
        tahun_ikut: tahunIkut.toString(),
        size: size.value,
        baju: baju.value,
        celana: celana.value,
        active: 1,
      );
      await DBHelper.instance.openDB();
      await DBHelper.instance.replacePeserta(data);
      await DBHelper.instance.closeDB();
      final databasePath = await getApplicationDocumentsDirectory();
      final db = File(join(databasePath.path, 'asalhapuja.db'));
      final directory = await getExternalStorageDirectory();
      await db.copy('${directory!.path}/asalhapuja.db');
      Snackbar().success('Data berhasil diubah');
      Timer(const Duration(seconds: 3), () {
        Get.offAllNamed(Routes.home);
      });
    } catch (e) {
      Snackbar().error(e.toString());
    }
    return;
  }

  Future<void> simpan() async {
    final user = User.fromJson(gs.read('User') as Map<String, dynamic>);
    if (meal.value == '') {
      Snackbar().error('Jenis Makanan Wajib Diisi');
      return;
    }
    if (jenisKelamin.value == '') {
      Snackbar().error('Jenis Kelamin Wajib Diisi');
      return;
    }
    if (imagePath.value == '') {
      Snackbar().error('Foto belum diambil');
      return;
    }
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      Snackbar().error('Input masih ada yang kosong');
      return;
    }
    try {
      await DBHelper.instance.openDB();
      final check = await DBHelper.instance.checkNik(ktp.text);
      await DBHelper.instance.closeDB();
      if (check > 0) {
        Snackbar().error('NIK sudah terdaftar');
        return;
      }

      if (user.quota_sisa == 0) {
        Snackbar().error('Kuota ${vihara.value} sudah penuh');
        return;
      }
      final paths = await saveImage(File(imagePath.value), ktp.text);

      //check
      var tahun = 2015;
      final tahunIkut = <String>[];
      for (var i = 0; i < isChecked.length; i++) {
        if (isChecked[i]) {
          tahunIkut.add(tahun.toString());
        }
        tahun = tahun + 1;
      }

      final data = Forms(
        nik_koordinator: user.nik,
        organization: vihara.value,
        ktp: ktp.text,
        name: nama.text,
        printed_name: namaCetak.text,
        gender: jenisKelamin.value,
        address: alamat.text,
        phone_number: nohp.text,
        meal: meal.value,
        photo: paths,
        region_f_id: viharaId.value,
        tahun_ikut: tahunIkut.toString(),
        size: size.value,
        baju: baju.value,
        celana: celana.value,
        active: 1,
      );
      await DBHelper.instance.openDB();
      await DBHelper.instance.insertPeserta(data);

      user.quota_sisa = user.quota_sisa - 1;
      final temp = gs.read('User');
      temp['quota_sisa'] = user.quota_sisa;
      await DBHelper.instance.closeDB();
      await gs.write('User', temp);
      final databasePath = await getApplicationDocumentsDirectory();
      final db = File(join(databasePath.path, 'asalhapuja.db'));
      final directory = await getExternalStorageDirectory();
      await db.copy('${directory!.path}/asalhapuja.db');
      Snackbar().success('Data berhasil disimpan');
      Timer(const Duration(seconds: 2), () {
        Get.offAllNamed(Routes.home);
      });
    } catch (e) {
      Snackbar().error(e.toString());
    }
  }

  void setMeal(String value) {
    meal.value = value;
  }

  void setJenis(String value) {
    jenisKelamin.value = value;
    if (value == 'P') {
      listCelana = ['27', '29', '31', '33', '35', '37', '39'];
    } else if (value == 'L') {
      listCelana = ['26', '28', '30', '32', '34', '36', '38', '40'];
    }
  }

  void setChecked(bool value, int index) {
    isChecked[index] = value;
    update();
  }

  void setVihara(String value) {
    vihara.value = value;
    for (final region in listRegion) {
      if (region.vihara == vihara.value) {
        viharaId.value = region.id;
        break;
      }
    }
  }

  void getImage() {
    Get.dialog(SelectPic(controller: FormController()));
  }

  Future<void> imageFromGallery() async {
    // Get.back();
    final photo = await getImageFromgallery();
    // image = File(photo.path as String);
    if (photo != null) {
      isPhoto.value = true;
      imagePath.value = photo.path as String;
      update();
      if (isEdit.value) {
        isChange.value = true;
      }
    } else {
      Snackbar().error('Foto belum diambil');
    }
    print('$imagePath - $isPhoto');
  }

  Future<void> imageFromCamera() async {
    // Get.back();
    final photo = await getImageFromCamera();
    // print(photo.path.toString());
    if (photo != null) {
      isPhoto.value = true;
      imagePath.value = photo.path as String;
      update();
      imagePath.refresh();
      if (isEdit.value) {
        isChange.value = true;
      }
    } else {
      Snackbar().error('Foto belum diambil');
    }
    print('$imagePath - $isPhoto');
  }

  String generateRandomString(int length) {
    final random = Random();
    const availableChars = '1234567890';
    final randomString =
        List.generate(
          length,
          (index) => availableChars[random.nextInt(availableChars.length)],
        ).join();

    return randomString;
  }
}
