import 'package:asalhapuja/data/utils/colors.dart';
import 'package:asalhapuja/data/utils/theme.dart';
import 'package:asalhapuja/presentation/widget/mybutton.dart';
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RowBorder(),
              const SizedBox(height: 16),
              const Text('Vihara'),
              const SizedBox(height: 16),
              MyTextFormField(
                controller: controller.organization,
                hintText: 'Masukkan Vihara',
              ),
              const SizedBox(height: 16),
              const Text('No KTP'),
              const SizedBox(height: 16),
              MyTextFormField(
                controller: controller.ktp,
                hintText: 'Masukkan No KTP',
              ),
              const SizedBox(height: 16),
              const Text('Nama Lengkap'),
              const SizedBox(height: 16),
              MyTextFormField(
                controller: controller.nama,
                hintText: 'Masukkan Nama Lengkap',
              ),
              const SizedBox(height: 16),
              const Text('Nama Cetak'),
              const SizedBox(height: 16),
              MyTextFormField(
                controller: controller.namaCetak,
                hintText: 'Nama yang dicetak',
              ),
              const SizedBox(height: 16),
              const Text('Jenis Kelamin'),
              const SizedBox(height: 16),
              Obx(
                () => RadioButton(
                  value1: 'L',
                  text1: 'Laki-Laki',
                  value2: 'P',
                  text2: 'Perempuan',
                  groupValue: controller.jenisKelamin.value,
                  onChanged: controller.setJenis,
                ),
              ),
              const SizedBox(height: 16),
              const Text('Alamat'),
              const SizedBox(height: 16),
              MyTextFormField(
                controller: controller.alamat,
                maxLines: 3,
                hintText: 'Masukkan Alamat',
              ),
              const SizedBox(height: 16),
              const Text('No HP'),
              const SizedBox(height: 16),
              MyTextFormField(
                controller: controller.nohp,
                hintText: 'Masukkan No HP',
              ),
              const SizedBox(height: 16),
              const Text('Makanan'),
              const SizedBox(height: 16),
              Obx(
                () => RadioButton(
                  value1: 'V',
                  text1: 'Vegetarian',
                  value2: 'NV',
                  text2: 'Non Vegetarian',
                  groupValue: controller.meal.value,
                  onChanged: controller.setMeal,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8),
        child: MyButton(
          theme: buttonYellow,
          text: 'Submit',
          onPressed: controller.submit,
        ),
      ),
    );
  }
}

class RowBorder extends StatelessWidget {
  const RowBorder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Remix.image_add_fill),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Foto Peserta'),
                  Text('Lihat Foto'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Remix.image_add_fill,
                  color: Color.fromARGB(255, 250, 168, 26),
                ),
              ),
            ),
          ],
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
