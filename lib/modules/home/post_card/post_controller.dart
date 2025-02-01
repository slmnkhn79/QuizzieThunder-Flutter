import 'package:get/get.dart';
import 'package:quizzie_thunder/apis/feed_api.dart';

import '../../../models/post_card_item_model.dart';


class PostController extends GetxController {
  FeedApi feedApi = FeedApi();

  // var posts = <PostCardModel>[].obs;
  var postLen = 0;

  var isLoading = false.obs;
  var skip = 0;
  
  var selectedPostIndex = '';
  // var selectedTabIndex = 0.obs;

  PostCardItemModel? PostCardModel;
  // FeedScreenResponseModel? newFeedScreenResponseModel;

  @override
  void onInit() {
    getFeedScreenComments();
    super.onInit();
  }

  void incrementSkip() {
    skip = skip + 2;
  }

  void getFeedScreenComments() async{

  }
}
