import 'package:get/get.dart';
import 'package:quizzie_thunder/apis/feed_api.dart';
import 'package:quizzie_thunder/models/feed_screen_response_model.dart';
import 'package:quizzie_thunder/models/post_card_item_model.dart';
import 'package:quizzie_thunder/models/post_response_model.dart';
import 'package:quizzie_thunder/utils/app_utils.dart';
import 'package:quizzie_thunder/utils/enums/snackbar_status.dart';

class FeedController extends GetxController {
  FeedApi feedApi = FeedApi();

  var posts = <PostCardModel>[].obs;
  int pageKey = 0;

  var selectedPostId = '';

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

  bool updateCurrentPostId() {
    return true;
  }

  void updatePostLikeState(String postId, bool isLiked) {
    var card = posts.firstWhere((item) => item.id == postId);
    card.isLiked = isLiked;
    posts.refresh();
  }

  void getFeedScreenDetails() async {
    isLoading.value = true;
    var response =
     await feedApi.getFeedScreenDetails(skip: pageKey);
    print("*************************");
    print(response);
    print("*************************");
    if (response.code == 200) {
      print("enter into if");
      feedScreenResponseModel = response;
      if (feedScreenResponseModel!.posts.isEmpty) {
        endReached.value = true;
      } else {
        posts.addAll(feedScreenResponseModel!.posts);
        pageKey = pageKey + 5;
      }

      // print("Page Key : ${pageKey}");

      isLoading.value = false;
    } else {
      print("enter into else");
      isLoading.value = false;
      AppUtils.showSnackBar("Error", status: MessageStatus.ERROR);
    }
    print("exit");
  }

  void likePostById(String? postId, bool isLiked) async {
    if (!isLiked) {
      //like
      var response =
          await feedApi.likePostById(postId: postId ?? selectedPostId);
      if (response.code == 200 || response.code == 300) {
        PostDetailsResponseModel updatedPost = response;
        var card = posts.firstWhere((item) => item.id == postId);
        card.isLiked = true;
        card.likes = updatedPost.post.likes;
        posts.refresh(); // Refresh the list to update the UI
      }
    } else {
      // unlike
      var response =
          await feedApi.dislikePostById(postId: postId ?? selectedPostId);

      if (response.code == 200 || response.code == 300) {
        PostDetailsResponseModel updatedPost = response;
        var card = posts.firstWhere((item) => item.id == postId);
        card.isLiked = false;
        card.likes = updatedPost.post.likes;
        posts.refresh();
      }
    }
  }

  void updateIsLikedAnimatingToTrue(String postId) {
    var card = posts.firstWhere((item) => item.id == postId);
    card.isLikedAnimating.value = true;

    posts.refresh();
  }

  void updateIsLikedAnimatingToFalse(String postId) {
    var card = posts.firstWhere((item) => item.id == postId);
    card.isLikedAnimating.value = false;

    posts.refresh();
  }
}
