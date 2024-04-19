import 'package:asalhapuja/data/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:asalhapuja/presentation/pages/home/controllers/home_controller.dart';
import 'package:remixicon/remixicon.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(243, 247, 250, 1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(
                Assets.assetsImagesCandi1,
              ),
              Positioned(
                top: height * 0.24,
                child: Obx(
                  () => Row(
                    children: [
                      DecoratedBox(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.horizontal(
                            right: Radius.circular(20),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hi, ${controller.name.value}',
                                style: fs16fw500,
                              ),
                              Text(
                                controller.kota.value,
                                style: fs12grayW500,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.3,
                      ),
                      GestureDetector(
                        onTap: () => Get.dialog(const SettingsDialog()),
                        child: DecoratedBox(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(20),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(
                                  Remix.logout_box_r_line,
                                  color: ThemeColors.warning,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  Const.logout,
                                  style: fs16fw500,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          RowMenu(
            asset: Assets.assetsImagesUserAdd,
            text: Const.tambahPeserta,
            onPressed: controller.form,
          ),
          RowMenu(
            asset: Assets.assetsImagesUpload,
            text: Const.uploadData,
            onPressed: controller.upload,
          ),
          RowMenu(
            asset: Assets.assetsImagesListdata,
            text: Const.listData,
            onPressed: controller.list,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Center(
                  child: Text(
                    '${Const.version} ${Const.appVersion}',
                    style: fs16fw500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RowMenu extends StatelessWidget {
  const RowMenu({
    required this.asset,
    required this.text,
    this.onPressed,
    super.key,
  });

  final String text;
  final String asset;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0, 1),
              ),
            ],
            color: Colors.white,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    SvgPicture.asset(asset),
                    const SizedBox(width: 24),
                    Text(
                      text,
                      style: fs14fw500,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingsDialog extends GetView<HomeController> {
  const SettingsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
                    const SizedBox(height: 8),
                    const Text(
                      'Anda yakin ingin keluar?',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Theme(
                          data: Theme.of(context)
                              .copyWith(elevatedButtonTheme: buttonRed),
                          child: ElevatedButton(
                            onPressed: () => Get.back(),
                            child: const Text('Tidak'),
                          ),
                        ),
                        Theme(
                          data: Theme.of(context)
                              .copyWith(elevatedButtonTheme: buttonGreen),
                          child: ElevatedButton(
                            onPressed: () => controller.logout(),
                            child: const Text('  Iya  '),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
 // Expanded(
          //   child: Padding(
          //     padding: const EdgeInsets.only(
          //       left: 16,
          //       right: 16,
          //     ),
          //     child: Material(
          //       child: Padding(
          //         padding: const EdgeInsets.symmetric(
          //           horizontal: 16,
          //           vertical: 8,
          //         ),
          //         child: Row(
          //           children: [
          //             SvgPicture.asset(Assets.assetsImagesVihara),
          //             const SizedBox(width: 16),
          //             Text(
          //               controller.user.kota,
          //               style: fs14fw400,
          //             ),
          //             Expanded(child: Container()),
          //             Text(
          //               controller.user.quota.toString(),
          //               style: fs14fw400Green,
          //             ),
          //             const SizedBox(width: 8),
          //             Text(
          //               controller.user.sisa.toString(),
          //               style: fs14fw400Red,
          //             ),
          //           ],
          //         ),
          //       ),
                // child: Obx(
                //   () => ListView.builder(
                //     shrinkWrap: true,
                //     itemCount: controller.regions.length,
                //     itemBuilder: (context, index) {
                //       return Padding(
                //         padding: const EdgeInsets.symmetric(
                //           horizontal: 16,
                //           vertical: 8,
                //         ),
                //         child: Row(
                //           children: [
                //             SvgPicture.asset(Assets.assetsImagesVihara),
                //             const SizedBox(width: 16),
                //             Text(
                //               controller.user.kota,
                //               style: fs14fw400,
                //             ),
                //             Expanded(child: Container()),
                //             Text(
                //               controller.user.qouta.toString(),
                //               style: fs14fw400Green,
                //             ),
                //             const SizedBox(width: 8),
                //             Text(
                //               controller.user.sisa.toString(),
                //               style: fs14fw400Red,
                //             ),
                //           ],
                //         ),
                //       );
                // return ListTile(
                //   leading: SvgPicture.asset(
                //     Assets.assetsImagesVihara,
                //   ),
                //   tileColor: Colors.white,
                //   title: Text(
                //     controller.regions[index].vihara,
                //     style: fs16fw500,
                //   ),
                //   trailing: Text(
                //     controller.regions[index].quota.toString(),
                //     style: fs14fw600Green,
                //   ),
                // );
        //       ),
        //     ),
        //   ),
