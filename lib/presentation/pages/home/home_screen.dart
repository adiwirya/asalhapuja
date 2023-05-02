import 'package:asalhapuja/data/utils/camera.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: ElevatedButton(
          onPressed: saveImage,
          child: Text('Camera'),
        ),
      ),
    );
  }
}
