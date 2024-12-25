import 'package:get/get.dart';
import 'package:quizzie_thunder/apis/discover_api.dart';
import 'package:quizzie_thunder/models/discover_learning_model.dart';

import '../../utils/app_utils.dart';
import '../../utils/enums/snackbar_status.dart';

class LearningDiscoverController extends GetxController {
  LearningApi learningApi = LearningApi();

  var isLoading = true.obs;

  DiscoverLearningResponseModel? discoverLearningResponseModel;

  @override
  void onInit() {
    getDiscoverScreenDetails();
    super.onInit();
  }

  void getDiscoverScreenDetails() async {
    isLoading.value = true;
    var response = await learningApi.getLearningDiscoverScreenDetails();
    if (response.code == 200) {
      discoverLearningResponseModel = response;
      isLoading.value = false;
    } else {
      isLoading.value = false;
      AppUtils.showSnackBar("Error", status: MessageStatus.ERROR);
    }
  }
}
