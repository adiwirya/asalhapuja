import 'package:asalhapuja/data/utils/utils.dart';
import 'package:asalhapuja/domain/db_helper.dart';
import 'package:asalhapuja/domain/models/models.dart';
import 'package:asalhapuja/presentation/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListController extends GetxController {
  static ListController get to => Get.find();
  RxInt count = 1.obs;
  RxList<Region> listvihara = <Region>[].obs;
  RxString vihara = 'Semua'.obs;
  RxInt viharaId = 0.obs;
  RxList<Forms> peserta = <Forms>[].obs;
  User user = User.fromJson(gs.read('User') as Map<String, dynamic>);
  RxInt sisa = 0.obs;
  @override
  Future<void> onInit() async {
    await DBHelper.instance.openDB();
    listvihara
      ..value = await DBHelper.instance.getRegion()
      ..add(Region(id: 0, vihara: 'Semua'));
    peserta.value = await DBHelper.instance.getPesertaAll();
    print(peserta);
    sisa.value = user.quota_sisa;
    await DBHelper.instance.closeDB();
    super.onInit();
  }

  Future<void> setVihara(String value) async {
    await DBHelper.instance.openDB();
    vihara.value = value;
    if (value == 'Semua') {
      peserta.value = await DBHelper.instance.getPesertaAll();
    } else {
      peserta.value = await DBHelper.instance.getPeserta(value);
    }
    await DBHelper.instance.closeDB();
  }

  toDetail(String nik) {}

  Future<void> hapus(String id) async {
    await DBHelper.instance.openDB();
    await DBHelper.instance.deletePeserta(id);
    user.quota_sisa = user.quota_sisa + 1;
    sisa.value = user.quota_sisa;
    final temp = gs.read('User');
    temp['quota_sisa'] = user.quota_sisa;
    await gs.write('User', temp);
    peserta.value = await DBHelper.instance.getPesertaAll();
    Snackbar().success('Data berhasil dihapus');
    update();
    await DBHelper.instance.closeDB();
  }

  Future<void> setActive(String ktp, int active) async {
    if (active == 1) {
      active = 0;
      user.quota_sisa = user.quota_sisa + 1;
      sisa.value = user.quota_sisa;
      final temp = gs.read('User');
      temp['quota_sisa'] = user.quota_sisa;
      await gs.write('User', temp);
    } else {
      active = 1;
      user.quota_sisa = user.quota_sisa - 1;
      sisa.value = user.quota_sisa;
      final temp = gs.read('User');
      temp['quota_sisa'] = user.quota_sisa;
      await gs.write('User', temp);
    }
    await DBHelper.instance.openDB();
    await DBHelper.instance.updateActive(ktp, active);
    peserta.value = await DBHelper.instance.getPesertaAll();
    update();
    await DBHelper.instance.closeDB();
  }
}
