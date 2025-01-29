import 'package:get/get.dart';
import 'package:quizzie_thunder/modules/quiz_question/photo_quiz/photo_quiz_controller.dart';



class PhotoQuizBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PhotoQuizController());
  }
}
