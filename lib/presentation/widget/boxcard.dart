import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BoxCard extends StatelessWidget {
  const BoxCard({
    required this.text,
    required this.assets,
    required this.width,
    required this.height,
    required this.theme,
    required this.onTap,
    super.key,
  });

  final String text;
  final String assets;
  final double width;
  final double height;
  final CardTheme theme;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Theme(
        data: Theme.of(context).copyWith(
          cardTheme: theme,
        ),
        child: Card(
          child: SizedBox(
            width: width,
            height: height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 8,
                ),
                SvgPicture.asset(
                  assets,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
