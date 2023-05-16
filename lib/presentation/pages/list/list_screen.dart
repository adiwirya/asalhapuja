import 'package:asalhapuja/presentation/pages/list/controllers/list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListScreen extends GetView<ListController> {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('List')),
    );
  }
}
