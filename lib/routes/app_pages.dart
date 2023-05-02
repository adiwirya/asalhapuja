import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:patrol/presentation/pages/screens.dart';
import 'package:patrol/routes/bindings/controllers/controllers_bindings.dart';
import 'package:patrol/routes/app_routes.dart';

class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.home,
      page: () => const HomeScreen(),
      binding: HomeControllerBinding(),
    ),
  ];
}
