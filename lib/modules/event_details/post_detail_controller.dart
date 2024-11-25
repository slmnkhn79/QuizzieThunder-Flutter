import 'package:get/get.dart';
import 'package:quizzie_thunder/apis/post_details_api.dart';
import 'package:quizzie_thunder/models/post_response_model.dart';
import 'package:quizzie_thunder/utils/app_utils.dart';
import 'package:quizzie_thunder/utils/constants.dart';
import 'package:quizzie_thunder/utils/enums/snackbar_status.dart';



class PostDetailController extends GetxController {
  PostDetailsApi postDetailsApi = PostDetailsApi();
  final arguments = Get.arguments;
  var isLoading = true.obs;
  var postId = '';

  PostDetailsResponseModel? postDetailsResponseModel;



  @override
  void onInit() {
    if (arguments != null) {
      postId = arguments[ARG_POST_ID];
      getPostDetails();
    }
    super.onInit();
  }

  void getPostDetails() async {
    isLoading.value = true;
    var response = await postDetailsApi.getPostById(postId:postId);
    if (response.code == 200) {
      postDetailsResponseModel = response;
      isLoading.value = false;
    } else {
      isLoading.value = false;
      AppUtils.showSnackBar("Error", status: MessageStatus.ERROR);
    }
  }
}
