import 'package:get/get.dart';
import 'package:quizzie_thunder/apis/study_plan_api.dart';
import 'package:quizzie_thunder/models/all_study_plan_response_model.dart';
import 'package:quizzie_thunder/utils/app_utils.dart';
import 'package:quizzie_thunder/utils/enums/snackbar_status.dart';

class StudyPlansAllController extends GetxController {
  final isLoading = true.obs;
  StudyPlanApi studyPlanApi = StudyPlanApi();
  AllStudyPlanResponseModel? studyPlanResponseModel;

  @override
  void onInit() {
    getAllStudyPlans();
    super.onInit();
  }

  void getAllStudyPlans() async {
    isLoading.value = true;
    var response = await studyPlanApi.getAllStudyPlans();
    if (response.code == 200) {
      studyPlanResponseModel = response;
      isLoading.value = false;
    } else {
      isLoading.value = false;
      AppUtils.showSnackBar(response.message, status: MessageStatus.ERROR);
    }
  }
}
