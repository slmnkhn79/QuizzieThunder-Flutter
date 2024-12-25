import 'package:get/get.dart';
import 'package:quizzie_thunder/apis/learning_api.dart';
import 'package:quizzie_thunder/models/learning_paths_resonse_model.dart';
import 'package:quizzie_thunder/utils/app_utils.dart';
import 'package:quizzie_thunder/utils/constants.dart';
import 'package:quizzie_thunder/utils/enums/snackbar_status.dart';

class LearningController extends GetxController {
  final arguments = Get.arguments;

  LearningPathApi learningPathApi = LearningPathApi();
  LearningPathsResponseModel? learningPaths;

  final isLoadingLearningPaths = true.obs;
  final isLoadingLearning = true.obs;

  final pageIsLearningPath = false.obs;

  var learningPathId = '';

  @override
  void onInit() {
    if (arguments != null) {
      pageIsLearningPath.value = arguments[ARG_IS_LEARNING_PATH];
    }
    if (pageIsLearningPath.value) {
      pageIsLearningPath.value = true;
      getLearningPaths();
    } else {
      learningPathId = arguments['learningPathId'];
      print(learningPathId);
    }

    super.onInit();
  }

  void getLearningPaths() async {
    isLoadingLearningPaths.value = true;
    var response = await learningPathApi.getLearningPaths();
    if (response.code == 200) {
      learningPaths = response;
      isLoadingLearningPaths.value = false;
    } else {
      isLoadingLearningPaths.value = false;
      AppUtils.showSnackBar("Error", status: MessageStatus.ERROR);
    }
  }
}
