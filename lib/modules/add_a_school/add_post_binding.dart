import 'package:get/get.dart';
import 'package:quizzie_thunder/modules/add_a_school/add_post_controller.dart';



class AddSchoolBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddSchoolController());
  }
}
