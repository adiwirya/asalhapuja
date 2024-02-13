import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:asalhapuja/domain/db_helper.dart';
import 'package:asalhapuja/domain/models/models.dart';
import 'package:asalhapuja/domain/repository/server_repository.dart';
import 'package:asalhapuja/presentation/widget/widgets.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class UploadController extends GetxController {
  RxList<Forms> forms = <Forms>[].obs;
  RxInt count = 0.obs;
  RxInt blmUpload = 0.obs;

  final client = Server(
    Dio(
      BaseOptions(
        contentType: 'multipart/form-data',
      ),
    )..interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
        ),
      ),
  );

  @override
  Future<void> onInit() async {
    await DBHelper.instance.openDB();
    forms.value = await DBHelper.instance.getPesertaAll();
    blmUpload.value = await DBHelper.instance.getBlmUpload();
    await DBHelper.instance.closeDB();
    super.onInit();
  }

  Future<void> upload() async {
    unawaited(Get.dialog(const LoadingDialog()));
    final check = await testupload();
    // Get.back();
    if (check == 1) {
      if (count.value == forms.length) {
        await DBHelper.instance.openDB();
        blmUpload.value = await DBHelper.instance.getBlmUpload();
        Get.back();
        await DBHelper.instance.closeDB();
        Snackbar().success('Upload Selesai');
        Timer(const Duration(seconds: 3), () {});
      } else {
        await DBHelper.instance.openDB();
        blmUpload.value = await DBHelper.instance.getBlmUpload();
        final gagal = forms.length - count.value;
        await DBHelper.instance.closeDB();
        Snackbar().error('Upload ada $gagal Gagal');
      }
    }
  }

  Future<int> testupload() async {
    await DBHelper.instance.openDB();
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      Get.back();
      Snackbar().error('Tidak ada koneksi internet');
      Timer(const Duration(seconds: 3), () {});
      return 0;
    }
    if (blmUpload.value == 0) {
      Get.back();
      Snackbar().error('Tidak ada data yang diupload');
      Timer(const Duration(seconds: 3), () {});
      return 0;
    }
    for (var i = 0; i < forms.length; i++) {
      try {
        final result =
            forms[i].tahun_ikut.replaceAll('[', '').replaceAll(']', '');
        if (forms[i].isUpload == 0) {
          final log = await client.form(
            forms[i].region_f_id,
            forms[i].nik_koordinator,
            forms[i].organization,
            forms[i].ktp,
            forms[i].name,
            forms[i].printed_name,
            forms[i].gender,
            forms[i].address,
            forms[i].phone_number,
            forms[i].meal,
            result,
            forms[i].active,
            File(forms[i].photo),
          );
          print(log);
          count = count + 1;
          final msg = await DBHelper.instance.updatePeserta(forms[i].ktp);
          log(msg);
        }
        print('Count $count');
      } on DioError catch (e) {
        // Get.back();
        if (e.response!.statusCode == 302) {
          log('upload $i ${e.response!.statusCode}');
          final msg = await DBHelper.instance.updatePeserta(forms[i].ktp);
          log(msg);
          count = count + 1;

          continue;
        } else {
          Get.back();
          print(e);
          Snackbar().error(e.toString());
          Timer(const Duration(seconds: 3), () {});
          continue;
        }
      } catch (e) {
        Get.back();
        Snackbar().error(e.toString());
        Timer(const Duration(seconds: 3), () {});
        continue;
      }
    }
    await DBHelper.instance.closeDB();
    return 1;
  }
}
