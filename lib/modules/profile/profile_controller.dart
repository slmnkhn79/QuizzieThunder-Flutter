import 'package:get/get.dart';

import '../../apis/profile_api.dart';
import '../../models/profile_screen_response_model.dart';
import '../../utils/app_utils.dart';
import '../../utils/enums/snackbar_status.dart';

class ProfileController extends GetxController {
  ProfileApi profileApi = ProfileApi();

  var selectedTabIndex = 0.obs;
  var isLoading = false.obs;

  ProfileScreenResponseModel? profileScreenResponseModel;

  @override
  void onInit() {
    getProfileScreenDetails();
    super.onInit();
  }

  void getProfileScreenDetails() async {
    isLoading.value = true;
    var response = await profileApi.getProfileScreenDetails();
    if (response.code == 200) {
      isLoading.value = false;
      profileScreenResponseModel = response;
    } else {
      isLoading.value = false;
      AppUtils.showSnackBar("Error", status: MessageStatus.ERROR);
    }
  }
}
