import 'package:get/get.dart';
import 'package:quizzie_thunder/apis/school_discover_api.dart';

import '../../models/discover_screen_response_model.dart';
import '../../utils/app_utils.dart';
import '../../utils/enums/snackbar_status.dart';

class DiscoverController extends GetxController {
  SchoolDiscoverApi discoverApi = SchoolDiscoverApi();

  var isLoading = true.obs;
  var selectedTabIndex = 0.obs;

  DiscoverScreenResponseModel? discoverScreenResponseModel;

  

  @override
  void onInit() {
    getDiscoverScreenDetails();
    super.onInit();
  }

  void getDiscoverScreenDetails() async {
    isLoading.value = true;
    var response = await discoverApi.getSchoolDiscoverScreenDetails();
    if (response.code == 200) {
      discoverScreenResponseModel = response;
      isLoading.value = false;
    } else {
      isLoading.value = false;
      // AppUtils.showSnackBar("Error", status: MessageStatus.ERROR);
    }
  }
}
