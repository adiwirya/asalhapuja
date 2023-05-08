import 'dart:io';

import 'package:asalhapuja/data/utils/utils.dart';
import 'package:asalhapuja/domain/models/models.dart';
import 'package:asalhapuja/presentation/widget/widgets.dart';
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
  @override
  void onInit() {
    User user = User.fromJson(gs.read('User') as Map<String, dynamic>);
    listRegion.value = user.regions!;
    vihara.value = listRegion[0].vihara;
    viharaId.value = listRegion[0].id;
    super.onInit();
  }

  void submit() {}

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
    // imagePath.value = path.basename(photo.path as String);
    Get.back();
  }

  void imageFromCamera() async {
    var photo = await getImageFromCamera();
    print(photo.path);
    isPhoto.value = true;
    // image = File(photo.path as String);
    // imagePath.value = photo.path as String;
    Get.back();
  }
}
