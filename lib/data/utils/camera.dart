import 'dart:developer';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

void saveImage() async {
  final picker = ImagePicker();
  final photo = await picker.pickImage(
    source: ImageSource.camera,
    // maxHeight: 400,
    // maxWidth: 400,
    imageQuality: 25,
  );

  final directory = await getApplicationDocumentsDirectory();
  final file = File(photo!.path);
  final res = await file.copy('${directory.path}/${photo.name}');
  log('res: $res');
}
