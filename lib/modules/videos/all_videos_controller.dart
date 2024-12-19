import 'package:get/get.dart';
import 'package:quizzie_thunder/apis/videos_api.dart';
import 'package:quizzie_thunder/models/all_videos_reponse_model.dart';
import 'package:quizzie_thunder/utils/app_utils.dart';
import 'package:quizzie_thunder/utils/enums/snackbar_status.dart';

class AllVideosController extends GetxController {
  final isLoading = true.obs;
  AllVideosReponseModel? allVideosReponseModel;
  VideosApi videosApi = VideosApi();

  @override
  void onInit() {
    getAllVideos();
    super.onInit();
  }

  void getAllVideos() async {
    isLoading.value = true;
    var response = await videosApi.getAllVideos();
    if (response.code == 200) {
      allVideosReponseModel = response;
      isLoading.value = false;
    } else {
      isLoading.value = false;
      AppUtils.showSnackBar(response.message, status: MessageStatus.ERROR);
    }
  }
}
