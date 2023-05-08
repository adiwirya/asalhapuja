import 'dart:io';

import 'package:asalhapuja/data/utils/colors.dart';
import 'package:asalhapuja/data/utils/theme.dart';
import 'package:asalhapuja/data/utils/utils.dart';
import 'package:asalhapuja/presentation/widget/mybutton.dart';
import 'package:asalhapuja/presentation/widget/mydropdownsearch.dart';
import 'package:asalhapuja/presentation/widget/mytextformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:asalhapuja/presentation/pages/form/controllers/form_controller.dart';
import 'package:remixicon/remixicon.dart';

class FormScreen extends GetView<FormController> {
  const FormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Text(
                  Const.fotoPeserta,
                  style: fs14fw600,
                ),
                const SizedBox(height: 16),
                Obx(
                  () => GestureDetector(
                    onTap: () => controller.getImage(),
                    child: Container(
                      height: 100,
                      width: 100,
                      color: ThemeColors.gray.shade50,
                      child: controller.isPhoto.value
                          ? Image.file(File(controller.imagePath.value))
                          : Center(
                              child: Icon(
                                Remix.image_add_fill,
                                color: ThemeColors.warning.shade500,
                                size: 40,
                              ),
                            ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  Const.vihara,
                  style: fs14fw600,
                ),
                const SizedBox(height: 16),
                MyDropdownSearch(
                  hint: Const.deskvihara,
                  icon: const Icon(Remix.arrow_down_s_line),
                  selectedItem: controller.vihara.value,
                  onChanged: (value) => controller.setVihara(value!),
                  items: (String filter) async {
                    return controller.listRegion.map((e) => e.vihara).toList();
                  },
                ),
                const SizedBox(height: 16),
                Text(
                  Const.nik,
                  style: fs14fw600,
                ),
                const SizedBox(height: 16),
                MyTextFormField(
                  controller: controller.ktp,
                  hintText: Const.desknoKTP,
                ),
                const SizedBox(height: 16),
                Text(
                  Const.namaLengkap,
                  style: fs14fw600,
                ),
                const SizedBox(height: 16),
                MyTextFormField(
                  controller: controller.nama,
                  hintText: Const.desknamaLengkap,
                ),
                const SizedBox(height: 16),
                Text(
                  Const.namaCetak,
                  style: fs14fw600,
                ),
                const SizedBox(height: 16),
                MyTextFormField(
                  controller: controller.namaCetak,
                  hintText: Const.desknamaCetak,
                ),
                const SizedBox(height: 16),
                Text(
                  Const.jenisKelamin,
                  style: fs14fw600,
                ),
                const SizedBox(height: 16),
                Obx(
                  () => RadioButton(
                    value1: Const.l,
                    text1: Const.laki,
                    value2: Const.p,
                    text2: Const.perempuan,
                    groupValue: controller.jenisKelamin.value,
                    onChanged: controller.setJenis,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  Const.alamat,
                  style: fs14fw600,
                ),
                const SizedBox(height: 16),
                MyTextFormField(
                  controller: controller.alamat,
                  maxLines: 3,
                  hintText: Const.deskalamat,
                ),
                const SizedBox(height: 16),
                Text(
                  Const.noHP,
                  style: fs14fw600,
                ),
                const SizedBox(height: 16),
                MyTextFormField(
                  controller: controller.nohp,
                  hintText: Const.desknoHP,
                ),
                const SizedBox(height: 16),
                Text(
                  Const.makanan,
                  style: fs14fw600,
                ),
                const SizedBox(height: 16),
                Obx(
                  () => RadioButton(
                    value1: Const.v,
                    text1: Const.vegetarian,
                    value2: Const.nv,
                    text2: Const.nonVegetarian,
                    groupValue: controller.meal.value,
                    onChanged: controller.setMeal,
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
          text: Const.submit,
          onPressed: controller.submit,
        ),
      ),
    );
  }
}

class RadioButton extends StatelessWidget {
  const RadioButton({
    required this.value1,
    required this.text1,
    required this.value2,
    required this.text2,
    required this.groupValue,
    required this.onChanged,
    super.key,
  });

  final String value1;
  final String value2;
  final String text1;
  final String text2;
  final String groupValue;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Radio(
          value: value1,
          groupValue: groupValue,
          onChanged: (value) {
            onChanged(value); //selected value
          },
        ),
        Text(text1),
        Radio(
          value: value2,
          groupValue: groupValue,
          onChanged: (value) {
            onChanged(value); //selected value
          },
        ),
        Text(text2),
      ],
    );
  }
}
