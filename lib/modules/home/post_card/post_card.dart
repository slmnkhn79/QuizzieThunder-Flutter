import 'package:flutter/material.dart';
import 'package:quizzie_thunder/models/post_card_item_model.dart';

class PostCard 
{
Container getPostCardView(PostCardModel post, BuildContext context){
return  Container(
      // boundary needed for web
      decoration: BoxDecoration(
        border: Border.all(
          // color: width > webScreenSize ? secondaryColor : mobileBackgroundColor,
        ),
        // color: mobileBackgroundColor,
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
                    post.profImage.toString(),
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
                          post.user.username.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // widget.snap['uid'].toString() == user.uid
                1==1
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
          // GestureDetector(
          //   onDoubleTap: () {
              // FireStoreMethods().likePost(
              //   widget.snap['postId'].toString(),
              //   user.uid,
              //   widget.snap['likes'],
              // );
              // setState(() {
              //   isLikeAnimating = true;
              // });
          //   },
          //   child: Stack(
          //     alignment: Alignment.center,
          //     children: [
          //       SizedBox(
          //         height: MediaQuery.of(context).size.height * 0.35,
          //         width: double.infinity,
          //         child: Image.network(
          //           widget.snap['postUrl'].toString(),
          //           fit: BoxFit.cover,
          //         ),
          //       ),
          //       AnimatedOpacity(
          //         duration: const Duration(milliseconds: 200),
          //         opacity: isLikeAnimating ? 1 : 0,
          //         child: LikeAnimation(
          //           isAnimating: isLikeAnimating,
          //           duration: const Duration(
          //             milliseconds: 400,
          //           ),
          //           onEnd: () {
          //             setState(() {
          //               isLikeAnimating = false;
          //             });
          //           },
          //           child: const Icon(
          //             Icons.favorite,
          //             color: Colors.white,
          //             size: 100,
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // LIKE, COMMENT SECTION OF THE POST
          // Row(
          //   children: <Widget>[
          //     LikeAnimation(
          //       isAnimating: widget.snap['likes'].contains(user.uid),
          //       smallLike: true,
          //       child: IconButton(
          //         icon: widget.snap['likes'].contains(user.uid)
          //             ? const Icon(
          //                 Icons.favorite,
          //                 color: Colors.red,
          //               )
          //             : const Icon(
          //                 Icons.favorite_border,
          //               ),
          //         onPressed: () => FireStoreMethods().likePost(
          //           widget.snap['postId'].toString(),
          //           user.uid,
          //           widget.snap['likes'],
          //         ),
          //       ),
          //     ),
          //     IconButton(
          //       icon: const Icon(
          //         Icons.comment_outlined,
          //       ),
          //       onPressed: () => Navigator.of(context).push(
          //         MaterialPageRoute(
          //           builder: (context) => CommentsScreen(
          //             postId: widget.snap['postId'].toString(),
          //           ),
          //         ),
          //       ),
          //     ),
          //     IconButton(
          //         icon: const Icon(
          //           Icons.send,
          //         ),
          //         onPressed: () {}),
          //     Expanded(
          //         child: Align(
          //       alignment: Alignment.bottomRight,
          //       child: IconButton(
          //           icon: const Icon(Icons.bookmark_border), onPressed: () {}),
          //     ))
          //   ],
          // ),
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
                          text: post.user.username.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(                          text: ' ${post.caption}',
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