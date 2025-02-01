import 'package:get/get.dart';
import 'package:quizzie_thunder/apis/books_api.dart';
import 'package:quizzie_thunder/apis/course_content.dart';
import 'package:quizzie_thunder/models/all_books_response_model.dart';
import 'package:quizzie_thunder/models/all_course_content_model.dart';
import 'package:quizzie_thunder/utils/app_utils.dart';
import 'package:quizzie_thunder/utils/enums/snackbar_status.dart';

class AllCourseContentController  extends GetxController{
  final isLoading = true.obs;
  AllCourseContentResponseModel? allCourseContentResponseModel;
  CourseContentAPI courseContentAPI = CourseContentAPI();

  @override
  void onInit(){
    getAllCourseContent();
    super.onInit();
  }
  void getAllCourseContent() async {
    isLoading.value = true;
    var response = await courseContentAPI.getAllCourses();
    if (response.code == 200) {
      allCourseContentResponseModel = response;
      isLoading.value = false;
    } else {
      isLoading.value = false;
      AppUtils.showSnackBar("Error", status: MessageStatus.ERROR);
    }
  }
}
