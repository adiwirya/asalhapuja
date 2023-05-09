import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:get/get.dart';
import 'package:path/path.dart' as path;

Future<String> saveImage(File photo, String nik) async {
  final directory = await getApplicationDocumentsDirectory();
  var basename = path.basename(photo.path);
  final res = await photo.copy('${directory.path}/${nik}.jpg');
  log('res: $res');
  return res.path;
}

Future getImageFromCamera() async {
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

Future getImageFromgallery() async {
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
