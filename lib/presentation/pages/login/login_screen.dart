import 'package:asalhapuja/data/utils/utils.dart';
import 'package:asalhapuja/presentation/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:asalhapuja/presentation/pages/login/controllers/login_controller.dart';
import 'package:remixicon/remixicon.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            Const.login,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const SizedBox(height: 16),
                // Image.asset(Assets.assetsImagesLogo),
                const SizedBox(height: 16),
                const Text(Const.nik),
                const SizedBox(height: 16),
                MyTextFormField(
                  controller: controller.nik,
                  hintText: Const.nik,
                ),
                const SizedBox(height: 16),
                const Text(Const.password),
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
                            ? Remix.eye_line
                            : Remix.eye_off_line,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                MyButton(
                  theme: buttonGreen,
                  onPressed: controller.ceklogin,
                  text: Const.login,
                ),
              ],
            ),
          ),
        ));
  }
}
