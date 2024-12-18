import 'package:get/get.dart';
import 'package:quizzie_thunder/modules/study_plans/study_plans_all_controller.dart';

class StudyPlanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StudyPlansAllController());
  }
}
