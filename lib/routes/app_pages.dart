import 'package:get/get.dart';

import 'package:asalhapuja/presentation/pages/screens.dart';
import 'package:asalhapuja/routes/bindings/controllers/controllers_bindings.dart';
import 'package:asalhapuja/routes/app_routes.dart';

class Nav {
  static List<GetPage<dynamic>> routes = [
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
    GetPage(
      name: Routes.upload,
      page: () => const UploadScreen(),
      binding: UploadControllerBinding(),
    ),
    GetPage(
      name: Routes.list,
      page: () => const ListScreen(),
      binding: ListFormControllerBinding(),
    ),
    // GetPage(
    //   name: Routes.edit,
    //   page: () => const EditScreen(),
    //   binding: EditFormControllerBinding(),
    // ),
  ];
}
