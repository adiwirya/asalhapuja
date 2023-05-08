import 'package:asalhapuja/data/utils/theme.dart';
import 'package:asalhapuja/data/utils/utils.dart';
import 'package:asalhapuja/presentation/widget/logoVer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:asalhapuja/presentation/pages/home/controllers/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);
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
                top: 200,
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
                        controller.name.value,
                        style: fs16fw600,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => controller.form(),
                  child: Card(
                    surfaceTintColor: Colors.white,
                    child: SizedBox(
                      width: width / 2.2,
                      height: 190,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset(Assets.assetsImagesUserAdd),
                            const SizedBox(height: 14),
                            Text(
                              Const.tambahPeserta,
                              style: fs16fw600,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              Const.deskform,
                              style: fs10gray,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => controller.logout(),
                  child: Card(
                    surfaceTintColor: Colors.white,
                    child: SizedBox(
                      width: width / 2.2,
                      height: 190,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset(Assets.assetsImagesLogout),
                            const SizedBox(height: 14),
                            Text(
                              Const.logout,
                              style: fs16fw600,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              Const.keluar,
                              style: fs10gray,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
            child: Text(Const.infoVihara, style: fs16fw600),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
              ),
              child: Obx(
                () => ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.regions.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: SvgPicture.asset(
                        Assets.assetsImagesVihara,
                      ),
                      tileColor: Colors.white,
                      title: Text(
                        controller.regions[index].vihara,
                        style: fs16fw600,
                      ),
                      trailing: Text(
                        controller.regions[index].quota.toString(),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
