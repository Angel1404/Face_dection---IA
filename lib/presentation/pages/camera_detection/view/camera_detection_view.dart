import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/dialogs.dart';
import '../camera_detetion.dart';

class CameraDetectionView extends StatefulWidget {
  const CameraDetectionView({super.key});

  @override
  State<CameraDetectionView> createState() => _CameraDetectionViewState();
}

class _CameraDetectionViewState extends State<CameraDetectionView> {
  final controller = CameraDetectionController.to;

  final TextEditingController _controllerName = TextEditingController();
  @override
  void dispose() {
    _controllerName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text("Detección de rostro"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: controller.changeFace,
            icon: const Icon(
              Icons.flip_camera_ios_outlined,
              color: Colors.white,
            ),
          ),
        ],
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
              height: 300,
              width: 300,
              child: Obx(
                () => Stack(
                  clipBehavior: Clip.none,
                  children: [
                    AnimatedCrossFade(
                      firstChild: const SizedBox(),
                      secondChild: SizedBox(height: 300, width: 300, child: CameraPreview(controller.controllerCamera)),
                      crossFadeState: !controller.isInitializeController.value ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                      duration: const Duration(milliseconds: 450),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    await Get.dialog(SimpleDialog(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          height: 150,
                          width: 200,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Registra tu nombre"),
                              const SizedBox(height: 10),
                              TextField(
                                controller: _controllerName,
                              ),
                              const SizedBox(height: 10),
                              ElevatedButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: const Text('Guardar'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ));

                    if (_controllerName.text.isNotEmpty) {
                      loadingDialog();

                      final response = await controller.registerFace(_controllerName.text);
                      Get.back();

                      Get.snackbar("Face dectaction", response.isError ? response.error ?? "" : "Se registro el rostro correctamente");
                    }
                  },
                  child: const Text('Registar rostro'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () async {
                    loadingDialog();
                    await controller.detectedFace();
                    Get.back();
                  },
                  child: const Text('Detectar rostro'),
                ),
              ],
            ),
            Obx(
              () => AnimatedOpacity(
                opacity: controller.namePersonDetected.isEmpty ? 0 : 1,
                duration: const Duration(milliseconds: 550),
                child: Container(
                  margin: const EdgeInsets.only(top: 40),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Text("Tú eres: ${controller.namePersonDetected.value} "),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
