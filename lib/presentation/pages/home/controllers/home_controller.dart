import 'dart:developer';
import 'dart:io';

import 'package:asalhapuja/data/utils/utils.dart';
import 'package:asalhapuja/domain/db_helper.dart';
import 'package:asalhapuja/domain/models/models.dart';
import 'package:asalhapuja/domain/repository/server_repository.dart';
import 'package:asalhapuja/presentation/widget/widgets.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  RxString name = ''.obs;
  RxList<Region> regions = <Region>[].obs;
  RxList<Forms> forms = <Forms>[].obs;
  final client = Server(
    Dio(
      BaseOptions(
        contentType: 'application/json',
      ),
    ),
  );
  @override
  Future<void> onInit() async {
    final user = User.fromJson(gs.read('User') as Map<String, dynamic>);

    name.value = user.nama;
    regions.value = await DBHelper.instance.getRegion();
    forms.value = await DBHelper.instance.getPeserta();
    log(forms.toString());
    super.onInit();
  }

  void form() {
    Get.toNamed('/form');
  }

  void upload() async {
    Get.dialog(LoadingDialog());
    await testupload();
    Get.back();
    // Get.toNamed('/upload');
  }

  Future<void> testupload() async {
    int count = 0;
    if (forms.length == 0) {
      Snackbar().error('Tidak ada data yang diupload');
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
          if (count == forms.length) {
            Snackbar().success('Upload Selesai');
          }
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
  }
}
