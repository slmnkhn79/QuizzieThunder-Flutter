import 'package:flutter/material.dart';
import 'package:quizzie_thunder/models/school_discover_screen_response_model.dart';
import 'package:quizzie_thunder/modules/discover/school_discover_controller.dart';
import 'package:quizzie_thunder/modules/home/post_card/like_animation.dart';
import 'package:quizzie_thunder/theme/colors_theme.dart';

class EventCard extends StatelessWidget {
  final Event post;
  final DiscoverController schoolDiscoverController ;

  const EventCard({super.key, required this.post, required this.schoolDiscoverController});

  @override
  Widget build(BuildContext context) {
    return getPostCardView(post, context);
  }

  Container getPostCardView(Event post, BuildContext context) {
    // final width = MediaQuery.of(context).size.width;
    return Container(
      // boundary needed for web
      decoration: BoxDecoration(
      //   border: Border.all(
      //       // color: width > webScreenSize ? secondaryColor : mobileBackgroundColor,
      //       ),
      //   borderRadius: BorderRadius.all(Radius.circular(8.0)),
        color: ThemeColor.facebook_light_4,
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
                          post.school!.schoolName.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
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
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: double.infinity,
                  child: Image.network(
                    post.imageUrl.toString(),
                    fit: BoxFit.cover,
                  ),
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
              LikeAnimation(
                isAnimating: 1 == 1,
                smallLike: true,
                child: IconButton(
                    icon:
                        // widget.snap['likes'].contains(user.uid)
                        1 == 1
                            ? const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                            : const Icon(
                                Icons.favorite_border,
                              ),
                    onPressed: () => {}
                    // FireStoreMethods().likePost(
                    //   widget.snap['postId'].toString(),
                    //   user.uid,
                    //   widget.snap['likes'],
                    // ),
                    ),
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
                      // '${post.likes.toString()} likes',
                      '10',
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
                          text: post.school!.schoolName.toString(),
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
                    post.createdAt.toString(),

                    // style: const TextStyle(
                    //   color: secondaryColor,
                    // ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
  
}
