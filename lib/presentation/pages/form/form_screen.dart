import 'dart:io';

import 'package:asalhapuja/data/utils/utils.dart';
import 'package:asalhapuja/presentation/pages/photo/photo_screen.dart';
import 'package:asalhapuja/presentation/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:asalhapuja/presentation/pages/form/controllers/form_controller.dart';
import 'package:remixicon/remixicon.dart';

class FormScreen extends GetView<FormController> {
  const FormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(controller.title.value)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(Const.uploadFoto, style: fs14fw500),
                    Text(Const.contohFoto, style: fs14fw500),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Obx(
                          () => Container(
                            width: 80,
                            height: 80,
                            color: ThemeColors.gray.shade50,
                            child:
                                controller.isPhoto.value
                                    ? Image.file(
                                      File(controller.imagePath.value),
                                      fit: BoxFit.cover,
                                    )
                                    : Center(
                                      child: Icon(
                                        Remix.image_fill,
                                        color: ThemeColors.gray.shade200,
                                        size: 30,
                                      ),
                                    ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          children: [
                            Theme(
                              data: Theme.of(
                                context,
                              ).copyWith(elevatedButtonTheme: buttonGreen),
                              child: ElevatedButton(
                                onPressed: () => controller.imageFromGallery(),
                                child: const Text(
                                  Const.galeri,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            Theme(
                              data: Theme.of(
                                context,
                              ).copyWith(elevatedButtonTheme: buttonGreen),
                              child: ElevatedButton(
                                onPressed: () => controller.imageFromCamera(),
                                child: const Text(
                                  Const.kamera,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Image.asset(
                      Assets.assetsImagesContohFoto,
                      width: 80,
                      height: 80,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(Const.kota, style: fs14fw500),
                const SizedBox(height: 16),
                Obx(
                  () => MyDropdownSearch(
                    hint: Const.deskvihara,
                    icon: const Icon(Remix.arrow_down_s_line),
                    selectedItem: controller.vihara.value,
                    onChanged: (value) => controller.setVihara(value!),
                    items: controller.listRegion.map((e) => e.vihara).toList(),
                  ),
                ),
                const SizedBox(height: 16),
                Text(Const.noKTP, style: fs14fw500),
                const SizedBox(height: 16),
                if (controller.isEdit.value)
                  MyTextFormField(
                    controller: controller.ktp,
                    hintText: Const.desknoKTP,
                    maxLength: 16,
                    enabled: false,
                  )
                else
                  MyTextFormField(
                    keyType: TextInputType.number,
                    controller: controller.ktp,
                    hintText: Const.desknoKTP,
                    onChanged: (value) => controller.cekNik(value),
                    maxLength: 16,
                  ),
                const SizedBox(height: 16),
                Text(Const.namaLengkap, style: fs14fw500),
                const SizedBox(height: 16),
                if (controller.isEdit.value)
                  MyTextFormField(
                    controller: controller.nama,
                    hintText: Const.desknamaLengkap,
                    onChanged: (value) => controller.setNamaCetak(value),
                    enabled: false,
                  )
                else
                  MyTextFormField(
                    controller: controller.nama,
                    hintText: Const.desknamaLengkap,
                    onChanged: (value) => controller.setNamaCetak(value),
                  ),
                const SizedBox(height: 16),
                Text(Const.namaCetak, style: fs14fw500),
                const SizedBox(height: 16),
                if (controller.isEdit.value)
                  MyTextFormField(
                    controller: controller.namaCetak,
                    hintText: Const.desknamaCetak,
                    maxLength: 25,
                    enabled: false,
                  )
                else
                  MyTextFormField(
                    controller: controller.namaCetak,
                    hintText: Const.desknamaCetak,
                    maxLength: 25,
                  ),
                const SizedBox(height: 16),
                Text(Const.jenisKelamin, style: fs14fw500),
                const SizedBox(height: 16),
                Obx(
                  () => Row(
                    children: [
                      Radio(
                        value: Const.l,
                        groupValue: controller.jenisKelamin.value,
                        onChanged: (value) => controller.setJenis(value!),
                      ),
                      const Text(Const.laki),
                      const SizedBox(width: 40),
                      Radio(
                        value: Const.p,
                        groupValue: controller.jenisKelamin.value,
                        onChanged: (value) => controller.setJenis(value!),
                      ),
                      const Text(Const.perempuan),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Text(Const.ukuranKaos, style: fs14fw500),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Obx(
                      () => Expanded(
                        child: MyDropdownSearch(
                          hint: Const.deskvihara,
                          icon: const Icon(Remix.arrow_down_s_line),
                          selectedItem: controller.size.value,
                          onChanged:
                              (value) => controller.size.value = value ?? '',
                          items: controller.listSize.map((e) => e).toList(),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap:
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => const PhotoScreen(
                                    Assets.assetsImagesSizekaos,
                                  ),
                            ),
                          ),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: ThemeColors.warning,
                        ),
                        child: const Icon(
                          Remix.ruler_line,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Obx(
                  () =>
                      controller.isNew.value
                          ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(Const.ukuranBaju, style: fs14fw500),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  Obx(
                                    () => Expanded(
                                      child: MyDropdownSearch(
                                        hint: Const.deskvihara,
                                        icon: const Icon(
                                          Remix.arrow_down_s_line,
                                        ),
                                        selectedItem: controller.celana.value,
                                        onChanged:
                                            (value) =>
                                                controller.celana.value =
                                                    value ?? '',
                                        items:
                                            controller.listCelana
                                                .map((e) => e)
                                                .toList(),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  GestureDetector(
                                    onTap:
                                        () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder:
                                                (context) => const PhotoScreen(
                                                  Assets
                                                      .assetsImagesSizeBajuPutih,
                                                ),
                                          ),
                                        ),
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: ThemeColors.warning,
                                      ),
                                      child: const Icon(
                                        Remix.ruler_line,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Text(Const.ukuranCelana, style: fs14fw500),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  Obx(
                                    () => Expanded(
                                      child: MyDropdownSearch(
                                        hint: Const.deskvihara,
                                        icon: const Icon(
                                          Remix.arrow_down_s_line,
                                        ),
                                        selectedItem: controller.baju.value,
                                        onChanged:
                                            (value) =>
                                                controller.baju.value =
                                                    value ?? '',
                                        items:
                                            controller.listBaju
                                                .map((e) => e)
                                                .toList(),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  GestureDetector(
                                    onTap:
                                        () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder:
                                                (context) => const PhotoScreen(
                                                  Assets.assetsImagesSizeCelana,
                                                ),
                                          ),
                                        ),
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: ThemeColors.warning,
                                      ),
                                      child: const Icon(
                                        Remix.ruler_line,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                          : const SizedBox(),
                ),
                Obx(
                  () =>
                      controller.celana.value != '' &&
                              controller.baju.value != ''
                          ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(Const.ukuranBaju, style: fs14fw500),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  Obx(
                                    () => Expanded(
                                      child: MyDropdownSearch(
                                        hint: Const.deskvihara,
                                        icon: const Icon(
                                          Remix.arrow_down_s_line,
                                        ),
                                        selectedItem: controller.celana.value,
                                        onChanged:
                                            (value) =>
                                                controller.celana.value =
                                                    value ?? '',
                                        items:
                                            controller.listCelana
                                                .map((e) => e)
                                                .toList(),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  GestureDetector(
                                    onTap:
                                        () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder:
                                                (context) => const PhotoScreen(
                                                  Assets
                                                      .assetsImagesSizeBajuPutih,
                                                ),
                                          ),
                                        ),
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: ThemeColors.warning,
                                      ),
                                      child: const Icon(
                                        Remix.ruler_line,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Text(Const.ukuranCelana, style: fs14fw500),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  Obx(
                                    () => Expanded(
                                      child: MyDropdownSearch(
                                        hint: Const.deskvihara,
                                        icon: const Icon(
                                          Remix.arrow_down_s_line,
                                        ),
                                        selectedItem: controller.baju.value,
                                        onChanged:
                                            (value) =>
                                                controller.baju.value =
                                                    value ?? '',
                                        items:
                                            controller.listBaju
                                                .map((e) => e)
                                                .toList(),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  GestureDetector(
                                    onTap:
                                        () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder:
                                                (context) => const PhotoScreen(
                                                  Assets.assetsImagesSizeCelana,
                                                ),
                                          ),
                                        ),
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: ThemeColors.warning,
                                      ),
                                      child: const Icon(
                                        Remix.ruler_line,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                          : const SizedBox(),
                ),
                const SizedBox(height: 16),
                Text(Const.alamat, style: fs14fw500),
                const SizedBox(height: 16),
                MyTextFormField(
                  controller: controller.alamat,
                  maxLines: 3,
                  hintText: Const.deskalamat,
                ),
                const SizedBox(height: 16),
                Text(Const.noHP, style: fs14fw500),
                const SizedBox(height: 16),
                MyTextFormField(
                  keyType: TextInputType.phone,
                  controller: controller.nohp,
                  hintText: Const.desknoHP,
                ),
                const SizedBox(height: 16),
                Text(Const.makanan, style: fs14fw500),
                const SizedBox(height: 16),
                Obx(
                  () => Row(
                    children: [
                      Radio(
                        value: Const.v,
                        groupValue: controller.meal.value,
                        onChanged: (value) => controller.setMeal(value!),
                      ),
                      const Text(Const.vegetarian),
                      const SizedBox(width: 40),
                      Radio(
                        value: Const.nv,
                        groupValue: controller.meal.value,
                        onChanged: (value) => controller.setMeal(value!),
                      ),
                      const Text(Const.nonVegetarian),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Text(Const.pernahIkut, style: fs14fw500),
                const SizedBox(height: 16),
                Obx(
                  () => Check(
                    values: controller.isChecked.value,
                    onChanged: controller.setChecked,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8),
        child: MyButton(
          theme: buttonYellow,
          text: controller.btnText.value,
          onPressed: controller.submit,
        ),
      ),
    );
  }
}

class Check extends StatelessWidget {
  const Check({required this.onChanged, required this.values, super.key});

  final List<bool> values;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Checkbox(
              value: values[0],
              checkColor: Colors.white,
              onChanged: (value) {
                onChanged(value, 0); //selected value
              },
            ),
            const Text('2015'),
            const SizedBox(width: 45),
            Checkbox(
              value: values[4],
              checkColor: Colors.white,
              onChanged: (value) {
                onChanged(value, 4); //selected value
              },
            ),
            const Text('2019'),
            const SizedBox(width: 45),
            Checkbox(
              value: values[8],
              checkColor: Colors.white,
              onChanged: (value) {
                onChanged(value, 8); //selected value
              },
            ),
            const Text('2023'),
          ],
        ),
        Row(
          children: [
            Checkbox(
              value: values[1],
              checkColor: Colors.white,
              onChanged: (value) {
                onChanged(value, 1); //selected value
              },
            ),
            const Text('2016'),
            const SizedBox(width: 45),
            Checkbox(
              value: values[5],
              checkColor: Colors.white,
              onChanged: (value) {
                onChanged(value, 5); //selected value
              },
            ),
            const Text('2020'),
            const SizedBox(width: 45),
            Checkbox(
              value: values[9],
              checkColor: Colors.white,
              onChanged: (value) {
                onChanged(value, 9); //selected value
              },
            ),
            const Text('2024'),
          ],
        ),
        Row(
          children: [
            Checkbox(
              value: values[2],
              checkColor: Colors.white,
              onChanged: (value) {
                onChanged(value, 2); //selected value
              },
            ),
            const Text('2017'),
            const SizedBox(width: 45),
            Checkbox(
              value: values[6],
              checkColor: Colors.white,
              onChanged: (value) {
                onChanged(value, 6); //selected value
              },
            ),
            const Text('2021'),
            const SizedBox(width: 45),
            // Checkbox(
            //   value: values[8],
            //   checkColor: Colors.white,
            //   onChanged: (value) {
            //     onChanged(value, 8); //selected value
            //   },
            // ),
            // const Text('2025'),
          ],
        ),
        Row(
          children: [
            Checkbox(
              value: values[3],
              checkColor: Colors.white,
              onChanged: (value) {
                onChanged(value, 3); //selected value
              },
            ),
            const Text('2018'),
            const SizedBox(width: 45),
            Checkbox(
              value: values[7],
              checkColor: Colors.white,
              onChanged: (value) {
                onChanged(value, 7); //selected value
              },
            ),
            const Text('2022'),
            const SizedBox(width: 45),
            // Checkbox(
            //   value: values[8],
            //   checkColor: Colors.white,
            //   onChanged: (value) {
            //     onChanged(value, 8); //selected value
            //   },
            // ),
            // const Text('2026'),
          ],
        ),
      ],
    );
  }
}

class RowBorder extends StatelessWidget {
  const RowBorder({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.all(8),
              child: LogoButtonGray(icon: Remix.image_2_line),
            ),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text(Const.uploadData), Text(Const.lihatFoto)],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: SvgPicture.asset(Assets.assetsImagesCameraOrange),
            ),
          ],
        ),
      ),
    );
  }
}

class LogoButtonGray extends StatelessWidget {
  const LogoButtonGray({required this.icon, super.key});

  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: ThemeColors.gray.shade50,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: ThemeColors.gray.shade100),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Icon(icon, color: const Color.fromRGBO(208, 211, 217, 1)),
      ),
    );
  }
}
