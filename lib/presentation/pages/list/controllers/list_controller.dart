import 'package:asalhapuja/data/utils/utils.dart';
import 'package:asalhapuja/domain/db_helper.dart';
import 'package:asalhapuja/domain/models/models.dart';
import 'package:get/get.dart';

class ListController extends GetxController {
  static ListController get to => Get.find();
  RxInt count = 1.obs;
  RxList<Region> listvihara = <Region>[].obs;
  RxString vihara = 'Semua'.obs;
  RxInt viharaId = 0.obs;
  RxList<Forms> peserta = <Forms>[].obs;
  final user = User.fromJson(gs.read('User') as Map<String, dynamic>);

  @override
  void onInit() async {
    listvihara
      ..value = await DBHelper.instance.getRegion()
      ..add(Region(id: 0, vihara: 'Semua'));
    peserta.value = await DBHelper.instance.getPesertaAll();
    print(peserta);
    
    super.onInit();
  }

  void setVihara(String value) async {
    vihara.value = value;
    if (value == 'Semua') {
      peserta.value = await DBHelper.instance.getPesertaAll();
    } else {
      peserta.value = await DBHelper.instance.getPeserta(value);
    }
  }

  toDetail(String nik) {}

  @override
  void onClose() {
    super.onClose();
  }
}
