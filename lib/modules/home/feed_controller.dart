import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:quizzie_thunder/apis/feed_api.dart';
import 'package:quizzie_thunder/apis/post_details_api.dart';
import 'package:quizzie_thunder/models/feed_screen_response_model.dart';
import 'package:quizzie_thunder/models/post_card_item_model.dart';
import 'package:quizzie_thunder/modules/wonderous/ui/common_libs.dart';
import 'package:quizzie_thunder/utils/app_utils.dart';
import 'package:quizzie_thunder/utils/enums/snackbar_status.dart';

class FeedController extends GetxController {
  FeedApi feedApi = FeedApi();


  var posts = <PostCardModel>[].obs;
  int pageKey = 0;

  // ScrollControllerroller;
  var postLen = 0;
  var endReached = false.obs;

  // static const _pageSize = 5;

  var isLoading = false.obs;
  var skip = 0;

  var selectedPostIndex = '';
  var isLiked = false.obs;

  FeedScreenResponseModel? feedScreenResponseModel;
  // FeedScreenResponseModel? newFeedScreenResponseModel;

  @override
  void onInit() {
    super.onInit();
    getFeedScreenDetails();
    
  }

  void getFeedScreenDetails() async {
    isLoading.value = true;
    var response = await feedApi.getFeedScreenDetails(skip: pageKey);

    if (response.code == 200) {
      feedScreenResponseModel = response;
      if(feedScreenResponseModel!.posts.isEmpty)
      {
        endReached.value = true;
      }
      else{
      posts.addAll(feedScreenResponseModel!.posts);
      pageKey = pageKey + 5;
      }
      
      // print("Page Key : ${pageKey}");
      

      isLoading.value = false;
    } else {
      isLoading.value = false;
      AppUtils.showSnackBar("Error", status: MessageStatus.ERROR);
    }
  }

  Future<bool> likePostById(bool isLiked,String postId) async{
    var response = await feedApi.likePostById(
      postId:""
      // postId 
      );
    if (response['code'] == 200 || response['code'] == 300) {
      // var newPost = posts.where((post)=> post.id == postId);
      // print( posts.where((post)=> post.id == postId));
      // posts.where((post)=> post.id == postId).first.isLiked = true;
      return true;
    }else{
      return false;
    }
  }
}
