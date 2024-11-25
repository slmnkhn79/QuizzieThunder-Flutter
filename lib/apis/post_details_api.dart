
import 'package:quizzie_thunder/models/post_response_model.dart';
import 'package:quizzie_thunder/utils/dio_client.dart';

class PostDetailsApi {
  
  Future<dynamic> getPostById(
      {required dynamic
          postId}) async {
    try {
      final response = await DioClient.getDioInstance().post(
          "/postById",
          data: {'postId':postId});
      return PostDetailsResponseModel.fromJson(response.data['result']);
      // return response.data['results'];
    } catch (e) {
      rethrow;
    }
  }
}
