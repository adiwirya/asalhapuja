import 'package:asalhapuja/data/utils/theme.dart';
import 'package:asalhapuja/presentation/widget/mybutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:asalhapuja/presentation/pages/home/controllers/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen'),
        centerTitle: true,
      ),
      body: Center(
        child: MyButton(
          theme: buttonGreen,
          text: 'Form',
          onPressed: controller.form,
        ),
      ),
    );
  }
}
