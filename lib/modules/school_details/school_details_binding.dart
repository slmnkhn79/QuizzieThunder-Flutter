import 'package:get/get.dart';
import 'package:quizzie_thunder/modules/school_details/school_details_controller.dart';



class SchoolBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SchoolController());
  }
}
