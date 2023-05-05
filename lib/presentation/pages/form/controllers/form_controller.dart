import 'package:get/get.dart';
import 'package:flutter/material.dart';

class FormController extends GetxController {
  final formKey = GlobalKey<FormState>();
  TextEditingController ktp = TextEditingController();
  TextEditingController nama = TextEditingController();
  TextEditingController namaCetak = TextEditingController();
  TextEditingController alamat = TextEditingController();
  TextEditingController nohp = TextEditingController();
  TextEditingController organization = TextEditingController();
  RxString meal = ''.obs;
  RxString jenisKelamin = ''.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void submit() {}
  void setMeal(String value) {
    meal.value = value;
  }

  void setJenis(String value) {
    jenisKelamin.value = value;
  }
}
