import 'package:asalhapuja/data/utils/utils.dart';

import 'package:asalhapuja/domain/models/models.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  RxString name = ''.obs;
  RxString kota = ''.obs;

  final user = User.fromJson(gs.read('User') as Map<String, dynamic>);
  @override
  Future<void> onInit() async {
    name.value = user.nama;
    kota.value = user.kota;
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
