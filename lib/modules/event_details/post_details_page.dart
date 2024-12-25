import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzie_thunder/modules/event_details/post_detail_controller.dart';
import 'package:quizzie_thunder/modules/home/post_card/like_animation.dart';
import 'package:quizzie_thunder/modules/home/post_card/post_card.dart';
import 'package:quizzie_thunder/theme/colors_theme.dart';
import 'package:quizzie_thunder/utils/app_utils.dart';

class PostDetailsPage extends StatelessWidget {
  final String eventId;
  const PostDetailsPage({super.key, required this.eventId});

  @override
  Widget build(BuildContext context) {
    PostDetailController postDetailsController =
        Get.find<PostDetailController>();
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: ThemeColor.white,
              )),
          title: Text(
            "Details", //add the event name here
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: ThemeColor.white),
          ),
          backgroundColor: ThemeColor.headerOne,
          centerTitle: true,
          elevation: 0,
        ),
        backgroundColor: ThemeColor.facebook_light_4,
        body: Obx(() => RefreshIndicator(
            onRefresh: () async {
              postDetailsController.getPostDetails();
            },
            child: postDetailsController.isLoading.value
                ? const Center(
                    child: CircularProgressIndicator(
                    color: ThemeColor.headerOne,
                  ))
                : NotificationListener<ScrollNotification>(
                    onNotification: (ScrollNotification scrollInfo) {
                      // print("scrollInfo : ${scrollInfo}");
                      if (!postDetailsController.isCommentsLoading.value &&
                          scrollInfo.metrics.pixels ==
                              scrollInfo.metrics.maxScrollExtent) {
                        // print('end reached');
                        postDetailsController.getComments();
                      }
                      return false;
                    },
                    child: SingleChildScrollView(
                      // controller: postDetailsController.scrollController,
                      child: Center(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width > 600
                              ? 600
                              : MediaQuery.of(context).size.width,
                          child: Container(
                            color: ThemeColor.headerThree,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Column(
                                children: [
                                  Container(
                                    // boundary needed for web
                                    decoration: BoxDecoration(
                                      // border: Border(
                                      //     // color: width > webScreenSize ? secondaryColor : mobileBackgroundColor,
                                      //     ),
                                      // borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                      color: Colors.white,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                    ),
                                    child: Column(
                                      children: [
                                        // HEADER SECTION OF THE POST
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 4,
                                            horizontal: 16,
                                          ).copyWith(right: 0),
                                          child: Row(
                                            children: <Widget>[
                                              CircleAvatar(
                                                radius: 16,
                                                backgroundImage: NetworkImage(
                                                    // post.profImage.toString(),
                                                    postDetailsController
                                                        .postDetailsResponseModel!
                                                        .post
                                                        .school
                                                        .logo),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    left: 8,
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      Text(
                                                        postDetailsController
                                                            .postDetailsResponseModel!
                                                            .post
                                                            .school
                                                            .schoolName
                                                            .toString(),
                                                        style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              // widget.snap['uid'].toString() == user.uid
                                              1 == 1
                                                  ? IconButton(
                                                      onPressed: () {
                                                        showDialog(
                                                          useRootNavigator:
                                                              false,
                                                          context: context,
                                                          builder: (context) {
                                                            return Dialog(
                                                              child: ListView(
                                                                  padding: const EdgeInsets
                                                                      .symmetric(
                                                                      vertical:
                                                                          16),
                                                                  shrinkWrap:
                                                                      true,
                                                                  children: [
                                                                    'Delete',
                                                                  ]
                                                                      .map(
                                                                        (e) => InkWell(
                                                                            child: Container(
                                                                              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                                                                              child: Text(e),
                                                                            ),
                                                                            onTap: () {
                                                                              // deletePost(
                                                                              //   widget.snap['postId']
                                                                              //       .toString(),
                                                                              // );
                                                                              // remove the dialog box
                                                                              Navigator.of(context).pop();
                                                                            }),
                                                                      )
                                                                      .toList()),
                                                            );
                                                          },
                                                        );
                                                      },
                                                      icon: const Icon(
                                                          Icons.more_vert),
                                                    )
                                                  : Container(),
                                            ],
                                          ),
                                        ),
                                        // IMAGE SECTION OF THE POST
                                        GestureDetector(
                                          onDoubleTap: () {
                                            postDetailsController.likePostById(
                                                // postDetailsController
                                                //     .postDetailsResponseModel!
                                                //     .post
                                                //     .isLiked
                                                    false);
                                            postDetailsController
                                                .isLikeAnimating.value = true;
                                          },
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              SizedBox(
                                                height: 400,
                                                width: double.infinity,
                                                child: CachedNetworkImage(
                                                    imageUrl: postDetailsController
                                                        .postDetailsResponseModel!
                                                        .post
                                                        .imageUrl
                                                        .toString(),
                                                    fit: BoxFit.cover,
                                                    fadeInDuration: Duration(
                                                        milliseconds: 0),
                                                    fadeOutDuration: Duration(
                                                        milliseconds: 0),
                                                    progressIndicatorBuilder: (context,
                                                            url,
                                                            downloadProgress) =>
                                                        Image.asset(
                                                            "assets/images/placeholder.png"),
                                                    // ),
                                                    errorWidget:
                                                        (context, url, error) =>
                                                            Icon(Icons.error)),
                                              ),
                                              AnimatedOpacity(
                                                duration: const Duration(
                                                    milliseconds: 200),
                                                opacity: postDetailsController
                                                        .isLikeAnimating.value
                                                    ? 1
                                                    : 0,
                                                child: LikeAnimation(
                                                  isAnimating:
                                                      postDetailsController
                                                          .isLikeAnimating
                                                          .value,
                                                  duration: const Duration(
                                                    milliseconds: 400,
                                                  ),
                                                  onEnd: () {
                                                    postDetailsController
                                                        .isLikeAnimating
                                                        .value = false;
                                                  },
                                                  child: const Icon(
                                                    Icons.favorite,
                                                    color: Colors.white,
                                                    size: 100,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        // LIKE, COMMENT SECTION OF THE POST
                                        Row(
                                          children: <Widget>[
                                            Text(
                                              postDetailsController
                                                  .isLiked.value
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 1,
                                                  color: ThemeColor.white),
                                            ),

                                            LikeAnimation(
                                              isAnimating: postDetailsController
                                                  .postDetailsResponseModel!
                                                  .post
                                                  .isLiked,
                                              smallLike: false,
                                              child: IconButton(
                                                  icon: postDetailsController
                                                          .postDetailsResponseModel!
                                                          .post
                                                          .isLiked
                                                      ? const Icon(
                                                          Icons.favorite,
                                                          color: Colors.red,
                                                        )
                                                      : const Icon(
                                                          Icons.favorite_border,
                                                        ),
                                                  onPressed: () => {
                                                        postDetailsController
                                                            .likePostById(
                                                                postDetailsController
                                                                    .postDetailsResponseModel!
                                                                    .post
                                                                    .isLiked)
                                                      }),
                                            ),
                                            DefaultTextStyle(
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleSmall!
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w800),
                                                child: Text(
                                                  '${postDetailsController.postDetailsResponseModel!.post.likes.toString()} likes',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium,
                                                )),
                                            // IconButton(
                                            //     icon: const Icon(
                                            //       Icons.comment_outlined,
                                            //     ),
                                            //     onPressed: () => {}
                                            //     // Navigator.of(context).push(
                                            //     // MaterialPageRoute(
                                            //     //   builder: (context) => CommentsScreen(
                                            //     //     postId: widget.snap['postId'].toString(),
                                            //     //   ),
                                            //     // ),
                                            //     ),
                                            // IconButton(
                                            //     icon: const Icon(
                                            //       Icons.send,
                                            //     ),
                                            //     onPressed: () {}),
                                            Expanded(
                                                child: Align(
                                              alignment: Alignment.bottomRight,
                                              child: IconButton(
                                                  icon: const Icon(
                                                      Icons.bookmark_border),
                                                  onPressed: () {}),
                                            ))
                                          ],
                                        ),
                                        //DESCRIPTION AND NUMBER OF COMMENTS
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Container(
                                                width: double.infinity,
                                                padding: const EdgeInsets.only(
                                                  top: 8,
                                                ),
                                                child: RichText(
                                                  text: TextSpan(
                                                    // style: const TextStyle(color: primaryColor),
                                                    children: [
                                                      TextSpan(
                                                        text: postDetailsController
                                                            .postDetailsResponseModel!
                                                            .post
                                                            .school
                                                            .schoolName
                                                            .toString(),
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: ThemeColor
                                                                .black),
                                                      ),
                                                      TextSpan(
                                                        text:
                                                            ' ${postDetailsController.postDetailsResponseModel!.post.caption}',
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: ThemeColor
                                                                .headerOne),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 4),
                                                child: Text(
                                                  AppUtils.timeAgo(
                                                      postDetailsController
                                                          .postDetailsResponseModel!
                                                          .post
                                                          .createdAt!),
                                                  style: const TextStyle(
                                                    color: ThemeColor.headerOne,
                                                  ),
                                                ),
                                              ),
                                              Divider(),
                                            ],
                                          ),
                                        ),
                                        inputCommentBox(postDetailsController),
                                        getComments(postDetailsController)
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ))));
  }

  Padding inputCommentBox(PostDetailController postDetailController) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          // Circular Profile Image
          CircleAvatar(
            backgroundImage: NetworkImage('https://example.com/profile.jpg'),
            radius: 18.0,
          ),
          SizedBox(width: 8.0),
          // Comment Input Field
          Expanded(
            child: TextField(
              onChanged: postDetailController.updateComment,
              controller: postDetailController.commentController,
              decoration: InputDecoration(
                hintText: 'Add a comment...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                enabled: postDetailController.isCommentPosted.value,
                contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
              ),
            ),
          ),
          SizedBox(width: 8.0),

          IconButton(
            icon: Icon(Icons.send),
            onPressed: postDetailController.isCommentPosted.value &&
                    postDetailController.commentText.isNotEmpty
                ?
                // Handle like action
                postDetailController.addComment
                : () {},
          )
        ],
      ),
    );
  }

  Container getComments(PostDetailController postDetailController) {
    return Container(
      child: postDetailController.comments.isEmpty
          ? Container()
          : Column(
              children: [
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: postDetailController.comments.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Circular Profile Image
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                    postDetailController
                                        .comments[index].profilePic),
                                radius: 20.0,
                              ),
                              SizedBox(width: 10.0),
                              // Comment Text and Metadata
                              Expanded(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Username and Comment
                                    RichText(
                                      text: TextSpan(
                                        style: TextStyle(color: Colors.black),
                                        children: [
                                          TextSpan(
                                              text:
                                                  "@${postDetailController.comments[index].user}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          TextSpan(
                                              text: postDetailController
                                                  .comments[index].content)
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 5.0),
                                    // Comment date
                                    Text(
                                      AppUtils.timeAgo(postDetailController
                                          .comments[index].createdAt),
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 12.0),
                                    ),
                                  ],
                                ),
                              ),
                              // Like Button
                              Row(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.favorite_border),
                                    onPressed: () {
                                      // Handle like action
                                      print("Liked!");
                                    },
                                  ),
                                  Text(
                                    '99',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 12.0),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                postDetailController.isCommentsLoading.value
                    ? CircularProgressIndicator()
                    : Container(),
                // TextButton(
                //     onPressed: postDetailController.getComments,
                //     child: Text("Load More"))
              ],
            ),
    );
  }
}
