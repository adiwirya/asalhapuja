import 'dart:developer';

import 'package:asalhapuja/data/utils/utils.dart';
import 'package:asalhapuja/domain/db_helper.dart';
import 'package:asalhapuja/domain/models/models.dart';
import 'package:asalhapuja/presentation/widget/widgets.dart';
import 'package:asalhapuja/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:asalhapuja/domain/repository/server_repository.dart';
import 'package:dio/dio.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:restart_app/restart_app.dart';

class LoginController extends GetxController {
  final client = Server(
    Dio(
      BaseOptions(
        contentType: 'application/json',
      ),
    ),
  );
  final loginKey = GlobalKey<FormState>();
  TextEditingController nik = TextEditingController();
  TextEditingController password = TextEditingController();
  RxBool obscureText = true.obs;

  @override
  void onInit() {
    super.onInit();
    password.text = 'AsalHapujaF2023';
    nik.text = '0000000000000001';
  }

  Future<void> ceklogin() async {
    try {
      if (!loginKey.currentState!.validate()) {
        return;
      }
      Get.dialog(const LoadingDialog());
      if (gs.read('User') != null) {
        log('offline');
        final user = User.fromJson(gs.read('User') as Map<String, dynamic>);
        if (user.nik == nik.text && user.password == password.text) {
          await gs.write('IsLogin', 1);
          Get.offNamed(Routes.home);
        } else {
          // Get.back();
          Snackbar().error('NIK atau Password Salah');
          return;
        }
      } else {
        log('online');
        final connectivityResult = await Connectivity().checkConnectivity();
        if (connectivityResult == ConnectivityResult.none) {
          // Get.back();
          Snackbar().error('Tidak ada koneksi internet');
          return;
        }
        final data = {
          'nik': nik.text,
          'password': password.text,
        };
        final res = await client.login(data);
        if (res.message == 'Success Login') {
          final user = User.fromJson(res.data as Map<String, dynamic>);
          await gs.write('User', user.toJson());
          await gs.write('IsLogin', 1);
          for (final region in user.regions) {
            await DBHelper.instance.insertRegion(region);
          }
          await Restart.restartApp();
           Get.offNamed(Routes.home);
        } else {
          // Get.back();
          Snackbar().error('NIK atau Password Salah');
          return;
        }
      }
    } on DioError catch (e) {
      // Get.back();
      if (e.response!.statusCode == 401) {
        Snackbar().error('NIK atau Password Salah');
      } else {
        Snackbar().error(e.toString());
      }
      return;
    } catch (e) {
      // Get.back();
      Snackbar().error(e.toString());
      return;
    }
  }

  void showHide() {
    obscureText.value = !obscureText.value;
    update();
  }
}
