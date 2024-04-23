import 'package:get/get.dart';

import '../presentation/presentation.dart';

class CameraDetectionBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CameraDetectionController>(() => CameraDetectionController());
  }
}
