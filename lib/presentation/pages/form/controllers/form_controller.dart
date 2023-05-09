import 'dart:io';

import 'package:asalhapuja/data/utils/utils.dart';
import 'package:asalhapuja/domain/db_helper.dart';
import 'package:asalhapuja/domain/models/models.dart';
import 'package:asalhapuja/domain/repository/server_repository.dart';
import 'package:asalhapuja/presentation/widget/widgets.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;

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
    User user = User.fromJson(gs.read('User') as Map<String, dynamic>);
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
    User user = User.fromJson(gs.read('User') as Map<String, dynamic>);
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    print(BaseURL.form);
    var paths = await saveImage(File(imagePath.value), ktp.text);
    var data = Forms(
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
    Get.back();

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
    //     Get.back();
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
    for (Region region in listRegion) {
      if (region.vihara == vihara.value) {
        viharaId.value = region.id;
        break;
      }
    }
  }

  void getImage() {
    Get.dialog(SelectPic(
      controller: FormController(),
    ));
  }

  void imageFromGallery() async {
    var photo = await getImageFromgallery();
    print(photo.path);
    isPhoto.value = true;
    // image = File(photo.path as String);
    imagePath.value = photo.path as String;
    // Get.back();
  }

  void imageFromCamera() async {
    var photo = await getImageFromCamera();
    print(photo.path);
    isPhoto.value = true;
    // image = File(photo.path as String);
    imagePath.value = photo.path as String;
    // Get.back();
  }
}
