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
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
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
          responseBody: true,
          responseHeader: true,
          error: true,
          compact: true,
          maxWidth: 90,
          request: true,
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
    final databasePath = await getApplicationDocumentsDirectory();
    final directory = await getExternalStorageDirectory();

    await DBHelper.instance.closeDB();
    final dbpat = File(join(databasePath.path, 'asalhapuja.db'));
    await dbpat.copy('${directory!.path}/asahapulja.db');
    final db = File(join(directory.path, 'asahapulja.db'));
    await DBHelper.instance.openDB();

    Get.dialog(const LoadingDialog());
    var check = await testupload();
    // Get.back();
    if (check == 1) {
      if (count.value == forms.length) {
        blmUpload.value = await DBHelper.instance.getBlmUpload();
        Get.back();
        Snackbar().success('Upload Selesai');
        await Timer(const Duration(seconds: 3), () {});
      } else {
        blmUpload.value = await DBHelper.instance.getBlmUpload();
        var gagal = forms.length - count.value;
        Snackbar().error('Upload ada $gagal Gagal');
      }
    }
  }

  Future<int> testupload() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      Get.back();
      Snackbar().error('Tidak ada koneksi internet');
      await Timer(const Duration(seconds: 3), () {});
      return 0;
    }
    if (blmUpload.value == 0) {
      Get.back();
      Snackbar().error('Tidak ada data yang diupload');
      await Timer(const Duration(seconds: 3), () {});
      return 0;
    }
    for (var i = 0; i < forms.length; i++) {
      try {
        final result =
            forms[i].tahun_ikut.replaceAll('[', '').replaceAll(']', '');
        if (forms[i].isUpload == 0) {
          var log = await client.form(
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
            File(forms[i].photo),
          );
          print(log);
          count = count + 1;
          var msg = await DBHelper.instance.updatePeserta(forms[i].ktp);
          log(msg);
        }
        print('Count $count');
      } on DioError catch (e) {
        // Get.back();
        if (e.response!.statusCode == 302) {
          log('upload $i ${e.response!.statusCode}');
          var msg = await DBHelper.instance.updatePeserta(forms[i].ktp);
          log(msg);
          count = count + 1;

          continue;
        } else {
          Get.back();
          print(e.toString());
          Snackbar().error(e.toString());
          Timer(const Duration(seconds: 3), () {});
          continue;
        }
      } catch (e) {
        Get.back();
        Snackbar().error(e.toString());
        await Timer(const Duration(seconds: 3), () {});
        continue;
      }
    }
    return 1;
  }
}
