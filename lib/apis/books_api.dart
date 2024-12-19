import 'package:quizzie_thunder/models/all_books_response_model.dart';
import 'package:quizzie_thunder/models/book_response_model.dart';
import 'package:quizzie_thunder/utils/dio_client.dart';

class BooksApi {
  Future<AllBooksResponseModel> getAllBooks() async {
    try {
      final response = await DioClient.getDioInstance().post("/allBooks");
      return AllBooksResponseModel.fromJson(response.data['result']);
    } catch (e) {
      rethrow;
    }
  }

  Future<BookResponseModel> getBookById(
      {required String bookId}) async {
    try {
      final response = await DioClient.getDioInstance()
          .post("/bookById", data: {'bookId': bookId});
      return BookResponseModel.fromJson(response.data['result']);
    } catch (e) {
      rethrow;
    }
  }
}