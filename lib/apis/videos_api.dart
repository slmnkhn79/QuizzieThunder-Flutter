import 'package:quizzie_thunder/models/all_videos_reponse_model.dart';
import 'package:quizzie_thunder/models/video_response_model.dart';
import 'package:quizzie_thunder/utils/dio_client.dart';

class VideosApi {
  Future<AllVideosReponseModel> getAllVideos() async {
    try {
      final response = await DioClient.getDioInstance().post(
        "/allVideos",
      );
      return AllVideosReponseModel.fromJson(response.data['result']);
    } catch (e) {
      rethrow;
    }
  }
  Future<VideoReponseModel> getVideoById({required String videoId}) async {
    try {
      final response = await DioClient.getDioInstance().post(
        "/videoById",data: {"videoId":videoId}
      );
      return VideoReponseModel.fromJson(response.data['result']);
    } catch (e) {
      rethrow;
    }
  }
}
