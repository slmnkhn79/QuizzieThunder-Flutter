
import 'package:get/get.dart';
import 'package:quizzie_thunder/apis/user_progress_api.dart';
import 'package:quizzie_thunder/models/user_progress_response_model.dart';

class UserProgressController extends GetxController {
  final UserProgressApi apiService = UserProgressApi();
  UserProgressResponseModel? userProgressResponseModel;
  var isLoading = false.obs;

  void fetchUserProgress(String userId, String courseId) async {
    isLoading(true);
    var response = await apiService.getUserProgress(userId);
    if (response.code == 200) {
      userProgressResponseModel =response;
    }
    isLoading(false);
  }

  void addUserProgress(String courseId, String moduleId, String milestoneId) async {
    isLoading(true);
    // var userProgress = userProgressResponseModel!.userProgress.firstWhere((item) => item.id == milestoneId);
    // userProgress.addMile

    final response = await apiService.createUserProgress(courseId, moduleId, milestoneId);
    if (response.code == 200) {
      userProgressResponseModel = response;
    }
    isLoading(false);
  }

  // void updateUserProgress(UserProgress userProgress) async {
  //   isLoading(true);
  //   final response = await apiService.updateUserProgress(String courseId, String moduleId);
  //   if (response.statusCode == 200) {
  //     final index = userProgressList.indexWhere((item) => item.objectId == userProgress.objectId);
  //     if (index != -1) {
  //       userProgressList[index] = UserProgress.fromJson(jsonDecode(response.body));
  //     }
  //   }
  //   isLoading(false);
  // }

 
}