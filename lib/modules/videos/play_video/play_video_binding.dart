import 'package:get/get.dart';
import 'package:quizzie_thunder/modules/videos/play_video/play_video_controller.dart';

class PlayVideoBinding extends Bindings{
   @override
  void dependencies() {
    Get.lazyPut(() => PlayVideoController());
  }
}