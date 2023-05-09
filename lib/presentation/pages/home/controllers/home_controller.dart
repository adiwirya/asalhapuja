import 'package:asalhapuja/data/utils/utils.dart';
import 'package:asalhapuja/domain/db_helper.dart';
import 'package:asalhapuja/domain/models/models.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  RxString name = ''.obs;
  RxList<Region> regions = <Region>[].obs;
  @override
  void onInit() async {
    User user = User.fromJson(gs.read('User') as Map<String, dynamic>);

    name.value = user.nama;
    regions.value = await DBHelper.instance.getRegion();
    var data = await DBHelper.instance.getPeserta();
    print(data);
    print(regions.value);
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
