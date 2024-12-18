import 'package:get/get.dart';
import 'package:quizzie_thunder/modules/learning_path/learning_path_controller.dart';



class LearningBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LearningController());
  }
}
