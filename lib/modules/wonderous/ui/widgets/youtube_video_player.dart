import 'package:quizzie_thunder/modules/wonderous/ui/common_libs.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YouTubeVideoPlayer extends StatefulWidget {
  final String videoId;

  YouTubeVideoPlayer({required this.videoId});

  @override
  _YouTubeVideoPlayerState createState() => _YouTubeVideoPlayerState();
}

class _YouTubeVideoPlayerState extends State<YouTubeVideoPlayer> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    // _controller = YoutubePlayerController(
    //   params: YoutubePlayerParams(
    //     showControls: true,
    //     showFullscreenButton: true,
    //   ),
    // );
    // _controller.cueVideoById(videoId: widget.videoId);
    _controller = YoutubePlayerController.fromVideoId(
      videoId: widget.videoId,
      autoPlay: false,
      params: const YoutubePlayerParams(showFullscreenButton: true),
    );
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerScaffold(
      controller: _controller,
      aspectRatio: 16 / 9,
      builder: (context, player) {
        return Column(
          children: [
            player
          ],
        );
      },
    );
  }
}
