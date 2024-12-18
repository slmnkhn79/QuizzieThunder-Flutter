import 'package:get/get.dart';
import 'package:quizzie_thunder/modules/learning_path/learning_path_by_id/learning_path_by_id_controller.dart';



class LearningPathByIdBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LearningByIdController());
  }
}
