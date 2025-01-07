import 'package:get/get.dart';
import 'package:quizzie_thunder/modules/books/books_view/book_controller.dart';
import 'package:quizzie_thunder/modules/course_content/course_by_id/course_content_controller.dart';

class CourseContentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CourseContentController());
  }
}
