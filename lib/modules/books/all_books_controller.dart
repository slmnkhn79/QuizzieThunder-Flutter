import 'package:get/get.dart';
import 'package:quizzie_thunder/apis/books_api.dart';
import 'package:quizzie_thunder/models/all_books_response_model.dart';
import 'package:quizzie_thunder/utils/app_utils.dart';
import 'package:quizzie_thunder/utils/enums/snackbar_status.dart';

class AllBooksController  extends GetxController{
  final isLoading = true.obs;
  AllBooksResponseModel? allBooksResponseModel;
  BooksApi booksApi = BooksApi();

  @override
  void onInit(){
    getAllBooks();
    super.onInit();
  }
  void getAllBooks() async {
    isLoading.value = true;
    var response = await booksApi.getAllBooks();
    if (response.code == 200) {
      allBooksResponseModel = response;
      isLoading.value = false;
    } else {
      isLoading.value = false;
      AppUtils.showSnackBar("Error", status: MessageStatus.ERROR);
    }
  }
}
