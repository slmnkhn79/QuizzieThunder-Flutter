import 'package:get/get.dart';

import 'gallery_header_controller.dart';

class GalleryHeaderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GalleryHeaderController());
  }
}
