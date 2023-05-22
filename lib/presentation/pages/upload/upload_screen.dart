import 'package:asalhapuja/data/utils/utils.dart';
import 'package:asalhapuja/presentation/pages/upload/controllers/upload_controller.dart';
import 'package:asalhapuja/presentation/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class UploadScreen extends GetView<UploadController> {
  const UploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Const.upload),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 28),
            Center(
              child: SvgPicture.asset(Assets.assetsImagesUploadlogo),
            ),
            const SizedBox(height: 28),
            DecoratedBox(
              decoration: const BoxDecoration(
                color: Color(0xFFF0F1F3),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          Const.informasiUpload,
                          style: fs14fw500,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(Const.dataDB),
                        Obx(
                          () => Text(
                            '${controller.forms.length}',
                            style: fs14fw500,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(Const.dataUpload),
                        Obx(
                          () => Text(
                            '${controller.blmUpload}',
                            style: fs14fw500,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 28),
            MyButton(
              theme: buttonYellow,
              text: Const.upload,
              onPressed: () {
                controller.upload();
              },
            ),
          ],
        ),
      ),
    );
  }
}
