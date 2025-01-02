import 'package:get_storage/get_storage.dart';
import 'package:quizzie_thunder/models/post_comment_response_model.dart';
import 'package:quizzie_thunder/models/post_response_model.dart';
import 'package:quizzie_thunder/utils/constants.dart';
import 'package:quizzie_thunder/utils/dio_client.dart';

class PostDetailsApi {
  Future<dynamic> getPostById({required dynamic postId}) async {
    try {
      final response = await DioClient.getDioInstance().post("/postById",
          data: {
            'postId': postId,
            'userId': GetStorage().read(KEY_USER_DATA)['result']['_id']
          });
      return PostDetailsResponseModel.fromJson(response.data['result']);
      // return response.data['results'];
    } catch (e) {
      // rethrow;
      return PostCommentResponseModel.fromJson({
        "code": 400,
        "status": false,
        "message": "Something went wrong",
        "post": null
      });
    }
  }

  Future<dynamic> addCommentToPost(
      {required String postId, required String content}) async {
    try {
      final response =
          await DioClient.getDioInstance().post("/addCommentToPost", data: {
        'postId': postId,
        'content': content,
        'userId': GetStorage().read(KEY_USER_DATA)['result']['_id']
      });
      // return PostDetailsResponseModel.fromJson(response.data['result']);
      return response.data['result'];
      // return response.data['results'];
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getCommentForPost(
      {required String postId, required int skip, required int limit}) async {
    try {
      final response = await DioClient.getDioInstance().post("/commentByPostId",
          data: {'postId': postId, 'skip': skip, 'limit': limit});
      return PostCommentResponseModel.fromJson(response.data['result']);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> likePostById({required String postId}) async {
    try {
      final response = await DioClient.getDioInstance().post("/likePostById",
          data: {
            'postId': postId,
            'userId': GetStorage().read(KEY_USER_DATA)['result']['_id']
          });
      return PostDetailsResponseModel.fromJson(response.data['result']);
    } catch (e) {
      rethrow;
    }
  }
  Future<dynamic> dislikePostById(
      {required String postId}) async {
    try {
      // final response = await DioClient.getDioInstance().get("api/home");
      final response = await DioClient.getDioInstance().post("/dislikePostById", data: {
        'postId':postId,
        'userId': GetStorage().read(KEY_USER_DATA)['result']['_id']
      });

      return PostDetailsResponseModel.fromJson(response.data['result']);
      
      // return response.data['result'];
    } catch (e) {
      rethrow;
    }
  }
}
