import 'package:get/get.dart';
import 'package:quizzie_thunder/apis/videos_api.dart';
import 'package:quizzie_thunder/models/video_response_model.dart';
import 'package:quizzie_thunder/utils/app_utils.dart';
import 'package:quizzie_thunder/utils/constants.dart';
import 'package:quizzie_thunder/utils/enums/snackbar_status.dart';

class PlayVideoController extends GetxController {
  final isLoading = true.obs;
  VideoReponseModel? videoReponseModel;
  var videoId = '';
  final arguments = Get.arguments;
  VideosApi videosApi = VideosApi();
  @override
  void onInit() {
    if (arguments != null) {
      videoId = arguments[ARG_VIDEO_ID];
    }
    getVideoById();
    super.onInit();
  }

  void getVideoById() async {
    isLoading.value = true;
    var response = await videosApi.getVideoById(videoId: videoId);
    if (response.code == 200) {
      videoReponseModel = response;
      isLoading.value = false;
    } else {
      isLoading.value = false;
      AppUtils.showSnackBar(response.message, status: MessageStatus.ERROR);
    }
  }
}
