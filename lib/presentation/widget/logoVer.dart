import 'package:flutter/material.dart';
import 'package:asalhapuja/data/utils/utils.dart';

class LogoVer extends StatelessWidget {
  const LogoVer({
    required this.logo,
    super.key,
  });
  final bool logo;

  @override
  Widget build(BuildContext context) {
    if (logo) {
      return Expanded(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(
                height: 8,
              ),
              Image.asset(
                Assets.assetsImagesLogo,
                height: 50,
              ),
              const SizedBox(
                height: 16,
              ),
              Text('${Const.version} ${Const.appVersion}'),
            ],
          ),
        ),
      );
    } else {
      return Expanded(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Text('${Const.version} ${Const.appVersion}'),
            ],
          ),
        ),
      );
    }
  }
}
