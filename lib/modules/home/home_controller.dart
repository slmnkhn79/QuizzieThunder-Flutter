import 'package:get/get.dart';
import 'package:quizzie_thunder/utils/app_utils.dart';
import 'package:quizzie_thunder/utils/enums/snackbar_status.dart';

import '../../apis/home_api.dart';
import '../../models/home_screen_response_model.dart';

class HomeController extends GetxController {
  HomeApi homeApi = HomeApi();

  var isLoading = false.obs;
  var selectedTabIndex = 0.obs;

  HomeScreenResponseModel? homeScreenResponseModel;

  @override
  void onInit() {
    getHomeScreenDetails();
    super.onInit();
  }

  void getHomeScreenDetails() async {
    isLoading.value = true;
    var response = await homeApi.getHomeScreenDetails();
    if (response.code == 200) {
      homeScreenResponseModel = response;
      isLoading.value = false;
    } else
    if(response.code == 500)
     {
      isLoading.value = false;
      // AppUtils.showSnackBar(response.message! , status: MessageStatus.ERROR);
    }
  }
}
