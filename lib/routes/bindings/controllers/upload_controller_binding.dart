import 'package:get/get.dart';

import 'package:asalhapuja/presentation/pages/upload/controllers/upload_controller.dart';

class UploadControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UploadController>(
      UploadController.new,
    );
  }
}
