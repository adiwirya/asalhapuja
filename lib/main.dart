import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:asalhapuja/routes/app_pages.dart';
import 'package:asalhapuja/routes/app_routes.dart';
import 'package:asalhapuja/data/utils/theme.dart';

import 'package:asalhapuja/domain/db_helper.dart';

void main() async {
  final initialRoute = await Routes.initialRoute;
  DBHelper.instance;
  await GetStorage.init();
  runApp(Main(initialRoute));
}

class Main extends StatelessWidget {
  final String initialRoute;
  const Main(this.initialRoute, {super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: asalha,
      initialRoute: initialRoute,
      getPages: Nav.routes,
    );
  }
}
