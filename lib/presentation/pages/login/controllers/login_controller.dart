import 'dart:async';
import 'dart:developer';

import 'package:asalhapuja/data/utils/utils.dart';
import 'package:asalhapuja/domain/db_helper.dart';
import 'package:asalhapuja/domain/models/models.dart';
import 'package:asalhapuja/presentation/widget/widgets.dart';
import 'package:asalhapuja/routes/app_routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:asalhapuja/domain/repository/server_repository.dart';
import 'package:dio/dio.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class LoginController extends GetxController {
  final client = Server(
    Dio(BaseOptions(contentType: 'application/json'))
      ..interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
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
    if (kDebugMode) {
      password.text = 'AsalHapujaF2023';
      nik.text = '0000000000000001';
    }
  }

  Future<void> ceklogin() async {
    await DBHelper.instance.openDB();
    try {
      if (!loginKey.currentState!.validate()) {
        Snackbar().error('Input Tidak valid');
        return;
      }
      unawaited(Get.dialog(const LoadingDialog()));
      if (gs.read('User') != null) {
        log('offline');
        final user = User.fromJson(gs.read('User') as Map<String, dynamic>);
        if (user.nik == nik.text && user.password == password.text) {
          await gs.write('IsLogin', 1);
          Snackbar().success('Login Berhasil');
          await DBHelper.instance.closeDB();
          await Get.offAllNamed(Routes.home);
        } else {
          Get.back();
          Snackbar().error('NIK atau Password Salah');
          return;
        }
      } else {
        log('online');
        final connectivityResult = await Connectivity().checkConnectivity();
        if (connectivityResult == ConnectivityResult.none) {
          Get.back();
          Snackbar().error('Tidak ada koneksi internet');
          return;
        }
        final data = {'nik': nik.text, 'password': password.text};
        final res = await client.login(data);
        if (res.message == 'Success Login') {
          await gs.write('User', res.data);
          final user = User.fromJson(res.data as Map<String, dynamic>);

          await gs.write('IsLogin', 1);
          for (final region in user.regions) {
            await DBHelper.instance.insertRegion(region);
          }
          for (final peserta in user.peserta) {
            final form = Forms.fromJson(peserta.toJson());
            await DBHelper.instance.insertPeserta(form);
            await DBHelper.instance.updatePeserta(form.ktp);
            await DBHelper.instance.updateFotoPath(form.ktp, form.photo);
            await downloadImage(form.photo);
          }

          final nik = await client.getNik(data);
          for (final peserta in nik) {
            await DBHelper.instance.insertNIK(peserta);
          }

          // await Restart.restartApp();
          await DBHelper.instance.closeDB();
          await Get.offAllNamed(Routes.home);
        } else {
          Get.back();
          Snackbar().error('NIK atau Password Salah');
          return;
        }
      }
    } on DioException catch (e) {
      Get.back();
      if (e.response!.statusCode == 401) {
        Snackbar().error('NIK atau Password Salah');
      } else {
        Snackbar().error(e.toString());
      }
      return;
    } catch (e) {
      Get.back();
      Snackbar().error(e.toString());
      return;
    }
  }

  void showHide() {
    obscureText.value = !obscureText.value;
    update();
  }
}
