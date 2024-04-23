import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../camera_detetion.dart';

class CameraDetectionView extends GetView<CameraDetectionController> {
  const CameraDetectionView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text("Detección de rostro"),
        centerTitle: true,
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              margin: const EdgeInsets.only(top: 50),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(),
                borderRadius: BorderRadius.circular(8),
              ),
              height: 250,
              width: 250,
              child: !controller.controllerCamera.value.isInitialized
                  ? null
                  : CameraPreview(
                      controller.controllerCamera,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
