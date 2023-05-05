import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:asalhapuja/data/utils/utils.dart';
import 'package:lottie/lottie.dart';
import 'package:asalhapuja/routes/app_routes.dart';

class QuestionDialog extends StatelessWidget {
  const QuestionDialog({
    super.key,
    required this.text,
    this.onPressed,
  });

  final String text;
  final VoidCallback? onPressed;

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
                  children: [
                    const SizedBox(height: 10),
                    // SvgPicture.asset(Assets.assetsImagesDialog),
                    const SizedBox(height: 42),
                    Text(
                      text,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 32),
                    Row(
                      children: [
                        Expanded(
                          child: Theme(
                            data: Theme.of(context)
                                .copyWith(elevatedButtonTheme: buttonGreen),
                            child: ElevatedButton(
                              onPressed: onPressed,
                              child: const Text(
                                'Ya',
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Theme(
                            data: Theme.of(context).copyWith(
                              elevatedButtonTheme: buttonWhiteRedBorder,
                            ),
                            child: ElevatedButton(
                              onPressed: Get.back,
                              child: const Text(
                                'Tidak',
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
    );
  }
}

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({super.key});

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
                  children: [
                    const SizedBox(height: 10),
                    Lottie.asset(Assets.assetsLottieLoading),
                    const SizedBox(height: 15),
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

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({
    required this.text,
    required this.data,
    super.key,
  });

  final String text;
  final String data;

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
                  children: [
                    // Lottie.asset(Assets.assetsLottieSuccessPopup),
                    Text(
                      '$text\n$data ',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: Theme(
                            data: Theme.of(context)
                                .copyWith(elevatedButtonTheme: buttonGreen),
                            child: ElevatedButton(
                              onPressed: Get.back,
                              child: const Text(
                                'Ya',
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
    );
  }
}

class FailedDialog extends StatelessWidget {
  const FailedDialog({super.key});

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
                  children: [
                    // Lottie.asset(Assets.assetsLottieNotFound),
                    const Text(
                      'Tidak ada Data \n Ditampilkan',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: Theme(
                            data: Theme.of(context)
                                .copyWith(elevatedButtonTheme: buttonGreen),
                            child: ElevatedButton(
                              onPressed: Get.back,
                              child: const Text(
                                'Ya',
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
    );
  }
}

class DataFound extends StatelessWidget {
  const DataFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
