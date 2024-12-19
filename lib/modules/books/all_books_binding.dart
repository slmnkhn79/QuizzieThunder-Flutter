import 'package:get/get.dart';
import 'package:quizzie_thunder/modules/books/all_books_controller.dart';

class AllBooksBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AllBooksController());
  }
}
