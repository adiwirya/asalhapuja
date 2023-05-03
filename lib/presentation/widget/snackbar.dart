import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:asalhapuja/data/utils/colors.dart';

class Snackbar {
  void success(String message) {
    Get.rawSnackbar(
      message: message,
      duration: const Duration(seconds: 2),
      backgroundColor: ThemeColors.gray.shade900,
      borderRadius: 6,
      margin: const EdgeInsets.all(8),
    );
  }

  void error(String message) {
    Get.rawSnackbar(
      message: message,
      backgroundColor: ThemeColors.error.shade500,
      duration: const Duration(seconds: 4),
      borderRadius: 6,
      margin: const EdgeInsets.all(8),
    );
  }
}
