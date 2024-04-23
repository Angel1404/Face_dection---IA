import 'package:get/get.dart';

import '../../bindings/binding_app.dart';
import '../presentation.dart';
part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.CAMERADETECTION,
      page: () => const CameraDetectionView(),
      binding: CameraDetectionBinding(),
    ),
  ];
}
