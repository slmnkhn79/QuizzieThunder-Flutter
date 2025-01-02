import 'package:get/get.dart';

import 'post_detail_controller.dart';



class PostDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PostDetailController());
  }
}
