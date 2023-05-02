import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:asalhapuja/presentation/pages/screens.dart';
import 'package:asalhapuja/routes/bindings/controllers/controllers_bindings.dart';
import 'package:asalhapuja/routes/app_routes.dart';

class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.home,
      page: () => const HomeScreen(),
      binding: HomeControllerBinding(),
    ),
  ];
}
