import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quizzie_thunder/apis/quizDetail_api.dart';
import 'package:quizzie_thunder/models/quiz_detail_response_model.dart';
import 'package:quizzie_thunder/utils/app_utils.dart';
import 'package:quizzie_thunder/utils/enums/snackbar_status.dart';

import '../../models/all_quiz_response_model.dart';
import '../../utils/constants.dart';

class QuizDetailController extends GetxController {
  QuizDetailApi quizDetailApi = QuizDetailApi();
  QuizDetailResponseModel? quizDetailResponseModel;
  final arguments = Get.arguments;

  var isLoading = false.obs;


  Quiz? quizDetail;

  String quizId ='';

  var quizCategoryName = "";

  @override
  void onInit() {
    if (arguments != null) {
      // quizDetail = arguments[ARG_QUIZ_DETAIL];
      quizId = arguments[ARG_QUIZ_ID];
      // quizCategoryName = arguments[ARG_QUIZ_CATEGORY_NAME] ?? "";
      getQuizDetail(quizId);
    }
    super.onInit();
  }
void getQuizDetail(String quizId) async {
    isLoading.value = true;
    // QuizDetailResponseModel quizResultPostBodyModel =
    //     QuizDetailResponseModel(quizId:  quizId, userId: GetStorage().read(KEY_USER_DATA)['result']['_id']);
    var response = await quizDetailApi.getQuizDetail(quizId: quizId, userId: GetStorage().read(KEY_USER_DATA)['result']['_id']);
    if (response.code == 200) {
      quizDetailResponseModel = response;
      isLoading.value = false;
    } else {
      isLoading.value = false;
      AppUtils.showSnackBar("Error", status: MessageStatus.ERROR);
    }
  }
}
