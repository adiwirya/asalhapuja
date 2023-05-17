import 'package:asalhapuja/data/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:asalhapuja/presentation/pages/home/controllers/home_controller.dart';

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
                top: height * 0.27,
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Obx(
                      () => Text(
                        'Hi, ${controller.name.value}',
                        style: fs16fw600,
                      ),
                    ),
                  ),
                ),
              )
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
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
            child: Text(Const.infoVihara, style: fs16fw600),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
            child: Row(
              children: [
                Row(
                  children: [
                    Container(
                      width: 16,
                      height: 16,
                      color: ThemeColors.success,
                    ),
                    const SizedBox(width: 8),
                    const Text(Const.koutaTersedia),
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
                    const Text(Const.koutaHabis),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
              ),
              child: Material(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(Assets.assetsImagesVihara),
                      const SizedBox(width: 16),
                      Text(
                        controller.user.kota,
                        style: fs14fw400,
                      ),
                      Expanded(child: Container()),
                      Text(
                        controller.user.quota.toString(),
                        style: fs14fw400Green,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        controller.user.sisa.toString(),
                        style: fs14fw400Red,
                      ),
                    ],
                  ),
                ),
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
                //     style: fs16fw600,
                //   ),
                //   trailing: Text(
                //     controller.regions[index].quota.toString(),
                //     style: fs14fw600Green,
                //   ),
                // );
              ),
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
        padding: const EdgeInsets.all(8),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
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
                      style: fs14fw600,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
