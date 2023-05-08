import 'package:get/get.dart';
import 'package:asalhapuja/presentation/pages/splash/controllers/splash_controller.dart';

class SplashControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(SplashController.new, fenix: true);
  }
}
