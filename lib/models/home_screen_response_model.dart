import 'all_quiz_response_model.dart';

class HomeScreenResponseModel {
  HomeScreenResponseModel({
    required this.code,
    required this.status,
    required this.quizzes,
    required this.mostPlayedQuiz,
       required this.topPicQuiz,
    required this.weekTopRank,
    required this.quizCategories,
    
  });

  final int? code;
  final bool? status;
  final List<Quiz>? quizzes;
  final Quiz? mostPlayedQuiz;
  final TopPicQuiz? topPicQuiz;
  final WeekTopRank? weekTopRank;
  final List<Category>? quizCategories;

  factory HomeScreenResponseModel.fromJson(Map<String, dynamic> json) {
    return HomeScreenResponseModel(
      code: json["code"],
      status: json["status"],
      quizzes: json["quizzes"] == null
          ? []
          : List<Quiz>.from(json["quizzes"]!.map((x) => Quiz.fromJson(x))),
      mostPlayedQuiz: json["most_played_quiz"] == null
          ? null
          : Quiz.fromJson(json["most_played_quiz"]),
          topPicQuiz: json["top_pic_quiz"] == null
          ? null
          : TopPicQuiz.fromJson(json["top_pic_quiz"]),
      weekTopRank: json["week_top_rank"] == null
          ? null
          : WeekTopRank.fromJson(json["week_top_rank"]),
      quizCategories: json["quiz_categories"] == null
          ? []
          : List<Category>.from(
              json["quiz_categories"]!.map((x) => Category.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "quizzes": quizzes?.map((x) => x.toJson()).toList(),
        "most_played_quiz": mostPlayedQuiz?.toJson(),
        "top_pic_quiz": topPicQuiz?.toJson(),
        "week_top_rank": weekTopRank?.toJson(),
        "quiz_categories": quizCategories?.map((x) => x.toJson()).toList(),
      };
}

class Category {
  Category({
    required this.id,
    required this.title,
    required this.createdAt,
    required this.updatedAt,
        required this.quizCount,
  });

  final String? id;
  final String? title;
  final DateTime? createdAt;
  final DateTime? updatedAt;
    final int? quizCount;

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json["_id"],
      title: json["title"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      quizCount: json["quizCount"],
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "quizCount": quizCount,
      };
}
class TopPicQuiz {
  TopPicQuiz({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String? id;
  final String? title;
  final String? description;
  final Category? category;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  factory TopPicQuiz.fromJson(Map<String, dynamic> json) {
    return TopPicQuiz(
      id: json["_id"],
      title: json["title"],
      description: json["description"],
      category:
          json["category"] == null ? null : Category.fromJson(json["category"]),
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "description": description,
        "category": category?.toJson(),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

class WeekTopRank {
  WeekTopRank({
    required this.quizWon,
    required this.id,
    required this.user,
    required this.points,
    required this.quizPlayed,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? quizWon;
  final String? id;
  final User? user;
  final int? points;
  final int? quizPlayed;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory WeekTopRank.fromJson(Map<String, dynamic> json) {
    return WeekTopRank(
      quizWon: json["quizWon"],
      id: json["_id"],
      user: json["user"] == null ? null : User.fromJson(json["user"]),
      points: json["points"],
      quizPlayed: json["quizPlayed"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "quizWon": quizWon,
        "_id": id,
        "user": user?.toJson(),
        "points": points,
        "quizPlayed": quizPlayed,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
class User {
  User({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.profilePic,
  });

  final String? id;
  final String? firstname;
  final String? lastname;
  final String? profilePic;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json["_id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        profilePic: json["profilePic"]);
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "firstname": firstname,
        "lastname": lastname,
        "profilePic": profilePic
      };
}
