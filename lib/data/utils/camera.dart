import 'dart:developer';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:get/get.dart';

Future<String> saveImage(File photo, String nik) async {
  final directory = await getApplicationDocumentsDirectory();
  final res = await photo.copy('${directory.path}/$nik.jpg');
  log('res: $res');
  return res.path;
}

Future<dynamic> getImageFromCamera() async {
  try {
    final picker = ImagePicker();
    final photo = await picker.pickImage(
      source: ImageSource.camera,
      maxHeight: 3000,
      maxWidth: 3000,
      imageQuality: 25,
    );
    return photo;
  } catch (e) {
    Get.snackbar(
      'Error',
      'No image selected',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}

Future<dynamic> getImageFromgallery() async {
  try {
    final picker = ImagePicker();
    final photo = await picker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 3000,
      maxWidth: 3000,
      imageQuality: 25,
    );
    return photo;
  } catch (e) {
    Get.snackbar(
      'Error',
      'No image selected',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
