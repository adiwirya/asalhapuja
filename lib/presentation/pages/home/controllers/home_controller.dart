import 'dart:developer';

import 'package:asalhapuja/data/utils/utils.dart';
import 'package:asalhapuja/domain/db_helper.dart';
import 'package:asalhapuja/domain/models/models.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  RxString name = ''.obs;
  RxList<Region> regions = <Region>[].obs;

  @override
  Future<void> onInit() async {
    final user = User.fromJson(gs.read('User') as Map<String, dynamic>);

    name.value = user.nama;
    regions.value = await DBHelper.instance.getRegion();
    super.onInit();
  }

  void form() {
    Get.toNamed('/form');
  }

  void list() {
    Get.toNamed('/list');
  }

  void upload() {
    Get.toNamed('/upload');
  }
}
