import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';
import 'package:quizzie_thunder/models/post_card_item_model.dart';
import 'package:quizzie_thunder/modules/home/feed_controller.dart';
import 'package:quizzie_thunder/modules/home/post_card/like_animation.dart';
import 'package:quizzie_thunder/theme/colors_theme.dart';
import 'package:quizzie_thunder/utils/app_utils.dart';

class PostCard extends StatelessWidget {
  final PostCardModel post;
  final FeedController feedController;

  const PostCard({super.key, required this.post, required this.feedController});
  @override
  Widget build(BuildContext context) {
    return getPostCardView(post, context);
  }

  Container getPostCardView(PostCardModel post, BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
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
                      'https://res.cloudinary.com/dt6hyafmc/image/upload/v1692392344/Avatars/avatar_8609.png'),
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
                // widget.snap['uid'].toString() == user.uid
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
                        icon: const Icon(Icons.more_vert),
                      )
                    : Container(),
              ],
            ),
          ),
          // IMAGE SECTION OF THE POST
          GestureDetector(
            onDoubleTap: () {
              // FireStoreMethods().likePost(
              //   widget.snap['postId'].toString(),
              //   user.uid,
              //   widget.snap['likes'],
              // );
              // setState(() {
              //   isLikeAnimating = true;
              // });
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 400,
                  width: double.infinity,
                  child: CachedNetworkImage(
                      imageUrl: post.photoUrl.toString(),
                      fit: BoxFit.cover,
                      fadeInDuration: Duration(milliseconds: 0),
                      fadeOutDuration: Duration(milliseconds: 0),
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                              Image.asset("assets/images/placeholder.png"),
                      // ),
                      errorWidget: (context, url, error) => Icon(Icons.error)),
                ),
                // AnimatedOpacity(
                //   duration: const Duration(milliseconds: 200),
                //   opacity: isLikeAnimating ? 1 : 0,
                //   child: LikeAnimation(
                //     isAnimating: isLikeAnimating,
                //     duration: const Duration(
                //       milliseconds: 400,
                //     ),
                //     onEnd: () {
                //       setState(() {
                //         isLikeAnimating = false;
                //       });
                //     },
                //     child: const Icon(
                //       Icons.favorite,
                //       color: Colors.white,
                //       size: 100,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          // LIKE, COMMENT SECTION OF THE POST
          Row(
            children: <Widget>[
              // LikeAnimation(
              //   isAnimating: true,
              //   // post.isLiked || feedController.isLiked.value,
              //   smallLike: false,
              //   child: IconButton(
              //       icon:
              //           // widget.snap['likes'].contains(user.uid)
              //           post.isLiked || feedController.isLiked.value
              //               ? const Icon(
              //                   Icons.favorite,
              //                   color: Colors.red,
              //                 )
              //               : const Icon(
              //                   Icons.favorite_border,
              //                 ),
              //       onPressed: () => feedController.likePostById(post.id)),
              // ),
              LikeButton(
                onTap: feedController.likePostById,
                // size: buttonSize,
                circleColor: CircleColor(
                    start: Color(0xff00ddff), end: Color(0xff0099cc)),
                bubblesColor: BubblesColor(
                  dotPrimaryColor: Color(0xff33b5e5),
                  dotSecondaryColor: Color(0xff0099cc),
                ),
                likeBuilder: (bool isLiked) {
                  return Icon(
                    Icons.favorite,
                    color: post.isLiked ? Colors.deepPurpleAccent : Colors.grey,
                    // size: buttonSize,
                  );
                },
              ),
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
          ),
          //DESCRIPTION AND NUMBER OF COMMENTS
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                DefaultTextStyle(
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontWeight: FontWeight.w800),
                    child: Text(
                      '${post.likes.toString()} likes',
                      style: Theme.of(context).textTheme.bodyMedium,
                    )),
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
                          text: post.school.schoolName.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: ' ${post.caption}',
                        ),
                      ],
                    ),
                  ),
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
                Divider(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
