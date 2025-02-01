const {validateUser} = require('./userValidation.js');
Parse.Cloud.define("feed", async (request) => {

  var { skip, userId } = request.params;
  if (!skip) {
    skip = 0;
  }

  const User = Parse.User.extend();
  const Feed = new Parse.Query('Feed');
  Feed.include("post")
  Feed.include("post.school")
  Feed.descending("createdAt");
  Feed.skip(skip);
  Feed.limit(5);

  try {
    await validateUser(request);
    const allFeedPosts = await Feed.find({ useMasterKey: true });

    const userQuery = new Parse.Query(User);
    const user = await userQuery.get(userId, { useMasterKey: true });

    const results = await Promise.all(allFeedPosts.map(async (e) => {
      //get coments

      const PostObj = new Parse.Object("Posts");
      PostObj.id = e.get("post").id

      const likeQuery = new Parse.Query("Like");

      likeQuery.equalTo("post", PostObj);
      likeQuery.equalTo("user", user);
      likeQuery.include("user");
      const likes = await likeQuery.first({ useMasterKey: true });



      return {
        "id": e.get("post").id,
        'photoUrl': e.get('post').get('imageUrl'),
        'caption': e.get('post').get('caption'),
        'title': e.get('post').get('title'),
        'school': {
          id: e.get('post').get('school').id,
          schoolName: e.get('post').get('school').get("name"),
          city: e.get('post').get('school').get('city'),
          // profilePic: e.get('post').get('school')
          profilePic: e.get('post').get('school').get('logo')
        },
        isLiked: likes ? true : false,
        // 'comments': commentsResult,
        'likes': e.get('post').get('likes'),
        'createdAt': e.get('createdAt').toJSON(),
        'updatedAt': e.get('updatedAt').toJSON()
      }
    }));
    return {
      code: 200, status: true, message: '',
      posts: results
    };

  }
  catch (err) {
    // throw new Error(err);
    return {
      "code": 500,
      "message": err.toString(),
      "status": false,
      "posts": []
    };
  }
}
);