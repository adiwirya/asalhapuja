import 'dart:async';

import 'package:get/get.dart';
import 'package:asalhapuja/data/utils/utils.dart';
import 'package:asalhapuja/routes/app_routes.dart';

class SplashController extends GetxController {
  static SplashController get to => Get.find();

  String name = 'Pendaftaran Peserta Group F';

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }
}

void session() async {
  if (gs.read('IsLogin') == null) {
    Get.offNamed(Routes.login);
  } else {
    Get.offNamed(Routes.home);
  }
}

Future<void> startTimer() async {
  Timer(const Duration(seconds: 2), session);
}
