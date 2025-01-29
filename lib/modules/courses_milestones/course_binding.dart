import 'package:get/get.dart';
import 'package:quizzie_thunder/modules/courses_milestones/course_controller.dart';

class CourseBinding extends Bindings{
   @override
  void dependencies() {
    Get.lazyPut(() => CourseController());
  }
  
}