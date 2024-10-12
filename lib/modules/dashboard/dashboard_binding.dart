import 'package:get/get.dart';
import 'package:quizzie_thunder/modules/discover/school_discover_controller.dart';
import 'package:quizzie_thunder/modules/home/post_card/feed_controller.dart';
import 'package:quizzie_thunder/modules/leaderboard/school_leaderboard_controller.dart';

import '../discover/discover_controller.dart';
import '../home/home_controller.dart';
import '../leaderboard/student_leaderboard_controller.dart';
import '../profile/profile_controller.dart';
import 'dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => DiscoverController());
    Get.lazyPut(() => LeaderboardController());
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => FeedController());
    Get.lazyPut(() => SchoolLeaderboardController());
    Get.lazyPut(() => SchoolDiscoverController());
  }
}
