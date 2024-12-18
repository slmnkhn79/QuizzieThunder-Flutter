import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:quizzie_thunder/apis/learning_api.dart';
import 'package:quizzie_thunder/models/learning_path_by_id_resonse_model.dart';
import 'package:quizzie_thunder/models/learning_paths_resonse_model.dart';
import 'package:quizzie_thunder/utils/app_utils.dart';
import 'package:quizzie_thunder/utils/constants.dart';
import 'package:quizzie_thunder/utils/enums/snackbar_status.dart';

class LearningByIdController extends GetxController {
  final arguments = Get.arguments;

  LearningPathApi learningPathApi = LearningPathApi();
  LearningPathByIdResponseModel? learningPath;

  final isLoadingLearning = true.obs;
  var learningPathId = '';

  @override
  void onInit() {
    if (arguments != null) {
      learningPathId = arguments[ARG_LEARNING_PATH_ID];
    }
    getLearningPathById();

    super.onInit();
  }

  void getLearningPathById() async {
    isLoadingLearning.value = true;
    var response = await learningPathApi.getLearningPathById(learningPathId);
    if (response.code == 200) {
      learningPath = response;
      isLoadingLearning.value = false;
    } else {
      isLoadingLearning.value = false;
      AppUtils.showSnackBar("Error", status: MessageStatus.ERROR);
    }
  }
}
