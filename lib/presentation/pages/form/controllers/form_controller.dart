import 'dart:developer';
import 'dart:io';

import 'package:asalhapuja/data/utils/utils.dart';
import 'package:asalhapuja/domain/db_helper.dart';
import 'package:asalhapuja/domain/models/models.dart';
import 'package:asalhapuja/domain/repository/server_repository.dart';
import 'package:asalhapuja/presentation/widget/widgets.dart';
import 'package:asalhapuja/routes/app_routes.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class FormController extends GetxController {
  final formKey = GlobalKey<FormState>();
  TextEditingController ktp = TextEditingController();
  TextEditingController nama = TextEditingController();
  TextEditingController namaCetak = TextEditingController();
  TextEditingController alamat = TextEditingController();
  TextEditingController nohp = TextEditingController();
  RxString vihara = ''.obs;
  RxInt viharaId = 0.obs;
  RxString meal = ''.obs;
  RxString jenisKelamin = ''.obs;
  RxBool isPhoto = false.obs;
  File image = File('');
  RxString imagePath = ''.obs;
  RxList<Region> listRegion = <Region>[].obs;
  final client = Server(
    Dio(
      BaseOptions(
        contentType: 'application/json',
      ),
    ),
  );
  @override
  void onInit() {
    final user = User.fromJson(gs.read('User') as Map<String, dynamic>);
    listRegion.value = user.regions;
    vihara.value = listRegion[0].vihara;
    viharaId.value = listRegion[0].id;
    ktp.text = '3326160101810021';
    nama.text = 'Slamet Riyadi';
    namaCetak.text = 'Slamet Riyadi';
    alamat.text = 'Jl. Raya Cipinang Besar Selatan No. 1';
    nohp.text = '081234567890';
    meal.value = 'V';
    jenisKelamin.value = 'L';

    super.onInit();
  }

  void setNamaCetak(String value) {
    final _debouncer = Debouncer(milliseconds: 1);
    if (value.length < 26) {
      _debouncer.run(() => namaCetak.text = value);
    }
  }

  void submit() async {
    final user = User.fromJson(gs.read('User') as Map<String, dynamic>);
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    if (imagePath.value == '') {
      Snackbar().error('Foto belum diambil');
      return;
    }
    try {
      final check = await DBHelper.instance.checkNik(ktp.text);
      if (check > 0) {
        Snackbar().error('NIK sudah terdaftar');
        return;
      }
      var quota = await DBHelper.instance.getQouta(viharaId.value);
      if (quota == 0) {
        Snackbar().error('Kuota ${vihara.value} sudah penuh');
        return;
      }
      final paths = await saveImage(File(imagePath.value), ktp.text);
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
      );
      await DBHelper.instance.insertPeserta(data);
      quota = quota - 1;
      final msg = await DBHelper.instance.updateQouta(viharaId.value, quota);
      Get.offAllNamed(Routes.home);
    } catch (e) {
      Snackbar().error(e.toString());
    }
    // try {
    //   var res = await client.form(
    //     viharaId.value.toString(),
    //     user.nik,
    //     vihara.value,
    //     ktp.text,
    //     nama.text,
    //     namaCetak.text,
    //     jenisKelamin.value,
    //     alamat.text,
    //     nohp.text,
    //     meal.value,
    //     File(imagePath.value),
    //   );
    // } on DioError catch (e) {
    //   // Get.back();
    //   if (e.response!.statusCode == 302) {
    //     return;
    //   } else {
    //     Snackbar().error(e.message);
    //     print(e.toString());
    //     return;
    //   }
    // } catch (e) {
    //   // Get.back();
    //   Snackbar().error(e.toString());
    //   return;
    // }
  }

  void setMeal(String value) {
    meal.value = value;
  }

  void setJenis(String value) {
    jenisKelamin.value = value;
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
    Get.dialog(
      SelectPic(
        controller: FormController(),
      ),
    );
  }

  void imageFromGallery() async {
    final photo = await getImageFromgallery();
    log(photo.path.toString());
    isPhoto.value = true;
    // image = File(photo.path as String);
    imagePath.value = photo.path as String;
    // Get.back();
  }

  void imageFromCamera() async {
    final photo = await getImageFromCamera();
    log(photo.path.toString());
    isPhoto.value = true;
    // image = File(photo.path as String);
    imagePath.value = photo.path as String;
    // Get.back();
  }
}
