import 'package:asalhapuja/presentation/pages/splash/splash_screen.dart';
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
    GetPage(
      name: Routes.form,
      page: () => const FormScreen(),
      binding: FormControllerBinding(),
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginScreen(),
      binding: LoginControllerBinding(),
    ),
    GetPage(
      name: Routes.splash,
      page: () => const SplashScreen(),
      binding: SplashControllerBinding(),
    ),
  ];
}
