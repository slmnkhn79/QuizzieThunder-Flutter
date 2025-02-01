import 'package:dartx/dartx.dart';
import 'package:get/get.dart';

import '../../apis/quizzes_api.dart';
import '../../models/all_quiz_response_model.dart';
import '../../utils/app_utils.dart';
import '../../utils/constants.dart';
import '../../utils/enums/snackbar_status.dart';

class QuizzesController extends GetxController {
  QuizzesApi quizzesApi = QuizzesApi();
  final arguments = Get.arguments;

  var allQuizzes = <Quiz>[].obs;
  var originalList = <Quiz>[];

  var isLoading = false.obs;

  var quizCategoryId = "";
  var quizCategoryName = "";

  var selectedTabIndex = 0.obs;

  @override
  void onInit() {
    if (arguments != null) {
      quizCategoryId = arguments[ARG_QUIZ_CATEGORY_ID] ?? "";
      quizCategoryName = arguments[ARG_QUIZ_CATEGORY_NAME] ?? "";
    }
    if (quizCategoryId.isEmpty) {
      getAllQuizList();
    } else {
      getAllQuizOfSpecificCategory();
    }
    super.onInit();
  }

  void getAllQuizList() async {
    isLoading.value = true;
    var response = await quizzesApi.getAllQuizList();
    if (response.code == 200) {
      // allQuizzes.clear();
      // allQuizzes.addAll(response.quizzes ?? List.empty());
      originalList.clear();
      originalList.addAll(response.quizzes ?? List.empty());
      filterQuiz();
      isLoading.value = false;
    } else {
      isLoading.value = false;
      AppUtils.showSnackBar("Error", status: MessageStatus.ERROR);
    }
  }

  void getAllQuizOfSpecificCategory() async {
    isLoading.value = true;
    var response = await quizzesApi.getAllQuizOfSpeacificCategory(
        quizCategoryId: quizCategoryId);
    if (response.code == 200) {
      // allQuizzes.clear();
      // allQuizzes.addAll(response.quizzes ?? List.empty());
      originalList.clear();
      originalList.addAll(response.quizzes ?? List.empty());
      filterQuiz();
      isLoading.value = false;
    } else {
      isLoading.value = false;
      AppUtils.showSnackBar("Error", status: MessageStatus.ERROR);
    }
  }

  filterQuiz() {
    if (selectedTabIndex.value == 0) {
      // allQuizzes.addAll(response.quizzes ?? List.empty());
      allQuizzes.value = originalList.where((item)=>item.schedule!.frequency_code == 'daily').toList();
      
    } else if (selectedTabIndex.value == 1) {
      allQuizzes.value = originalList.where((item)=>item.schedule!.frequency_code == 'weekly').toList();

    } else if (selectedTabIndex.value == 2) {
      allQuizzes.value = originalList.where((item)=>item.schedule!.frequency_code == 'monthly').toList();

    }
  }
}
