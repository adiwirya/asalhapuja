import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:asalhapuja/data/utils/utils.dart';
import 'package:asalhapuja/presentation/pages/splash/controllers/splash_controller.dart';
import 'package:asalhapuja/presentation/widget/widgets.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Text(
                controller.name,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(child: Image.asset(Assets.assetsImagesLogo)),
          ),
          const LogoVer(logo: false),
        ],
      ),
    );
  }
}
