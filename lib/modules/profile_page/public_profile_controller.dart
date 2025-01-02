import 'package:get/get.dart';
import 'package:quizzie_thunder/apis/profile_api.dart';
import 'package:quizzie_thunder/models/public_profile_screen_response_model.dart';
import 'package:quizzie_thunder/utils/app_utils.dart';
import 'package:quizzie_thunder/utils/constants.dart';
import 'package:quizzie_thunder/utils/enums/snackbar_status.dart';

class PublicProfileController extends GetxController {
  var isLoading = false.obs;
  var profileData = {}.obs;
  ProfileApi profileApi = ProfileApi();
  final arguments = Get.arguments;
  var userId = '';
  PublicProfileScreenResponseModel? publicProfileScreenResponseModel;

  @override
  void onInit() {
    if (arguments != null) {
      userId = arguments[ARG_STUDENT_ID];
      fetchProfileData();
    }
    super.onInit();
  }

  void fetchProfileData() async {
    isLoading.value = true;
    var response = await profileApi.getPublicProfileScreenDetails(userId);
    if (response.code == 200) {
      publicProfileScreenResponseModel = response;
    } else {
      publicProfileScreenResponseModel = response;
      AppUtils.showSnackBar(response.message!, status: MessageStatus.ERROR);
    }
    isLoading.value = false;
  }
}
