import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:asalhapuja/routes/app_pages.dart';
import 'package:asalhapuja/routes/app_routes.dart';
import 'package:asalhapuja/data/utils/theme.dart';

void main() async {
  final initialRoute = await Routes.initialRoute;
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
