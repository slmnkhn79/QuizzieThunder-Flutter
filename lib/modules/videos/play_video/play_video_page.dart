import 'package:dartx/dartx.dart';
import 'package:get/get.dart';
import 'package:quizzie_thunder/modules/quiz_question/quiz_question_page.dart';
import 'package:quizzie_thunder/modules/videos/play_video/play_video_controller.dart';
import 'package:quizzie_thunder/modules/wonderous/ui/common_libs.dart';
import 'package:quizzie_thunder/modules/wonderous/ui/widgets/youtube_video_player.dart';
import 'package:quizzie_thunder/theme/colors_theme.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayVideoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PlayVideoController playVideoController = Get.find<PlayVideoController>();
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Discover",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: ThemeColor.white),
          ),
          backgroundColor: ThemeColor.headerOne,
          centerTitle: true,
          elevation: 0,
        ),
        body: Obx(() => RefreshIndicator(
            onRefresh: () async {},
            child: SingleChildScrollView(
              child: Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width > 600
                      ? 600
                      : MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Container(
                    color: ThemeColor.headerThree,
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: playVideoController.isLoading.value
                            ? const Center(
                                child: CircularProgressIndicator(
                                color: ThemeColor.white,
                              ))
                            : getVideoContainers(context, playVideoController)),
                  ),
                ),
              ),
            ))));
  }

  Column getVideoContainers(
      BuildContext context, PlayVideoController playVideoController) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // VideoPlayerScreen(videoLink: playVideoController.videoReponseModel!.video!.videoLink!),
        playVideoController.videoReponseModel!.video!.videoType == 'yt_link'
            ? YouTubeVideoPlayer(
                videoId: playVideoController
                    .videoReponseModel!.video!.videoLink!
                    .removePrefix('https://www.youtube.com/watch?v='))
            : Text("Video Player")
        // Text(playVideoController.videoReponseModel!.video!.videoLink!)
      ],
    );
  }
}