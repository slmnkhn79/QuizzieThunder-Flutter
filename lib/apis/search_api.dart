import 'package:dio/dio.dart';
import 'package:quizzie_thunder/models/search_dialog_response_model.dart';
import '../utils/dio_client.dart';

class SearchApi {
  Future<SearchDialogResponseModel> getSearchDialogDetails(String input) async {
    try {
      final response = await DioClient.getDioInstance().post(
        "/searchInput",
        options: Options(
          headers: {
            'X-Parse-Application-Id': 'myappID',
          },
        ),
        data: {"searchValue": input},
      );
      return SearchDialogResponseModel.fromJson(response.data['result']);
      // return SearchDialogResponseModel(code: 200, status: true, message: 'cistp,er');
    } catch (e) {
      // rethrow;
      return SearchDialogResponseModel.fromJson({
        "code": 500,
        "status": false,
        "message": e.toString(),
        "searchResults": null
      });
    }
  }
}
