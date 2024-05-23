import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
              child: Obx(
                () => Stack(
                  clipBehavior: Clip.none,
                  children: [
                    AnimatedCrossFade(
                      firstChild: const SizedBox(),
                      secondChild: CameraPreview(controller.controllerCamera),
                      crossFadeState: !controller.isInitializeController.value ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                      duration: const Duration(milliseconds: 450),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: AnimatedOpacity(
                        opacity: controller.namePersonDetected.isEmpty ? 0 : 1,
                        duration: const Duration(milliseconds: 550),
                        child: Container(
                          margin: const EdgeInsets.only(top: 40),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(),
                          ),
                          child: Column(
                            children: [
                              const Text("tú eres: "),
                              const SizedBox(height: 10),
                              Text(controller.namePersonDetected.value),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () async {},
                  child: const Text('Registar rostro'),
                ),
                ElevatedButton(
                  onPressed: () async {},
                  child: const Text('Detectar rostro'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
