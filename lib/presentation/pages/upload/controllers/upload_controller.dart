import 'dart:developer';
import 'dart:io';

import 'package:asalhapuja/domain/db_helper.dart';
import 'package:asalhapuja/domain/models/models.dart';
import 'package:asalhapuja/domain/repository/server_repository.dart';
import 'package:asalhapuja/presentation/widget/widgets.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class UploadController extends GetxController {
  RxList<Forms> forms = <Forms>[].obs;
  RxInt count = 0.obs;
  RxInt blmUpload = 0.obs;

  final client = Server(
    Dio(
      BaseOptions(
        contentType: 'application/json',
      ),
    ),
  );

  @override
  Future<void> onInit() async {
    forms.value = await DBHelper.instance.getPesertaAll();
    blmUpload.value = await DBHelper.instance.getBlmUpload();
    super.onInit();
  }

  void upload() async {
    Get.dialog(const LoadingDialog());
    var check = await testupload();
    // Get.back();
    if (check == 1) {
      Get.back();
      Snackbar().success('Upload Selesai');
    }
  }

  Future<int> testupload() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      Get.back();
      Snackbar().error('Tidak ada koneksi internet');
      return 0;
    }
    if (blmUpload.value == 0) {
      Get.back();
      Snackbar().error('Tidak ada data yang diupload');
      return 0;
    }
    for (var i = 0; i < forms.length; i++) {
      try {
        if (forms[i].isUpload == 0) {
          await client.form(
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
            File(forms[i].photo),
          );
          count = count + 1;
        }
        print('Count $count');
      } on DioError catch (e) {
        // Get.back();
        if (e.response!.statusCode == 302) {
          log('upload $i ${e.response!.statusCode}');
          var msg = await DBHelper.instance.updatePeserta(forms[i].ktp);
          log(msg);

          continue;
        } else {
          Snackbar().error(e.message!);
          print(e.toString());
          continue;
        }
      } catch (e) {
        // Get.back();
        Snackbar().error(e.toString());
        continue;
      }
    }
    return 1;
  }
}
