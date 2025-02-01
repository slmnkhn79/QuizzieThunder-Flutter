import 'package:get/get.dart';
import 'package:quizzie_thunder/modules/study_plans/study_plans_by_id/study_plan_by_id_controller.dart';

class StudyPlanByIdBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StudyPlanByIdController());
  }
}
