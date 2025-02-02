import 'package:get/get.dart';
import 'package:quizzie_thunder/apis/study_plan_api.dart';
import 'package:quizzie_thunder/models/all_study_plan_response_model.dart';
import 'package:quizzie_thunder/utils/app_utils.dart';
import 'package:quizzie_thunder/utils/enums/snackbar_status.dart';

import 'package:quizzie_thunder/models/generic_search_response_model.dart';
import 'package:quizzie_thunder/apis/search_api.dart';

class StudyPlansAllController extends GetxController {
  final isLoading = true.obs;
  final isSearchLoading = true.obs;
  final isLoadingStudyPlans = true.obs;

  StudyPlanApi studyPlanApi = StudyPlanApi();
  SearchApi searchApi = SearchApi();

  GenericSearchResponseModel? searchResponseModel;
  AllStudyPlanResponseModel? studyPlanResponseModel;

  var searchTermId = '';

  @override
  void onInit() {
    getAllStudyPlans();
    getSearchTerms();
    super.onInit();
  }

  void getAllStudyPlans() async {
    isLoading.value = true;
    var response =
        await studyPlanApi.getAllStudyPlans(searchTermId: searchTermId);
    if (response.code == 200) {
      studyPlanResponseModel = response;
      isLoading.value = false;
    } else {
      isLoading.value = false;
      AppUtils.showSnackBar(response.message, status: MessageStatus.ERROR);
    }
  }

  void getSearchTerms() async {
    isSearchLoading.value = true;
    var response = await searchApi.getSearchTerms();
    if (response.code == 200) {
      searchResponseModel = response;
      isSearchLoading.value = false;
    } else {
      isSearchLoading.value = false;
      AppUtils.showSnackBar("Error", status: MessageStatus.ERROR);
    }
  }

  void setSearchTermId(String id) {
    searchTermId = id;
    getAllStudyPlans();
  }
}
