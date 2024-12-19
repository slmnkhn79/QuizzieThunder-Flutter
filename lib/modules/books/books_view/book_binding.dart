import 'package:get/get.dart';
import 'package:quizzie_thunder/modules/books/books_view/book_controller.dart';

class BookBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BookController());
  }
}
