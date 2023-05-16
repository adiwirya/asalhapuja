import 'package:get/get.dart';

import 'package:asalhapuja/presentation/pages/list/controllers/list_controller.dart';

class ListFormControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListController>(
      ListController.new,
    );
  }
}
