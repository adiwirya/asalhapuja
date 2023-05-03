import 'package:get/get.dart';
import 'package:asalhapuja/presentation/pages/login/controllers/login_controller.dart';

class LoginControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
  }
}
