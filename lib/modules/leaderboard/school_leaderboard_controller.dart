import 'package:get/get.dart';
import 'package:quizzie_thunder/apis/school_leaderboard_api.dart';
import 'package:quizzie_thunder/models/school_leaderboard_screen_response_model.dart';


class SchoolLeaderboardController extends GetxController {
  SchoolLeaderboardApi leaderboardApi = SchoolLeaderboardApi();

  var selectedTabIndex = 0.obs;
  var isLoading = false.obs;

  SchoolLeaderboardScreenResponseModel? schoolLeaderboardScreenResponseModel;

  @override
  void onInit() {
    getLeaderboardScreenDetails();
    super.onInit();
  }

  void getLeaderboardScreenDetails() async {
    isLoading.value = true;
    var response = await leaderboardApi.getSchoolLeaderboardScreenDetails();
    if (response.code == 200) {
      schoolLeaderboardScreenResponseModel = response;
      isLoading.value = false;
    } else {
      isLoading.value = false;
      //AppUtils.showSnackBar("${response.message}",title: "", status: MessageStatus.ERROR);
    }
  }
}
