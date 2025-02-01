const { result, random } = require('lodash');
var lodash = require('lodash/lodash.js');
const crypto = require('crypto');
const { validateUser } = require('./userValidation');
const {getQuizDetails } = require('./getQuizDetail.js');
const {getPhotoQuiz } = require('./getQuizQuestion.js');
const {uploadImage, likeQuizPhoto, dislikeQuizPhoto } = require('./uploadImage.js');
const {getSubmission } = require('./quizSubmissions.js');
const {getCourseDetails } = require('./getCourseDetails.js');
const {getLearnings} = require('./getLearning.js');
const {createUserProgress, getUserProgress} = require('./userProgress.js');
require('./creationMethods.js');
require('./homeScreen.js');
require('./feedScreen.js');
require('./getSchoolDetails.js');
require('./getQuiz.js');
require('./leaderboards.js');
require('./submitQuizDetails.js');
require('./getQuizDetail.js');
require('./getQuizQuestion.js');


Parse.Cloud.define("getUserProgress", async (request) => {
    try{
      await validateUser(request);
      const result = await getUserProgress(request);
      return result;
  } catch (error) {
    // throw new Error("Error retrieving course details: " + error.message);
      return {
        code:500,
        status: false,
        "message":error.toString()
      }
  }
});


Parse.Cloud.define("createUserProgress", async (request) => {
    try{
      await validateUser(request);
      const result = await createUserProgress(request);
      return result;
  } catch (error) {
    // throw new Error("Error retrieving course details: " + error.message);
      return {
        code:500,
        status: false,
        "message":error.toString()
      }
  }
});


Parse.Cloud.define("getCourseDetails", async (request) => {
    try{
      const result = await getCourseDetails(request);
      return result;
  } catch (error) {
    // throw new Error("Error retrieving course details: " + error.message);
      return {
        code:500,
        status: false,
        "message":error.toString()
      }
  }
});










Parse.Cloud.define("discover", async (request) => {

  city = request.params.city;
  state = request.params.state;
  district = request.params.district;

  try {
    await validateUser(request);
    const School = new Parse.Query("Schools");
    if (city) {
      School.equalTo("city", city);
    }
    if (state) {
      School.equalTo("state", state);
    }
    if (district) {
      School.equalTo("district", district);
    }
    School.limit(100);

    const school = await School.find();
    schoolsList = school.map((school) => {
      return {
        _id: school.id,
        name: school.get('name'),
        city: school.get('city'),
        district: school.get('district'),
        state: school.get('state'),
        type: school.get('type'),
        description: school.get('description'),
        headerImageUrl: school.get('final_image'),
        numOfStudents: school.get('number_of_students'),
        facultyRatio: school.get('faculty_ratio'),
        cardImage: school.get('card_image_small') ?? "https://placehold.co/240x180.jpg"
      }
    });
    const TopSchool = new Parse.Query("Schools");

    if (city) {
      TopSchool.equalTo("city", city);
    }
    if (state) {
      TopSchool.equalTo("state", state);
    }
    if (district) {
      TopSchool.equalTo("district", district);
    }

    TopSchool.descending("createdAt");
    const topSchool = await TopSchool.first();
    topSchoolResult = {
      _id: topSchool.id,
      name: topSchool.get('name'),
      city: topSchool.get('city'),
      district: topSchool.get('district'),
      state: topSchool.get('state'),
      type: topSchool.get('type'),
      description: topSchool.get('description'),
      headerImageUrl: topSchool.get('final_image'),
      numOfStudents: topSchool.get('number_of_students'),
      facultyRatio: topSchool.get('faculty_ratio'),

    }

    return ({
      code: 200,
      status: true,
      message: "success",
      schools: schoolsList,
      topSchool: topSchoolResult

    });
    // console.log(weekTopRankJSON)
  }
  catch (err) {
    // throw new Error(err);
    return {
      "status": false, "code": 500, "topSchool": null, "schools": null
    }
  }

});


Parse.Cloud.define("profile", async (request) => {

  let userId = request.params._id;
  // let userId  = request.user.id;
  console.log(request.user);

  try {
    await validateUser(request);
    const User = new Parse.Query(Parse.User);
    User.include('standard');
    const parseUserDetail = await User.get(userId, { useMasterKey: true });

    const userDetail = {
      '_id': userId,
      'firstname': parseUserDetail.get('firstname'),
      'lastname': parseUserDetail.get('lastname'),
      'email': parseUserDetail.get('email') ?? 'dummy_email@gmail.com',
      'mobile': parseUserDetail.get('mobile') ?? '00-000-00000',
      'about': parseUserDetail.get('about') ?? "Please update your description",
      'role': parseUserDetail.get('role'),
      'isMobileNumberVerified': parseUserDetail.get('isMobileNumberVerified'),
      'isEmailVerified': parseUserDetail.get('isEmailVerified'),
      'isBlocked': parseUserDetail.get('isBlocked'),
      'createdAt': parseUserDetail.get('createdAt').toJSON(),
      'updatedAt': parseUserDetail.get('updatedAt').toJSON(),
      // 'v':parseUserDetail.get('v'),
      'profilePic': parseUserDetail.get('profilePic') ?? "https://academy-v1.s3.ap-northeast-1.amazonaws.com/avatars/profile_pic.jpg",
      'points': parseUserDetail.get('points') ?? 0,
      'standard': parseUserDetail.get('standard').get('standard_name') ?? 'Standard not set',
    }

    // console.log(userDetail)
    const CurrentUser = new Parse.Object("_User");
    CurrentUser.id = userId;

    const QuizResult = new Parse.Query("QuizResult");
    QuizResult.equalTo('user', CurrentUser);
    const stats = await QuizResult.first();
    // console.log(stats);
    const Quiz = new Parse.Query("Quiz");
    let rank = null;
    let successRate = 0;
    let averagePointsPerQuiz = 0;
    // const totalQuizzesAvailable = await Quiz.countDocuments();
    const totalQuizzesAvailable = await Quiz.count();
    let quizParticipationRate = 0;
    let statsResult = null;

    if (stats) {
      successRate = (stats.get('quizWon') / stats.get('quizPlayed')) * 100;
      averagePointsPerQuiz = stats.get('points') / stats.get('quizPlayed');
      quizParticipationRate = (stats.get('quizPlayed') / totalQuizzesAvailable) * 100;

      const userPoints = stats.get('points');

      const QuizResult_2 = new Parse.Query('QuizResult');
      QuizResult_2.greaterThan("points", userPoints);
      const higherRankUsers = await QuizResult_2.count();

      rank = higherRankUsers + 1;

      const quizWonRelation = stats.relation('quizWonList');
      const quizWonQuery = quizWonRelation.query();
      const quizWon = await quizWonQuery.find();


      statsResult = {
        'quiz_won': stats.get('quizWon'),
        '_id': stats.id ?? "randomId",
        'points': stats.get('points'),
        'total_quiz_played': stats.get('quizPlayed'),
        'rank': rank,
        'success_rate': successRate,
        'average_points_per_quiz': averagePointsPerQuiz,
        'quiz_participation_rate': quizParticipationRate,
        'createdAt': stats.get('createdAt').toJSON(),
        'updatedAt': stats.get('updatedAt').toJSON(),
        'quizWonList': quizWon.map((quiz) => {
          return {
            id: quiz.id,
            quizName: quiz.get('title'),
            quizDescription: quiz.get('description'),
            quizPrizeDetails: quiz.get('level'),
            level: quiz.get('level'),
            standard: quiz.get('standard'),
          }
        })
      };
    }

    return {
      code: 200, status: true, message: 'Profile details fetched successfully',
      user_detail: userDetail,
      // badge: {},
      stats: statsResult,
    };
  }
  catch (err) {
    // throw new Error(err);
    return {
      "code": 500,
      "message": "Something went wrong",
      "status": false,
      "user_detail": null,
      "stats": null,
      "other_attributes": null
    };

  }
});




Parse.Cloud.define('schooldiscover', async (request) => {

  try {
    await validateUser(request);

    //most liked post by school
    const PostFeed = new Parse.Query("Posts");
    PostFeed.descending("likes");
    PostFeed.include('school')

    const mostLikedPostBySchool = await PostFeed.first();
    const mostLikedResult = {
      'id': mostLikedPostBySchool.id,
      caption: mostLikedPostBySchool.get('caption'),
      title: mostLikedPostBySchool.get('title'),
      imageUrl: mostLikedPostBySchool.get('imageUrl'),
      'school': {
        id: mostLikedPostBySchool.get('school').id,
        schoolName: mostLikedPostBySchool.get('school').get("name"),
        city: mostLikedPostBySchool.get('school').get('city'),
        profilePic: ''
      },
      'createdAt': mostLikedPostBySchool.get('createdAt').toJSON(),
      'updatedAt': mostLikedPostBySchool.get('updatedAt').toJSON()
    }

    //recent activity by school
    const RecentPostFeed = new Parse.Query("Posts");
    RecentPostFeed.descending("createdAt");
    RecentPostFeed.include('school')
    RecentPostFeed.limit(10);
    const recentActivity = await RecentPostFeed.find();
    const recentActivityResults = recentActivity.map((e) => {
      return {
        'id': e.id,
        caption: e.get('caption'),
        title: e.get('title'),
        imageUrl: e.get('imageUrl'),
        'school': {
          id: e.get('school').id,
          schoolName: e.get('school').get("name"),
          city: e.get('school').get('city'),
          profilePic: ''
        },
        'createdAt': e.get('createdAt').toJSON(),
        'updatedAt': e.get('updatedAt').toJSON()
      }
    });
    return {
      "code": 200,
      "status": true,
      "message": "success",
      // "schoolLeaderboard": leaderboardResults,
      "mostLiked": mostLikedResult,
      "recentActivity": recentActivityResults
    };


  }
  catch (err) {
    // throw new Error(err);
    return {
      "code": 500,
      "status": false,
      "message": err.toString(),
      // "schoolLeaderboard": leaderboardResults,
      "mostLiked": {},
      "recentActivity": []
    };
  }
});

Parse.Cloud.define('searchInput', async (request) => {

  //most liked post by school

  const searchValue = request.params.searchValue;

  const Search = new Parse.Query("Search");
  Search.startsWith("value", searchValue);

  try {
    await validateUser(request);
    const search = await Search.find();

    const searchResult = search.map((e) => {
      return {
        'id': e.id,
        value: e.get('value'),
        displayValue: e.get('displayValue'),
        'createdAt': e.get('createdAt').toJSON(),
        'updatedAt': e.get('updatedAt').toJSON()
      }
    });
    return {
      "code": 200,
      "status": true,
      "message": "success",
      "searchResults": searchResult
    };


  }
  catch (err) {
    // throw new Error(err);
    return {
      "code": 500,
      "status": false,
      "message": err.toString(),
      "searchResults": []
    };
  }
});

Parse.Cloud.define('signup', async (request) => {
  const { username, password, email, firstname, lastname } = request.params;
  if (!username || !password || !email) {
    throw new Parse.Error(Parse.Error.INVALID_QUERY, "Username, password, and email are required.");
  }
  try {
    const user = new Parse.User();
    user.set("username", username);
    user.set("password", password);
    user.set("firstname", firstname);
    user.set("lastname", lastname);
    user.set("email", email);
    await user.signUp();
    console.log(user);


    const loginUser = new Parse.User();
    loginUser.set("username", username);
    // loginUser.set("password", password);
    loginUser.set("password", password);
    const loggedInUser = await loginUser.logIn();
    console.log(loggedInUser);
    const sessionToken = loggedInUser.getSessionToken();


    return {
      code: 200,
      status: true,
      message: "success",
      result: {
        token: sessionToken,
        firstname: loggedInUser.get("firstname") ?? "First",
        lastname: loggedInUser.get("lastname") ?? "Last",
        email: loggedInUser.get("email") ?? '',
        mobile: loggedInUser.get("mobile") ?? "",
        _id: loggedInUser.id,
        createdAt: loggedInUser.get("createdAt").toJSON(),
        updatedAt: loggedInUser.get("updatedAt").toJSON(),
      }
    };
  } catch (error) {
    // throw new Parse.Error(Parse.Error.OTHER_CAUSE, error.message);
    return {
      code: 500,
      status: false,
      message: error.toString(),
      result: {}
    };
  }
});

Parse.Cloud.define('login', async (request) => {
  const { username, password } = request.params;

  if (!username || !password) {
    throw new Parse.Error(Parse.Error.INVALID_QUERY, "Username and password are required.");
  }
  try {
    const user = new Parse.User();
    user.set("username", username);
    user.set("password", Buffer.from(password, 'base64').toString('utf-8'));
    const loggedInUser = await user.logIn();
    const sessionToken = loggedInUser.getSessionToken();
    return {
      code: 200,
      status: true,
      message: "success",
      result: {
        token: sessionToken,
        firstname: loggedInUser.get("firstname") ?? "First",
        lastname: loggedInUser.get("lastname") ?? "Last",
        email: loggedInUser.get("email") ?? '',
        mobile: loggedInUser.get("mobile") ?? "",
        _id: loggedInUser.id,
        about: loggedInUser.get('about') ?? "May be i need to be more interesting",
        profile_pic: loggedInUser.get("profilePic"),
        createdAt: loggedInUser.get("createdAt").toJSON(),
        updatedAt: loggedInUser.get("updatedAt").toJSON(),
      }
    };
  } catch (error) {
    // throw new Parse.Error(Parse.Error.OBJECT_NOT_FOUND, "Invalid username or password.");
    return {
      code: 500,
      status: false,
      message: error.toString(),
      result: {}
    };
  }
});













Parse.Cloud.define('eventByDates', async (request) => {
  const { schoolId, eventDate } = request.params;
  const date = new Date(eventDate);
  try {
    await validateUser(request);
    const School = new Parse.Object('Schools');
    School.id = schoolId;

    startDate = new Date(date.getFullYear(), date.getMonth(), 1);
    endDate = new Date(date.getFullYear(), date.getMonth() + 1, 0);
    const Events = new Parse.Query('EventsGallery');
    Events.greaterThanOrEqualTo('event_date', startDate);
    Events.lessThanOrEqualTo('event_date', endDate);
    Events.equalTo('school', School);
    const events = await Events.find();
    // console.log(events)


    return {
      code: 200,
      status: true,
      message: "",
      events: events.map((e) => {
        return {
          id: e.id,
          event_date: e.get('event_date').toJSON(),
          headerImageUrl: e.get('headerImageUrl'),
          createdAt: e.get('createdAt').toJSON(),
          updatedAt: e.get('updatedAt').toJSON()
        }
      })

    }

  } catch (error) {
    // throw new Parse.Error(Parse.Error.OBJECT_NOT_FOUND, error);
    return {
      code: 500,
      status: false,
      message: error.toString(),
      events: []
    }
  }
});

Parse.Cloud.define('eventById', async (request) => {
  const { eventId } = request.params;
  try {
    await validateUser(request);
    const Event = new Parse.Object("EventsGallery");
    Event.id = eventId;
    const EventsDetails = new Parse.Query('EventGalleryDetails');
    EventsDetails.equalTo('event', Event);
    EventsDetails.include('event')
    const allImages = await EventsDetails.find();
    console.log(allImages);


    return {
      code: 200,
      status: true,
      message: "",
      events_details: allImages.map((e) => {
        return {
          id: e.id,
          event_name: e.get("event").get('event_name') ?? "Generic Event name",
          image_url: e.get('image_url'),
          likes: e.get('likes'),
          createdAt: e.get('createdAt').toJSON(),
          updatedAt: e.get('updatedAt').toJSON()
        }
      })

    };

  } catch (error) {
    // throw new Parse.Error(Parse.Error.OBJECT_NOT_FOUND, error);
    return {
      code: 500,
      status: false,
      message: error.toString(),
      events_details: []
    };
  }
});


Parse.Cloud.define('postById', async (request) => {
  const { postId, userId } = request.params;
  try {
    await validateUser(request);
    const Post = new Parse.Query("Posts");
    Post.equalTo('objectId', postId)
    Post.include('school');
    Post.include('comments');
    const post = await Post.first({ useMasterKey: true });

    const User = Parse.User.extend();
    const userQuery = new Parse.Query(User);
    const user = await userQuery.get(userId, { useMasterKey: true });


    const likeQuery = new Parse.Query("Like");
    likeQuery.equalTo("post", post);
    likeQuery.equalTo("user", user);
    const likes = await likeQuery.first();

    // console.log(post);
    return {
      code: 200,
      status: true,
      message: "Succesful",
      "post": {
        id: post.id,
        title: post.get('title'),
        image_url: post.get('imageUrl'),
        caption: post.get('caption'),
        likes: post.get('likes'),
        school: {
          school_name: post.get('school').get('name'),
          logo: post.get('school').get('logo')
        },
        isLiked: likes ? true : false,
        createdAt: post.get('createdAt').toJSON(),
        updatedAt: post.get('updatedAt').toJSON()
      }
    };
  } catch (error) {
    // throw new Parse.Error(Parse.Error.OBJECT_NOT_FOUND, error);
    return {
      code: 500,
      status: false,
      message: error.toString(),
      "post": {}
    };
  }
});

Parse.Cloud.define('commentByPostId', async (request) => {
  const { postId, skip, limit } = request.params;
  try {
    await validateUser(request);
    const Comment = Parse.Object.extend("Comments");

    const Post = new Parse.Query("Posts");
    Post.equalTo('objectId', postId)
    const post = await Post.first();


    const commentQuery = new Parse.Query(Comment);
    commentQuery.equalTo("post", post);
    commentQuery.include('user')
    commentQuery.addDescending('createdAt');
    commentQuery.skip(parseInt(skip));
    commentQuery.limit(parseInt(limit));
    const comments = await commentQuery.find();

    return {
      code: 200,
      status: true,
      message: "Succesful",
      "comments": comments.map((comment) => {
        return {
          id: comment.id,
          content: comment.get("content"),
          user: comment.get('user').get('username'),
          profilePic: comment.get('user').get('profilePic'),
          createdAt: comment.get('createdAt').toJSON(),
          updatedAt: comment.get('updatedAt').toJSON()
        }
      }),
    }
  } catch (error) {
    // throw new Parse.Error(Parse.Error.OBJECT_NOT_FOUND, error);
    return {
      code: 500,
      status: false,
      message: error.toString(),
      "comments": []
    };
  }
});

Parse.Cloud.define("addCommentToPost", async (request) => {
  const { postId, content, userId } = request.params;

  if (!postId || !content || !userId) {
    throw new Parse.Error(Parse.Error.INVALID_PARAMS, "Missing parameters");
  }

  const Post = Parse.Object.extend("Posts");
  const Comment = Parse.Object.extend("Comments");
  const User = Parse.User.extend();

  try {
    await validateUser(request);
    // Fetch the post
    const postQuery = new Parse.Query(Post);
    const post = await postQuery.get(postId, { useMasterKey: true });

    // Fetch the user
    const userQuery = new Parse.Query(User);
    const user = await userQuery.get(userId, { useMasterKey: true });

    // Create a new comment
    const comment = new Comment();
    comment.set("content", content);
    comment.set("post", post);
    comment.set("user", user);

    // Save the comment
    await comment.save(null, { useMasterKey: true });

    const relation = post.relation("comments");
    relation.add(comment);

    // Optionally, increment comment count in Post (requires adding commentCount field to Post)
    if (post.has("commentCount")) {
      post.increment("commentCount");
    }
    await post.save(null, { useMasterKey: true });
    return {
      code: 200,
      status: true,
      message: "Comment added successfully!"
    };
  } catch (error) {
    // throw new Parse.Error(Parse.Error.OBJECT_NOT_FOUND, "Failed to add comment to post");
    return {
      code: 500,
      status: false,
      message: error.toString()
    };
  }
});

Parse.Cloud.define("likePostById", async (request) => {
  const { postId, userId } = request.params;

  if (!postId || !userId) {
    throw new Parse.Error(Parse.Error.INVALID_PARAMS, "Missing parameters");
  }

  const Post = Parse.Object.extend("Posts");
  const Like = Parse.Object.extend("Like");
  const User = Parse.User.extend();

  try {
    await validateUser(request);
    //check if user already do not have a like for the post
    const postQuery = new Parse.Query(Post);
    postQuery.include('school');
    const post = await postQuery.get(postId, { useMasterKey: true });

    const userQuery = new Parse.Query(User);
    const user = await userQuery.get(userId, { useMasterKey: true });

    const likeQuery = new Parse.Query(Like);
    likeQuery.equalTo('user', user);
    likeQuery.equalTo('post', post);

    const isLiked = await likeQuery.first();
    console.log(isLiked);
    if (isLiked) {
      // return {
      //   code: 300,
      //   status: true,
      //   message: "Already Liked",
      //   "user": user,
      //   "post": post
      // };
      return {
        code: 200,
        status: true,
        message: "Succesful",
        "post": {
          id: post.id,
          title: post.get('title'),
          image_url: post.get('imageUrl'),
          caption: post.get('caption'),
          likes: post.get('likes'),
          school: {
            school_name: post.get('school').get('name'),
            logo: post.get('school').get('logo')
          },
          isLiked: true,
          createdAt: post.get('createdAt').toJSON(),
          updatedAt: post.get('updatedAt').toJSON()
        }
      };
    }
    else {

      // Create a new comment
      const like = new Like();
      like.set("user", user);
      like.set("post", post);

      // Save the comment
      await like.save(null, { useMasterKey: true });



      // Optionally, increment comment count in Post (requires adding commentCount field to Post)
      if (post.has("likes")) {
        post.increment("likes");
      }
      await post.save(null, { useMasterKey: true });
      return {
        code: 200,
        status: true,
        message: "Succesful",
        "post": {
          id: post.id,
          title: post.get('title'),
          image_url: post.get('imageUrl'),
          caption: post.get('caption'),
          likes: post.get('likes'),
          school: {
            school_name: post.get('school').get('name'),
            logo: post.get('school').get('logo')
          },
          isLiked: true,
          createdAt: post.get('createdAt').toJSON(),
          updatedAt: post.get('updatedAt').toJSON()
        }
      };
    }
  } catch (error) {
    // throw new Parse.Error(Parse.Error.OBJECT_NOT_FOUND, "Failed to add like to post");
    return {
      code: 500,
      status: false,
      message: error.toString(),
      post: {}
    };
  }
});


Parse.Cloud.define("dislikePostById", async (request) => {
  const { postId, userId } = request.params;

  if (!postId || !userId) {
    throw new Parse.Error(Parse.Error.INVALID_PARAMS, "Missing parameters");
  }

  const Post = Parse.Object.extend("Posts");
  const Like = Parse.Object.extend("Like");
  const User = Parse.User.extend();

  try {
    await validateUser(request);
    //check if user already do not have a like for the post
    const postQuery = new Parse.Query(Post);
    postQuery.include('school');
    const post = await postQuery.get(postId, { useMasterKey: true });

    const userQuery = new Parse.Query(User);
    const user = await userQuery.get(userId, { useMasterKey: true });

    const likeQuery = new Parse.Query(Like);
    likeQuery.equalTo('user', user);
    likeQuery.equalTo('post', post);

    const isLiked = await likeQuery.first();



    if (isLiked) {
      await isLiked.destroy({ useMasterKey: true });
      if (post.has("likes")) {
        post.decrement("likes");
      }
      await post.save(null, { useMasterKey: true });
      return {
        code: 200,
        status: true,
        message: "Succesful",
        "post": {
          id: post.id,
          title: post.get('title'),
          image_url: post.get('imageUrl'),
          caption: post.get('caption'),
          likes: post.get('likes'),
          school: {
            school_name: post.get('school').get('name'),
            logo: post.get('school').get('logo')
          },
          isLiked: false,
          createdAt: post.get('createdAt').toJSON(),
          updatedAt: post.get('updatedAt').toJSON()
        }
      };
    }
    else {
      return {
        code: 400,
        status: false,
        message: "Some error occurred, Like not found"
      }

    }

  } catch (error) {
    // throw new Parse.Error(Parse.Error.OBJECT_NOT_FOUND, "Failed to add like to post");
    return {
      code: 500,
      status: false,
      message: error.toString(),
      post: {}
    };
  }
});

Parse.Cloud.define("learnings", async (request) => {

  try {
    await validateUser(request);
    const result = await getLearnings(request);
    return result;

  }
  catch (err) {
    return {
      status: false,
      code: 500,
      message: err.toString(),
      data: {}
    };
  }

});

Parse.Cloud.define("learningpaths", async (request) => {
  const { searchTermId } = request.params;
  const LearningPaths = new Parse.Object("LearningPaths");
  const Search = new Parse.Object("Search");

  try {
    await validateUser(request);
    const learningQuery = new Parse.Query(LearningPaths);
    if (searchTermId) {
      Search.id = searchTermId
      learningQuery.equalTo('search', Search);
    }
    const learningPaths = await learningQuery.find();
    return {
      status: true,
      code: 200,
      message: "",
      paths: learningPaths.map((path) => {
        return {
          id: path.id,
          pathName: path.get('path_name'),
          description: path.get('description'),
          // content: path.get('content')

        }
      })

    }

  } catch (err) {
    // throw new Parse.Error(Parse.Error.OBJECT_NOT_FOUND, err.toString());
    return {
      status: false,
      code: 500,
      message: err.toString(),
      paths: []
    }
  }
});

Parse.Cloud.define("learningPathById", async (request) => {

  const { learningPathById } = request.params;

  const LearningPaths = new Parse.Object("LearningPaths");
  try {
    await validateUser(request);
    const learningQuery = new Parse.Query(LearningPaths);
    const learningPath = await learningQuery.get(learningPathById);
    return {
      status: true,
      code: 200,
      message: "",
      paths: {
        id: learningPath.id,
        pathName: learningPath.get('path_name'),
        description: learningPath.get('description'),
        content: learningPath.get('content')
      }

    }

  } catch (err) {
    // throw new Parse.Error(Parse.Error.OBJECT_NOT_FOUND, err.toString());
    return {
      status: false,
      code: 500,
      message: err.toString(),
      paths: {}
    }
  }
});

Parse.Cloud.define("studyplans", async (request) => {
  const StudyPlans = new Parse.Object("StudyPlan");
  try {
    await validateUser(request);
    const studyPlanQuery = new Parse.Query(StudyPlans);
    studyPlanQuery.include('standard');
    const studyPlans = await studyPlanQuery.find();
    return {
      status: true,
      code: 200,
      message: "",
      plans: studyPlans.map((plan) => {
        return {
          id: plan.id,
          planName: plan.get('plan_name'),
          planDescription: plan.get('plan_description'),
          createdAt: plan.get('createdAt').toJSON(),
          updatedAt: plan.get('updatedAt').toJSON(),
          pdfLink: plan.get('pdf_link'),
          planAttributes: plan.get('plan_attributes'),
          standard:
          {
            id: plan.get('standard').id,
            standardName: plan.get('standard').get('standard_name'),
            standardcode: plan.get('standard').get('standard_code'),
          }
        }
      })

    }

  } catch (err) {
    // throw new Parse.Error(Parse.Error.OBJECT_NOT_FOUND, err.toString());
    return {
      status: false,
      code: 500,
      message: err.toString(),
      plans: []
    }
  }
});

Parse.Cloud.define("studyPlanById", async (request) => {
  const { studyPlanId } = request.params;
  const StudyPlans = new Parse.Object("StudyPlan");

  try {
    await validateUser(request);
    const studyPlanQuery = new Parse.Query(StudyPlans);
    studyPlanQuery.include('standard');
    const plan = await studyPlanQuery.get(studyPlanId);
    return {
      status: true,
      code: 200,
      message: "",
      plan: {
        id: plan.id,
        planName: plan.get('plan_name'),
        planDescription: plan.get('plan_description'),
        createdAt: plan.get('createdAt').toJSON(),
        updatedAt: plan.get('updatedAt').toJSON(),
        pdfLink: plan.get('pdf_link'),
        planAttributes: plan.get('plan_attributes'),
        standard:
        {
          id: plan.get('standard').id,
          standardName: plan.get('standard').get('standard_name'),
          standardcode: plan.get('standard').get('standard_code'),
        }

      }
    }

  } catch (err) {
    // throw new Parse.Error(Parse.Error.OBJECT_NOT_FOUND, err.toString());
    return {
      status: false,
      code: 500,
      message: err.toString(),
      plan: {}
    }
  }
});

Parse.Cloud.define("allVideos", async (request) => {
  const MentorVideos = new Parse.Object("MentorVideos");
  try {
    await validateUser(request);
    const videosQuery = new Parse.Query(MentorVideos);
    const videos = await videosQuery.find();
    return {
      status: true,
      code: 200,
      message: "",
      videos: videos.map((video) => {
        return {
          id: video.id,
          thumbnail: video.get('thumbnail'),
          duration: video.get('duration'),
          videoLink: video.get('video_link'),
          createdAt: video.get('createdAt').toJSON(),
          updatedAt: video.get('updatedAt').toJSON(),
          title: video.get('title'),
          videoType: video.get('video_type'),
        }
      })

    }

  } catch (err) {
    // throw new Parse.Error(Parse.Error.OBJECT_NOT_FOUND, err.toString());
    return {
      status: false,
      code: 500,
      message: err.toString(),
      videos: []
    };
  }
});

Parse.Cloud.define("videoById", async (request) => {
  const { videoId } = request.params;
  const MentorVideos = new Parse.Object("MentorVideos");
  try {
    await validateUser(request);
    const videosQuery = new Parse.Query(MentorVideos);
    const video = await videosQuery.get(videoId);
    return {
      status: true,
      code: 200,
      message: "",
      video: {
        id: video.id,
        thumbnail: video.get('thumbnail'),
        duration: video.get('duration'),
        videoLink: video.get('video_link'),
        createdAt: video.get('createdAt').toJSON(),
        updatedAt: video.get('updatedAt').toJSON(),
        title: video.get('title'),
        videoType: video.get('video_type'),
      }

    }

  } catch (err) {
    // throw new Parse.Error(Parse.Error.OBJECT_NOT_FOUND, err.toString());
    return {
      status: false,
      code: 500,
      message: err.toString(),
      video: {}
    }
  }
});

Parse.Cloud.define("allBooks", async (request) => {
  const Books = new Parse.Object("Books");
  try {
    await validateUser(request);
    const booksQuery = new Parse.Query(Books);
    const books = await booksQuery.find();
    return {
      status: true,
      code: 200,
      message: "",
      books: books.map((book) => {
        return {
          id: book.id,
          updatedAt: book.get('updatedAt').toJSON(),
          createdAt: book.get('createdAt').toJSON(),
          bookName: book.get('book_name'),
          bookAuthor: book.get('book_author'),
          bookPublisher: book.get('book_publisher'),
          bookDate: book.get('book_date'),
          bookPdfLink: book.get('book_pdf_link'),
          searchKeywords: book.get('searchKeywords'),
          bookType: book.get('book_type'),
          bookCategory: book.get('book_category'),
        }
      })

    }

  } catch (err) {
    // throw new Parse.Error(Parse.Error.OBJECT_NOT_FOUND, err.toString());
    return {
      status: false,
      code: 500,
      message: err.toString(),
      books: []
    }
  }
});

Parse.Cloud.define("bookById", async (request) => {
  const { bookId } = request.params;
  const Books = new Parse.Object("Books");
  try {
    await validateUser(request);
    const booksQuery = new Parse.Query(Books);
    const book = await booksQuery.get(bookId);
    return {
      status: true,
      code: 200,
      message: "",
      book: {
        id: book.id,
        updatedAt: book.get('updatedAt').toJSON(),
        createdAt: book.get('createdAt').toJSON(),
        bookName: book.get('book_name'),
        bookAuthor: book.get('book_author'),
        bookPublisher: book.get('book_publisher'),
        bookDate: book.get('book_date'),
        bookPdfLink: book.get('book_pdf_link'),
        searchKeywords: book.get('searchKeywords'),
        bookType: book.get('book_type'),
        bookCategory: book.get('book_category'),
      }

    }

  } catch (err) {
    // throw new Parse.Error(Parse.Error.OBJECT_NOT_FOUND, err.toString());
    return {
      status: false,
      code: 500,
      message: err.toString(),
      book: {}
    }
  }
});

// Future<void> changePassword(String oldPassword, String newPassword) async
Parse.Cloud.define("changePassword", async (request) => {
  const user = request.user;
  const { oldPassword, newPassword, confirmPassword } = request.params;

  if (!user) {
    throw new Parse.Error(Parse.Error.SESSION_MISSING, "User must be logged in.");
  }

  // Validate old password by performing logging in operation
  try {
    await validateUser(request);
    console.log('username:-', request.user);
    console.log('username:-', request.user.getUsername());
    const user1 = new Parse.User();
    user1.set("username", user.getUsername());
    user1.set("password", oldPassword);
    const loggedInUser = await user1.logIn();
    if (!loggedInUser) {
      return res.json({ code: 404, status: false, message: 'Incorrect password!' });
    }

    // await user.logIn(user.getUsername(), oldPassword);
    console.log("oldPassword:-", oldPassword);
    console.log("confirmPassword:-", confirmPassword);
    console.log("newPassword:-", newPassword);
    // Set new password
    loggedInUser.setPassword(newPassword);
    const updatedUser = await loggedInUser.save(null, { useMasterKey: true });
    if (updatedUser) {
      return {
        code: 200,
        status: true,
        message: "Password changed successfully."
      }
    }
    else {
      return { code: 404, status: false, message: 'Failed to update password' }
    }
  } catch (error) {
    // throw new Parse.Error(Parse.Error.OBJECT_NOT_FOUND, error.toString());
    return { code: 500, status: false, message: error.toString() }
  }
});

Parse.Cloud.define("getAllAvatars", async (request) => {

  // Validate old password by performing logging in operation
  const Avatars = new Parse.Object("Avatars");
  try {
    await validateUser(request);
    const avatarQuery = new Parse.Query(Avatars);
    const avatars = await avatarQuery.find();
    if (avatars) {
      return {
        code: 200, status: true, message: '', avatars: avatars.map((avatar) => {
          return {
            _id: avatar.id,
            'url': avatar.get('url'),
            updatedAt: avatar.get('updatedAt').toJSON(),
            createdAt: avatar.get('createdAt').toJSON(),
          }
        })
      }
    }
    return { code: 404, status: false, message: 'No avatar found' }
  } catch (error) {

    // throw new Parse.Error(Parse.Error.OBJECT_NOT_FOUND, error.toString());
    return {
      code: 500, status: false, message: error.toString(), avatars: []
    };
  }
});

Parse.Cloud.define("updateProfile", async (request) => {

  const { about, profile_pic } = request.params;
  // throw new Parse.Error(Parse.Error.OBJECT_NOT_FOUND, "error");
  const user = request.user;
  // Validate old password by performing logging in operation
  var savedUser = null;
  try {
    await validateUser(request);
    if (!user)
      return { code: 400, status: false, message: "No user available" }
    if (about && about.trim().length > 0) {
      user.set('about', about.trim());
      savedUser = await user.save(null, { useMasterKey: true });
    }
    else {
      return { code: 200, status: true, message: "No change" };
    }

    if (savedUser) {
      return { code: 200, status: true, message: "Data saved succesfully" };
    }
    else {
      return { code: 400, status: false, message: "Some error occured" };
    }

  } catch (error) {

    // throw new Parse.Error(Parse.Error.OBJECT_NOT_FOUND, error.toString());
    return { code: 500, status: false, message: error.toString() };
  }
});

Parse.Cloud.define("requestPasswordReset", async (request) => {
  const email = request.params.email;

  if (!email) {
    throw new Parse.Error(Parse.Error.INVALID_EMAIL_ADDRESS, "No email address provided.");
  }
  const User = new Parse.User

  try {
    const User = new Parse.User();
    const userQuery = new Parse.Query(User);
    userQuery.equalTo('email', email);
    const user = await userQuery.first({ useMasterKey: true });
    if (user) {
      var result = await Parse.User.requestPasswordReset(email);
      if (result) {
        return { code: 200, status: true, message: "Password reset request was sent successfully. Please check your email!" };
      }

    }
    else {
      return { code: 400, status: false, message: "Email does not exists" };
    }

  } catch (error) {
    // throw new Parse.Error(error.code, error.message);
    return { code: 400, status: false, message: error.toString() };
  }
});

Parse.Cloud.define('publicProfile', async (request) => {
  const userId = request.params.userId;


  try {
    await validateUser(request);
    const User = new Parse.Query(Parse.User);
    User.include('standard');
    User.include('school');
    User.include('demographics');
    const parseUserDetail = await User.get(userId, { useMasterKey: true });

    const userDetail = {
      '_id': userId,
      'firstname': parseUserDetail.get('firstname'),
      'lastname': parseUserDetail.get('lastname'),
      'email': parseUserDetail.get('email') ?? 'dummy_email@gmail.com',
      'mobile': parseUserDetail.get('mobile') ?? '00-000-00000',
      'about': parseUserDetail.get('about') ?? "Please update your description",
      'role': parseUserDetail.get('role'),
      'isMobileNumberVerified': parseUserDetail.get('isMobileNumberVerified'),
      'isEmailVerified': parseUserDetail.get('isEmailVerified'),
      'isBlocked': parseUserDetail.get('isBlocked'),
      'createdAt': parseUserDetail.get('createdAt').toJSON(),
      'updatedAt': parseUserDetail.get('updatedAt').toJSON(),
      // 'v':parseUserDetail.get('v'),
      'profilePic': parseUserDetail.get('profilePic') ?? "https://academy-v1.s3.ap-northeast-1.amazonaws.com/avatars/profile_pic.jpg",
      'points': parseUserDetail.get('points') ?? 0,
      'standard': parseUserDetail.get('standard').get('standard_name') ?? 'Standard not set',
      'headerImage': parseUserDetail.get('header_image'),
      'school': {
        id: parseUserDetail.get('school').id,
        schoolName: parseUserDetail.get('school').get("name"),
        city: parseUserDetail.get('school').get('city'),
        state: parseUserDetail.get('school').get('state'),
        type: parseUserDetail.get('school').get('type'),
        logo: parseUserDetail.get('school').get('logo'),
      },
      description: parseUserDetail.get('about') ?? "Description not set",
      city: parseUserDetail.get('demographics').get('city') ?? "City/State not set",
      state: parseUserDetail.get('demographics').get('state') ?? "",
      rank: parseUserDetail.get('rank')

    }

    // console.log(userDetail)
    const CurrentUser = new Parse.Object("_User");
    CurrentUser.id = userId;

    const QuizResult = new Parse.Query("QuizResult");
    QuizResult.equalTo('user', CurrentUser);
    const stats = await QuizResult.first();
    // console.log(stats);
    const Quiz = new Parse.Query("Quiz");
    let rank = null;
    let successRate = 0;
    let averagePointsPerQuiz = 0;
    // const totalQuizzesAvailable = await Quiz.countDocuments();
    const totalQuizzesAvailable = await Quiz.count();
    let quizParticipationRate = 0;
    let statsResult = null;

    if (stats) {
      successRate = (stats.get('quizWon') / stats.get('quizPlayed')) * 100;
      averagePointsPerQuiz = stats.get('points') / stats.get('quizPlayed');
      quizParticipationRate = (stats.get('quizPlayed') / totalQuizzesAvailable) * 100;

      const userPoints = stats.get('points');

      const QuizResult_2 = new Parse.Query('QuizResult');
      QuizResult_2.greaterThan("points", userPoints);
      const higherRankUsers = await QuizResult_2.count();

      rank = higherRankUsers + 1;

      const quizWonRelation = stats.relation('quizWonList');
      const quizWonQuery = quizWonRelation.query();
      const quizWon = await quizWonQuery.find();


      statsResult = {
        'quiz_won': stats.get('quizWon'),
        '_id': stats.id ?? "randomId",
        'points': stats.get('points'),
        'total_quiz_played': stats.get('quizPlayed'),
        'rank': rank,
        'success_rate': successRate,
        'average_points_per_quiz': averagePointsPerQuiz,
        'quiz_participation_rate': quizParticipationRate,
        'createdAt': stats.get('createdAt').toJSON(),
        'updatedAt': stats.get('updatedAt').toJSON(),
        'quizWonList': quizWon.map((quiz) => {
          return {
            id: quiz.id,
            quizName: quiz.get('title'),
            quizDescription: quiz.get('description'),
            quizPrizeDetails: quiz.get('level'),
            level: quiz.get('level'),
            standard: quiz.get('standard'),
          }
        })
      };
    }

    const StudentAttributes = new Parse.Query("StudentAttributes");
    StudentAttributes.equalTo('user', CurrentUser);
    const studentAttributes = await StudentAttributes.first();
    const studentAttributesResult = {
      'id': studentAttributes.id,
      'performance': studentAttributes.get('performance'),
      'keyInterest': studentAttributes.get('key_interests'),
      'keySkills': studentAttributes.get('key_skills'),
      'scores': studentAttributes.get('scores'),
      'createdAt': studentAttributes.get('createdAt').toJSON(),
      'updatedAt': studentAttributes.get('updatedAt').toJSON(),
    }

    return {
      code: 200, status: true, message: 'Profile details fetched successfully',
      user_detail: userDetail,
      // badge: {},
      stats: statsResult,
      otherAttributes: studentAttributesResult
    };
  } catch (error) {
    // throw new Parse.Error(Parse.Error.OBJECT_NOT_FOUND, error);
    return { code: 500, status: false, message: error.toString(), stats: null, otherAttributes: null };
  }

});



Parse.Cloud.define("allCourses", async (request) => {
  const Courses = new Parse.Object("CoursePDF");
  try {
    await validateUser(request);
    const courseQuery = new Parse.Query(Courses);
    courseQuery.include('standard');
    const courses = await courseQuery.find();
    return {
      status: true,
      code: 200,
      message: "",
      courses: courses.map((course) => {
        return {
          id: course.id,
          updatedAt: course.get('updatedAt').toJSON(),
          createdAt: course.get('createdAt').toJSON(),
          topic_name: course.get('topic_name'),
          pdf_url: course.get('pdf_url'),
          standard: {
            id: course.get('standard').id,
            standard_name: course.get('standard').get('standard_name'),
            standard_code: course.get('standard').get('standard_code'),

          },
          course_type: course.get('type'),
        }
      })

    }

  } catch (err) {
    // throw new Parse.Error(Parse.Error.OBJECT_NOT_FOUND, err.toString());
    return {
      status: false,
      code: 500,
      message: err.toString(),
      courses: []
    }
  }
});

Parse.Cloud.define("courseById", async (request) => {
  const { courseId } = request.params;
  const Courses = new Parse.Object("CoursePDF");
  try {
    await validateUser(request);
    const courseQuery = new Parse.Query(Courses);
    courseQuery.include('standard');
    const course = await courseQuery.get(courseId);
    return {
      status: true,
      code: 200,
      message: "",
      course:
      {
        id: course.id,
        updatedAt: course.get('updatedAt').toJSON(),
        createdAt: course.get('createdAt').toJSON(),
        topic_name: course.get('topic_name'),
        pdf_url: course.get('pdf_url'),
        standard: {
          id: course.get('standard').id,
          standard_name: course.get('standard').get('standard_name'),
          standard_code: course.get('standard').get('standard_code'),

        },
        course_type: course.get('type'),
      }
    }

  } catch (err) {
    // throw new Parse.Error(Parse.Error.OBJECT_NOT_FOUND, err.toString());
    return {
      status: false,
      code: 500,
      message: err.toString(),
      course: {}
    }
  }
});
Parse.Cloud.define("getSearchTerms", async (request) => {
  const { searchParam } = request.params;
  const Search = new Parse.Object("Search");
  try {
    // await validateUser(request);
    const searchQuery = new Parse.Query(Search);
    searchQuery.ascending('search_rank');
    searchQuery.limit(20);
    if (searchParam) {
      searchQuery.contains('search_terms', searchParam)
    }
    const search = await searchQuery.find();
    return {
      status: true,
      code: 200,
      message: "",
      searchValues: search.map((s) => {
        return {
          id: s.id,
          updatedAt: s.get('updatedAt').toJSON(),
          createdAt: s.get('createdAt').toJSON(),
          search_name: s.get("search_name"),
          search_rank: s.get("search_rank"),
        }
      })
    }

  } catch (err) {
    // throw new Parse.Error(Parse.Error.OBJECT_NOT_FOUND, err.toString());
    return {
      status: false,
      code: 500,
      message: err.toString(),
      searchValues: []
    };

  }
});


Parse.Cloud.define("signUpData", async (request) => {
  try {
    const {
      firstname,
      lastname,
      email,
      dob,
      username,
      password,
      confirmPassword,
      age,
      gender,
      interest,
      other_interests,
      skill,
      other_skills,
      summary,
      school, demographics, standard

    } = request.params;
    if (!username) {
      return ({ code: 400, status: false, message: 'Username is required.' });
    }

    const query = new Parse.Query(Parse.User);
    query.equalTo('username', username);
    const user = await query.first({ useMasterKey: true });
    if (user) {
      return ({ code: 400, status: false, message: 'Username already taken.' });
    }

    if (password != confirmPassword) {
      return ({ code: 400, status: false, message: 'Password and confirm password not matching.' });
    }

    if (!firstname || !lastname || !email || !dob || !username || !password || !confirmPassword || !age || !gender || !interest || !skill || !summary) {
      return ({ code: 400, status: false, message: 'Please fill in all details!' });
    }
    if (password.length < 8) {
      return ({ code: 400, status: false, message: 'Password length less than 8!' });
    }
    else {
      const user = new Parse.User();
      user.set("username", username);
      user.set("email", email);
      user.set("password", password);
      user.set("firstname", firstname);
      user.set("lastname", lastname);
      user.set("email", email);
      user.set("dob", dob);
      user.set("username", username);
      user.set("age", age);
      user.set("gender", gender);
      user.set("interest", other_interests);
      user.set("skill", other_skills);
      user.set("about", summary);
      const School = new Parse.Object('Schools');
      School.id = school;
      user.set('school', School);
      const Demographics = new Parse.Object('Demographics');
      Demographics.id = demographics;
      user.set('demographics', Demographics);
      const Standard = new Parse.Object('Standard');
      Standard.id = standard;
      user.set('standard', Standard);
      user.set('profilePic', 'https://academy-v1.s3.ap-northeast-1.amazonaws.com/avatars/men_3.jpg');
      user.set('header_image', 'https://academy-v1.s3.ap-northeast-1.amazonaws.com/student_header_image/header_gif.gif');


      var newUser = await user.signUp();
      if (newUser) {
        //save acl

        const acl = new Parse.ACL();
        acl.setPublicReadAccess(true);
        acl.setWriteAccess(newUser.id, true);
        newUser.setACL(acl);
        await newUser.save(null, { useMasterKey: true });

        //save interest and skills
        const keySkills = skill.map((sk) => {
          return {

            "skill": sk,
            "score": 0
          }
        });

        const keyInterests = interest.map((intr) => {
          return {

            "interest": intr,
            "quiz_won": 0

          }
        });

        const StudentAttributes = new Parse.Object("StudentAttributes");
        StudentAttributes.set('user', newUser);
        StudentAttributes.set('key_skills', keySkills);
        StudentAttributes.set('key_interests', keyInterests);

        const AttrACL = new Parse.ACL();
        AttrACL.setPublicReadAccess(true);
        AttrACL.setPublicWriteAccess(false);
        StudentAttributes.setACL(AttrACL);
        await StudentAttributes.save(null, { useMasterKey: true });

        return {
          code: 200,
          status: true,
          message: "succesfull"
        }
      }
      else {
        return {
          code: 400,
          status: false,
          message: "Some error occurred!"
        }
      }
    }

  }
  catch (e) {
    return { code: 500, status: false, "message": e.toString() }
  }
});

Parse.Cloud.define("getPhotoQuizDetails", async (request) => {
  try{
    await validateUser(request);
    const result = await getPhotoQuiz(request);
    return result;
  }
  catch(error){
    return 
  }
});
Parse.Cloud.define("uploadImage", async (request) => {
  try{

    const result = await uploadImage(request);
    return result;
  }
  catch(error){
      return  {
        code: 400,
        status: false,
        message: error.toString()
      }
  }
});
Parse.Cloud.define("quizSubmissionById", async (request) => {
  try{
    await validateUser(request);
    const result = await getSubmission(request);
    return result;
  }
  catch(error){
      return  {
        code: 400,
        status: false,
        message: error.toString()
      }
  }
});

Parse.Cloud.define("likeQuizPhotoById", async (request) => {
  try{
    await validateUser(request);
    const result = await likeQuizPhoto(request);
    return result;
  }
  catch(error){
      return  {
        code: 400,
        status: false,
        message: error.toString()
      }
  }
});
Parse.Cloud.define("dislikeQuizPhotoById", async (request) => {
  try{
    await validateUser(request);
    const result = await dislikeQuizPhoto(request);
    return result;
  }
  catch(error){
      return  {
        code: 400,
        status: false,
        message: error.toString()
      }
  }
});