import 'package:flutter/material.dart';
import 'package:get/get.dart';

loadingDialog() {
  Get.dialog(
    const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(),
        ],
      ),
    ),
  );
}
