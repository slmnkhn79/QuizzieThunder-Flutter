import 'package:get/get.dart';
import 'package:quizzie_thunder/apis/feed_api.dart';
import 'package:quizzie_thunder/models/feed_screen_response_model.dart';
import 'package:quizzie_thunder/utils/app_utils.dart';
import 'package:quizzie_thunder/utils/enums/snackbar_status.dart';



class FeedController extends GetxController {
  FeedApi feedApi = FeedApi();

  var isLoading = false.obs;
  // var selectedTabIndex = 0.obs;

  FeedScreenResponseModel? homeScreenResponseModel;

  @override
  void onInit() {
    getFeedScreenDetails();
    super.onInit();
  }

  void getFeedScreenDetails() async {
    isLoading.value = true;
    var response = await feedApi.getFeedScreenDetails();
    if (response.code == 200) {
      homeScreenResponseModel = response;
      isLoading.value = false;
    } else {
      isLoading.value = false;
      AppUtils.showSnackBar("Error", status: MessageStatus.ERROR);
    }
  }
}
