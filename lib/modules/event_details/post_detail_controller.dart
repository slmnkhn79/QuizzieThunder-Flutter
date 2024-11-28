import 'package:get/get.dart';
import 'package:quizzie_thunder/apis/post_details_api.dart';
import 'package:quizzie_thunder/models/post_card_item_model.dart';
import 'package:quizzie_thunder/models/post_comment_response_model.dart';
import 'package:quizzie_thunder/models/post_response_model.dart';
import 'package:quizzie_thunder/utils/app_utils.dart';
import 'package:quizzie_thunder/utils/constants.dart';
import 'package:quizzie_thunder/utils/enums/snackbar_status.dart';

class PostDetailController extends GetxController {
  PostDetailsApi postDetailsApi = PostDetailsApi();
  final arguments = Get.arguments;
  var isLoading = true.obs;
  late String postId;
  var commentText = ''.obs;
  var isCommentsLoading = true.obs;
  var isCommentPosted = true.obs;
  var skip = 0;
  var limit = 5;
  var comments = [].obs;

  PostDetailsResponseModel? postDetailsResponseModel;
  PostCommentResponseModel? postCommentResponseModel;

  @override
  void onInit() {
    if (arguments != null) {
      postId = arguments[ARG_POST_ID];
      getPostDetails();
      getComments();
    }
    super.onInit();
  }

  void updateComment(String value) {
    commentText.value = value;
  }

  void getPostDetails() async {
    isLoading.value = true;
    var response = await postDetailsApi.getPostById(postId: postId);
    if (response.code == 200) {
      postDetailsResponseModel = response;
      isLoading.value = false;
    } else {
      isLoading.value = false;
      AppUtils.showSnackBar("Error", status: MessageStatus.ERROR);
    }
  }

  void addComment() async {
    isCommentPosted.value = false;
    var response = await postDetailsApi.addCommentToPost(
        postId: postId, content: commentText.value);
    if (response['code']== 200) {
      // postDetailsResponseModel = response;
      isCommentPosted.value = true;
      commentText.value ='';
      skip = 0;
      limit = 5;
      getComments();
    } else {
      isCommentPosted.value = true;
      AppUtils.showSnackBar("Error", status: MessageStatus.ERROR);
    }
  }

  void getComments() async {
    isCommentsLoading.value = true;
    var response = await postDetailsApi.getCommentForPost(
        postId: postId, skip:  skip, limit: limit);
    if (response.code == 200) {
      postCommentResponseModel = response;
      if(skip == 0) comments.value = []; 
      comments.addAll(postCommentResponseModel!.comments);

      isCommentsLoading.value = false;
      skip = skip + comments.length;
    } else {
      isCommentsLoading.value = false;
      AppUtils.showSnackBar("Error", status: MessageStatus.ERROR);
    }
  }
}
