import 'package:asalhapuja/data/utils/utils.dart';
import 'package:asalhapuja/domain/models/form.dart';
import 'package:asalhapuja/presentation/pages/list/controllers/list_controller.dart';
import 'package:asalhapuja/presentation/widget/mydropdownsearch.dart';
import 'package:asalhapuja/presentation/widget/widgets.dart';
import 'package:asalhapuja/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remixicon/remixicon.dart';

class ListScreen extends GetView<ListController> {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(243, 247, 250, 1),
      appBar: AppBar(title: const Text(Const.listData)),
      body: Column(
        children: [
          DecoratedBox(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(8)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0, 1),
                  spreadRadius: 1,
                  blurRadius: 4,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Obx(
                    () => MyDropdownSearch(
                      hint: 'Vihara',
                      icon: const Icon(
                        Remix.arrow_drop_down_line,
                      ),
                      selectedItem: controller.vihara.value,
                      onChanged: (value) => controller.setVihara(value!),
                      items: (String filter) async {
                        return controller.listvihara
                            .map((e) => e.vihara)
                            .toList();
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        Const.kouta,
                        style: fs14gray,
                      ),
                      Text(
                        '${controller.user.quota_maksimal} ${Const.data}',
                        style: fs14gray,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        Const.koutaSisa,
                        style: fs14gray,
                      ),
                      Obx(
                        () => Text(
                          '${controller.sisa} ${Const.data}',
                          style: fs14gray,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        Const.banyakData,
                        style: fs14gray,
                      ),
                      Obx(
                        () => Text(
                          '${controller.peserta.length} ${Const.data}',
                          style: fs14gray,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Divider(color: Color(0xFFF0F1F3), thickness: 1),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 16,
                            height: 16,
                            color: ThemeColors.success,
                          ),
                          const SizedBox(width: 8),
                          const Text(Const.dataServer),
                        ],
                      ),
                      const SizedBox(width: 24),
                      Row(
                        children: [
                          Container(
                            width: 16,
                            height: 16,
                            color: ThemeColors.error,
                          ),
                          const SizedBox(width: 8),
                          const Text(Const.dataLokal),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Obx(
            () => controller.peserta.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) =>
                          GestureDetector(
                        onTap: () => Get.toNamed(
                          Routes.form,
                          arguments: controller.peserta[index].ktp,
                        ),
                        child: listCard(
                          peserta: controller.peserta[index],
                          index: index + 1,
                        ),
                      ),
                      itemCount: controller.peserta.length,
                    ),
                  )
                : Center(
                    child: Text(
                      'Tidak Ada Data',
                      style: fs16fw500,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

class listCard extends StatelessWidget {
  const listCard({
    required this.index,
    required this.peserta,
    super.key,
  });

  final int index;
  final Forms peserta;

  @override
  Widget build(BuildContext context) {
    final controller = ListController.to;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 4,
      ),
      child: Dismissible(
        direction: DismissDirection.endToStart,
        key: UniqueKey(),
        onDismissed: (direction) {
          controller.hapus(peserta.ktp);
          return;
        },
        confirmDismiss: (direction) async {
          var check = false;
          if (direction == DismissDirection.endToStart) {
            await Get.dialog(
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: DecoratedBox(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Material(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Lottie.asset(Assets.assetsLottieNotFound),
                              const Text(
                                'Hapus Data ?',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                'Anda yakin ingin menghapus detail data terpilih ?',
                              ),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  Expanded(
                                    child: Theme(
                                      data: Theme.of(context).copyWith(
                                        elevatedButtonTheme: buttonRed,
                                      ),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          check = true;
                                          Get.back();
                                        },
                                        child: const Text(
                                          'Hapus',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Theme(
                                      data: Theme.of(context).copyWith(
                                        elevatedButtonTheme: buttonSuccess,
                                      ),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          check = false;
                                          Get.back();
                                        },
                                        child: const Text(
                                          'Kembali',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
            return check;
          }
          return null;
        },
        background: const ColoredBox(
          color: Colors.red,
          child: Icon(
            Remix.delete_bin_line,
            color: Colors.white,
          ),
        ),
        child: Stack(
          children: [
            Card(
              surfaceTintColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                color: ThemeColors.warning,
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            Text(
                              '$index',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  peserta.name,
                                  style: fs14fw500,
                                ),
                              ),
                              if (peserta.isUpload == 1)
                                Container(
                                  width: 8,
                                  height: 16,
                                  color: ThemeColors.success,
                                )
                              else
                                Container(
                                  width: 8,
                                  height: 16,
                                  color: ThemeColors.error,
                                ),
                            ],
                          ),
                          const SizedBox(width: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                peserta.ktp,
                                style: fs12gray,
                              ),
                              if (peserta.gender == 'L')
                                Text(
                                  '(Laki-Laki)',
                                  style: fs12gray,
                                )
                              else
                                Text(
                                  '(Perempuan)',
                                  style: fs12gray,
                                ),
                            ],
                          ),
                          const SizedBox(width: 8),
                          Text(
                            peserta.organization,
                            style: fs12gray,
                          ),
                          const SizedBox(width: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              if (peserta.meal == 'V')
                                Text(
                                  Const.vegetarian,
                                  style: fs12gray,
                                )
                              else
                                Text(
                                  Const.nonVegetarian,
                                  style: fs12gray,
                                ),
                              SizedBox(
                                height: 26,
                                child: FittedBox(
                                  fit: BoxFit.fill,
                                  child: Switch(
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    activeColor: Colors.white,
                                    activeTrackColor: ThemeColors.success,
                                    inactiveThumbColor: ThemeColors.gray,
                                    value: peserta.active == 1 ? true : false,
                                    onChanged: (value) {
                                      controller.setActive(
                                        peserta.ktp,
                                        peserta.active,
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
