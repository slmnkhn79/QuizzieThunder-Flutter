import 'package:get/get.dart';
import 'package:quizzie_thunder/apis/feed_api.dart';
import 'package:quizzie_thunder/models/feed_screen_response_model.dart';
import 'package:quizzie_thunder/models/post_card_item_model.dart';
import 'package:quizzie_thunder/utils/app_utils.dart';
import 'package:quizzie_thunder/utils/enums/snackbar_status.dart';

class FeedController extends GetxController {
  FeedApi feedApi = FeedApi();

  var posts = <PostCardModel>[].obs;
  var postLen = 0;

  var isLoading = false.obs;
  var skip = 0;
  
  var selectedPostIndex = '';
  // var selectedTabIndex = 0.obs;

  FeedScreenResponseModel? feedScreenResponseModel;
  // FeedScreenResponseModel? newFeedScreenResponseModel;

  @override
  void onInit() {
    getFeedScreenDetails();
    super.onInit();
  }

  void incrementSkip() {
    skip = skip + 2;
  }

  void getFeedScreenDetails() async {
    isLoading.value = true;
    var response = await feedApi.getFeedScreenDetails(skip: skip);
    if (response.code == 200) {

        feedScreenResponseModel = response;
        posts.addAll(feedScreenResponseModel!.posts);
        postLen = postLen + feedScreenResponseModel!.posts.length;
        print(posts.length);

      isLoading.value = false;
    } else {
      isLoading.value = false;
      AppUtils.showSnackBar("Error", status: MessageStatus.ERROR);
    }
  }
  void getFeedScreenComments() async{

  }
}
