import 'package:cached_network_image_platform_interface/cached_network_image_platform_interface.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzie_thunder/models/post_card_item_model.dart';
import 'package:quizzie_thunder/modules/home/feed_controller.dart';
import 'package:quizzie_thunder/modules/home/post_card/like_animation.dart';
import 'package:quizzie_thunder/modules/wonderous/ui/full_screen_picture/fullscreen_url_img_viewer.dart';
import 'package:quizzie_thunder/modules/wonderous/ui/full_screen_picture/fullscreen_url_img_viewer_v2.dart';
import 'package:quizzie_thunder/routes/app_routes.dart';
import 'package:quizzie_thunder/theme/colors_theme.dart';
import 'package:quizzie_thunder/utils/app_utils.dart';
import 'package:quizzie_thunder/utils/constants.dart';
import 'package:shimmer/shimmer.dart';

class PostCard extends StatelessWidget {
  final PostCardModel post;
  final FeedController feedController;

  const PostCard({super.key, required this.post, required this.feedController});

  @override
  Widget build(BuildContext context) {
    // final PostCardContoller = Get.put()
    return getPostCardView(post, context);
  }

  Container getPostCardView(PostCardModel post, BuildContext context) {
    return Container(
      // boundary needed for web
      decoration: BoxDecoration(
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
                    post.school.profilePic.toString(),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 8,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          post.school.schoolName.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                post.isLiked
                    ? IconButton(
                        onPressed: () {
                          showDialog(
                            useRootNavigator: false,
                            context: context,
                            builder: (context) {
                              return Dialog(
                                child: ListView(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16),
                                    shrinkWrap: true,
                                    children: [
                                      'Delete',
                                    ]
                                        .map(
                                          (e) => InkWell(
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 12,
                                                        horizontal: 16),
                                                child: Text(e),
                                              ),
                                              onTap: () {
                                                Navigator.of(context).pop();
                                              }),
                                        )
                                        .toList()),
                              );
                            },
                          );
                        },
                        icon: const Icon(Icons.more_vert),
                      )
                    : Container(),
              ],
            ),
          ),
          // IMAGE SECTION OF THE POST
          post.photoUrl.isEmpty   ? Container(): 
          GestureDetector(
            onTap: () {
              feedController.selectedPostIndex = post.id;
              Get.toNamed(AppRoutes.postDetailsPage,
                  arguments: {ARG_POST_ID: post.id});
            },
            onDoubleTap: () {
              feedController.likePostById(post.id, false);
              feedController.updateIsLikedAnimatingToTrue(post.id);
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                CachedNetworkImage(
                    imageRenderMethodForWeb: ImageRenderMethodForWeb.HttpGet,
                    imageUrl: post.photoUrl.toString(),
                    fit: BoxFit.cover,
                    fadeInDuration: Duration(milliseconds: 0),
                    fadeOutDuration: Duration(milliseconds: 0),
                    progressIndicatorBuilder: (context, url,
                            downloadProgress) =>
                        // Image.asset("assets/images/placeholder.png")
                        Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.white,
                            child:
                                Image.asset("assets/images/placeholder.png")),
                    // ),
                    errorWidget: (context, url, error) => Icon(Icons.error)),
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: post.isLikedAnimating.value ? 1 : 0,
                  child: LikeAnimation(
                    isAnimating: post.isLikedAnimating.value,
                    duration: const Duration(
                      milliseconds: 200,
                    ),
                    onEnd: () {
                      feedController.updateIsLikedAnimatingToFalse(post.id);
                    },
                    child: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 100,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // LIKE, COMMENT SECTION OF THE POST
          getDescription(context, feedController),
          getLikeComments(context, feedController),
          
          //DESCRIPTION AND NUMBER OF COMMENTS
          
        ],
      ),
    );
  }
  Container getDescription(BuildContext context, FeedController feedController)
  {
    return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
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
                          text: post.title.toString(),
                          // text: "salman",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: ThemeColor.black),
                        ),
                      ],
                    ),
                  ),
                ),
                Text(
                  ' ${post.caption}',
                  maxLines: 3,
                  overflow: TextOverflow.fade,
                  style: const TextStyle(
                      fontWeight: FontWeight.w100,
                      color: Color.fromARGB(255, 75, 75, 75)),
                ),
                // InkWell(
                //   child: Container(
                //     padding: const EdgeInsets.symmetric(vertical: 4),
                //     child: Text(
                //       'View all $commentLen comments',
                //       style: const TextStyle(
                //         fontSize: 16,
                //         color: secondaryColor,
                //       ),
                //     ),
                //   ),
                //   onTap: () => Navigator.of(context).push(
                //     MaterialPageRoute(
                //       builder: (context) => CommentsScreen(
                //         postId: widget.snap['postId'].toString(),
                //       ),
                //     ),
                //   ),
                // ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    // DateFormat.yMMMd()
                    //     .format(widget.snap['datePublished'].toDate()),
                    AppUtils.timeAgo(post.createdAt!),

                    style: const TextStyle(
                      color: ThemeColor.headerOne,
                    ),
                  ),
                ),
              ],
            ),
          );
  }
  Row getLikeComments(BuildContext context, FeedController feedController) {
    return Row(
            children: <Widget>[
              AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: post.isLiked ? 1 : 0.5,
                child: LikeAnimation(
                  isAnimating: post.isLiked,
                  smallLike: false,
                  child: IconButton(
                      icon: post.isLiked
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          : const Icon(
                              Icons.favorite_border,
                            ),
                      onPressed: () =>
                          feedController.likePostById(post.id, post.isLiked)),
                ),
              ),
              DefaultTextStyle(
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontWeight: FontWeight.w800),
                    child: Text(
                      '${post.likes.toString()}',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: ThemeColor.headerOne),
                    )),
              IconButton(
                  icon: const Icon(
                    Icons.comment_outlined,
                  ),
                  onPressed: () => {}
                  // Navigator.of(context).push(
                  // MaterialPageRoute(
                  //   builder: (context) => CommentsScreen(
                  //     postId: widget.snap['postId'].toString(),
                  //   ),
                  // ),
                  ),
              IconButton(
                  icon: const Icon(
                    Icons.send,
                  ),
                  onPressed: () {}),
              Expanded(
                  child: Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                    icon: const Icon(Icons.bookmark_border), onPressed: () {}),
              ))
            ],
          );
  }
}
