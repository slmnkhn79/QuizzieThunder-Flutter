import 'package:get/get.dart';
import 'package:quizzie_thunder/modules/add_a_school/add_post_controller.dart';
import 'package:quizzie_thunder/modules/school_details/school_details_controller.dart';



class SchoolBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SchoolController());
  }
}
