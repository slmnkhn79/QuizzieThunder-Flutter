import 'package:get/get.dart';
import 'package:quizzie_thunder/modules/books/all_books_controller.dart';
import 'package:quizzie_thunder/modules/course_content/all_course_content_controller.dart';

class AllCourseContentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AllCourseContentController());
  }
}
