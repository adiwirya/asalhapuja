import 'package:get/get.dart';

import 'package:asalhapuja/presentation/pages/form/controllers/form_controller.dart';

class FormControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FormController>(
      FormController.new,
    );
  }
}
