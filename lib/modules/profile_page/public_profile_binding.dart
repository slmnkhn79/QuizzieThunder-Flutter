import 'package:get/get.dart';
import 'package:quizzie_thunder/modules/profile_page/public_profile_controller.dart';

class PublicProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PublicProfileController>(() => PublicProfileController());
  }
}