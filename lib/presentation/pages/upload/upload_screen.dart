import 'package:asalhapuja/data/utils/utils.dart';
import 'package:asalhapuja/presentation/pages/upload/controllers/upload_controller.dart';
import 'package:asalhapuja/presentation/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remixicon/remixicon.dart';

class UploadScreen extends GetView<UploadController> {
  const UploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 28),
            const Center(
              child: Icon(Remix.file_upload_fill, size: 100),
            ),
            const SizedBox(height: 28),
            const Text(
              '',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 28),
            MyButton(
              theme: buttonGreen,
              text: 'Upload',
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
