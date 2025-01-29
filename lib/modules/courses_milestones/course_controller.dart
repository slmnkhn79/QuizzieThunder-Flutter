import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzie_thunder/apis/course_api.dart';
import 'package:quizzie_thunder/apis/user_progress_api.dart';
import 'package:quizzie_thunder/models/courseV2_response_model.dart';
import 'package:quizzie_thunder/modules/courses_milestones/course_completion.dart';
import 'package:quizzie_thunder/utils/app_utils.dart';
import 'package:quizzie_thunder/utils/enums/snackbar_status.dart';

class CourseController extends GetxController {
  final CourseDetailsApiService apiService = CourseDetailsApiService();
  UserProgressApi userProgressApi = UserProgressApi();
  String? courseId;

  Coursev2ResponseModel? coursev2responseModel;
  PageController modulePageController = PageController();

  // var courseDetails = Rxn<Course>();

  var selectedOptions = <int, String>{}.obs;

  final parameters = Get.parameters;

  var isLoading = true.obs;
  var errorMessage = ''.obs;
  var passedQuizzes = <int>[].obs;

  @override
  void onInit() {
    courseId = parameters['courseId'];
    super.onInit();
    fetchCourseDetails();
  }
   void selectOption(int questionIndex, String option) {
    selectedOptions[questionIndex] = option;
  }

  void fetchCourseDetails() async {
    try {
      isLoading(true);
      final response = await apiService.getCourseDetails(courseId: courseId!);
      coursev2responseModel = response;
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading(false);
    }
  }

  void checkQuizAnswers(int moduleIndex) {
    // module
    final module = coursev2responseModel!.data.modules[moduleIndex];
    final quiz = module.quiz;

    if (quiz != null) {
      bool allCorrect = true;

      for (int i = 0; i < quiz.questions.length; i++) {
        final question = quiz.questions[i];
        final selectedOption = selectedOptions[i];

        if (selectedOption != question.correctAnswer) {
          allCorrect = false;
          break;
        }
      }

      if (allCorrect) {
        passQuiz(moduleIndex);
        // print('passed');
        addMilestone(coursev2responseModel!.data.courseId, coursev2responseModel!.data.modules[moduleIndex].id,coursev2responseModel!.data.modules[moduleIndex].milestone!.id);
        //to add a milestone check all the completed modules 
        //all the required modules should be completed and checked then only a new milestone can be added
        //change the input json to have the milestone along with quiz for easy quiz to milestone mapping
        
      } else {
        errorMessage.value = 'Some answers are incorrect. Please try again.';
        print("Failed");
      }
    }
  }
  void passQuiz(int moduleIndex) {
    passedQuizzes.add(moduleIndex);
    if (moduleIndex < coursev2responseModel!.data!.modules.length - 1) {
      nextModule(moduleIndex);
    } else {
      Get.to(() => CompletionPage());
    }
  }
  void nextModule(int moduleIndex) {
    if (moduleIndex < coursev2responseModel!.data!.modules.length - 1) {
      modulePageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }
  
  Future<void> addMilestone(String courseId, String moduleId, String milestoneId) async {
    //to add a milestone check all the completed modules 
        //all the required modules should be completed and checked then only a new milestone can be added
        //change the input json to have the milestone along with quiz for easy quiz to milestone mapping
        //show a snackbar to update the milestones info to user
        final response = await userProgressApi.createUserProgress(courseId,moduleId,milestoneId);
        if(response.code == 200)
        {
            AppUtils.showSnackBar("Success", status: MessageStatus.SUCCESS);
        }
        else
        {
            AppUtils.showSnackBar("Unable to save progress", status: MessageStatus.ERROR);
        }
  }

}