import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class PhotoScreen extends StatelessWidget {
  const PhotoScreen(this.asset, {super.key});
  final String asset;
  @override
  Widget build(BuildContext context) {
    return PhotoView(
      imageProvider: AssetImage(asset),
    );
  }
}
