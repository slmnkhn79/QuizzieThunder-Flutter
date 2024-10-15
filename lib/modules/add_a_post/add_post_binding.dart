import 'package:get/get.dart';
import 'package:quizzie_thunder/modules/add_a_post/add_post_controller.dart';



class AddPostBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddPostController());
  }
}
