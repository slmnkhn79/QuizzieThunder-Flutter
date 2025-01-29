import 'package:get/get.dart';
import 'package:quizzie_thunder/apis/quizzes_api.dart';
import 'package:quizzie_thunder/models/quiz_submission_response_model.dart';

class QuizSubmissionController extends GetxController{
  var isLoading = true.obs;
  var parameters = Get.parameters;
  QuizSubmissionResponseModel? quizSubmissionResponseModel;
  var submittedPhotoArray = [].obs;
  QuizzesApi quizzesApi = QuizzesApi();
  String quizId = '';
  String quizType = '';
  int photoSkip = 0;
  var isSubmittedPhotoLoading = false.obs;

  @override
  void onInit(){
    quizId = parameters['quizId']!;
    quizType = parameters['quizType']!;
    if(quizType == 'photo_1'){
      getAllSubmissionForPhoto();
    }
    super.onInit();
  }

  void getAllSubmissionForPhoto() async {
    isLoading.value = true;
    var response = await quizzesApi.getAllQuizSubmissionById(quizId: quizId, skip: photoSkip);
    if(response.code == 200){
      quizSubmissionResponseModel = response;
      submittedPhotoArray.addAll(quizSubmissionResponseModel!.data.allResults!);
      photoSkip = photoSkip + 9;
    }
    isLoading.value = false;
  }
  void getAllSubmissionForPhotoWithSkip() async {
    isSubmittedPhotoLoading.value = true;
    var response = await quizzesApi.getAllQuizSubmissionById(quizId: quizId, skip: photoSkip);
    if(response.code == 200){
      submittedPhotoArray.addAll(response.data.allResults!);
      photoSkip = photoSkip + 9;
    }
    isSubmittedPhotoLoading.value = false;
  }
  void likeQuizPhotoById(String photoId) async{
    var response = await quizzesApi.likeQuizSubmissionById(photoId: photoId);
    if(response.code == 200){
       var photo = submittedPhotoArray.firstWhere((p) => p.id == photoId);
       
        photo.isLiked = true;
        submittedPhotoArray.refresh();

    }
  }
    void disLikeQuizPhotoById(String photoId) async{
 var response = await quizzesApi.dislikeQuizPhotoById(photoId: photoId);
    if(response.code == 200){
       var photo = submittedPhotoArray.firstWhere((p) => p.id == photoId);
        photo.isLiked = false;
        submittedPhotoArray.refresh();

    }
  }
}