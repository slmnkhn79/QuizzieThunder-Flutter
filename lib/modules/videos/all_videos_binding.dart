import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:quizzie_thunder/modules/videos/all_videos_controller.dart';

class AllVideosBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AllVideosController());
  }
}
