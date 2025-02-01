import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzie_thunder/apis/learning_api.dart';
import 'package:quizzie_thunder/apis/search_api.dart';
import 'package:quizzie_thunder/models/generic_search_response_model.dart';
import 'package:quizzie_thunder/models/learning_paths_resonse_model.dart';
import 'package:quizzie_thunder/utils/app_utils.dart';
import 'package:quizzie_thunder/utils/constants.dart';
import 'package:quizzie_thunder/utils/enums/snackbar_status.dart';

class LearningController extends GetxController {
  final arguments = Get.arguments;

  LearningPathApi learningPathApi = LearningPathApi();
  SearchApi searchApi = SearchApi();

  LearningPathsResponseModel? learningPaths;
  GenericSearchResponseModel? searchResponseModel;

  final isLoadingLearningPaths = true.obs;
  final isLoadingLearning = true.obs;
  final isSearchLoading = true.obs;

  final pageIsLearningPath = false.obs;

  var learningPathId = '';
  var searchTermId = '';
  @override
  void onInit() {
    if (arguments != null) {
      pageIsLearningPath.value = arguments[ARG_IS_LEARNING_PATH];
      getLearningPaths();
    }
    getSearchTerms();
    super.onInit();
  }

  void getLearningPaths() async {
    isLoadingLearningPaths.value = true;

    var response = await learningPathApi.getLearningPaths(searchTermId:  searchTermId);

    if (response.code == 200) {
      learningPaths = response;
      isLoadingLearningPaths.value = false;
    } else {
      isLoadingLearningPaths.value = false;
      AppUtils.showSnackBar("Error", status: MessageStatus.ERROR);
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
    getLearningPaths();
  }
}
