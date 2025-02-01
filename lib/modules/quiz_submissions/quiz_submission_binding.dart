import 'package:get/get.dart';
import 'package:quizzie_thunder/modules/quiz_submissions/quiz_submission_controller.dart';

class QuizSubmissionBinding  extends Bindings{
    @override
  void dependencies() {
    Get.lazyPut(() => QuizSubmissionController());
  }
}