import 'package:asalhapuja/data/utils/utils.dart';
import 'package:asalhapuja/presentation/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:asalhapuja/presentation/pages/login/controllers/login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(Const.login),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Image.asset(),
              const SizedBox(height: 16),
              MyTextFormField(
                controller: controller.email,
                hintText: Const.email,
              ),
              const SizedBox(height: 16),
              Obx(
                () => MyTextFormField(
                  controller: controller.password,
                  hintText: Const.password,
                  obscureText: controller.obscureText.value,
                  done: true,
                  suffixIcon: IconButton(
                    onPressed: controller.showHide,
                    icon: Icon(
                      controller.obscureText.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: controller.login,
                child: const Text(Const.login),
              ),
            ],
          ),
        ));
  }
}
