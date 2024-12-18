import 'package:get/get.dart';
import 'package:quizzie_thunder/apis/study_plan_api.dart';
import 'package:quizzie_thunder/models/study_plan_response_model.dart';
import 'package:quizzie_thunder/utils/constants.dart';

class StudyPlanByIdController extends GetxController{
  final arguments = Get.arguments;
  final isLoading = true.obs;
  StudyPlanResponseModel? studyPlanResponseModel;
  String studyPlanId  = '';
  StudyPlanApi studyPlanApi = StudyPlanApi();

  @override
  void onInit(){
    if(arguments != null)
    {
      studyPlanId = arguments[ARG_STUDY_PLAN_ID];
    }
    getStudyPlanById();
    super.onInit();
  }

  void getStudyPlanById() async{
    isLoading.value  = true;
    var response = await studyPlanApi.getStudyPlanById(studyPlanId: studyPlanId);
    if(response.code == 200){
      isLoading.value = false;
      studyPlanResponseModel = response;
    }else{
      isLoading.value = false;
    }
  }

}