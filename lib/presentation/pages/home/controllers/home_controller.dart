import 'package:asalhapuja/data/utils/utils.dart';
import 'package:asalhapuja/domain/models/models.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  RxString name = ''.obs;
  RxList<Region> regions = <Region>[].obs;
  @override
  void onInit() {
    User user = User.fromJson(gs.read('User') as Map<String, dynamic>);

    name.value = user.nama!;
    regions.value = user.regions!;
    super.onInit();
  }

  void form() {
    Get.toNamed('/form');
  }

  void logout() {
    gs.remove('IsLogin');
    Get.offNamed('/login');
  }
}
