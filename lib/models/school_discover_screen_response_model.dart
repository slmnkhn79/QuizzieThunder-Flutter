//top liked event of nearby school or filtered schools
//upcoming events of nearby school or filtered schools
//recent activity by schools top 10 activites  or filtered schools

class SchoolDiscoverScreenResponseModel {
  SchoolDiscoverScreenResponseModel({
    required this.code,
    required this.status,
    required this.message,
    required this.mostLiked,
    required this.recentActivity,
    // required this.quizCategories,
  });

  final int? code;
  final bool? status;
  final String? message;
  final Event? mostLiked;
  // final WeekTopRank? weekTopRank;
  final List<Event>? recentActivity;

  factory SchoolDiscoverScreenResponseModel.fromJson(
      Map<String, dynamic> json) {
    return SchoolDiscoverScreenResponseModel(
      code: json["code"],
      status: json["status"],
      message: json["message"],
      mostLiked: Event.fromJson(json["mostLiked"]) ,
      // weekTopRank: json["week_top_rank"] == null
      //     ? null
      //     : WeekTopRank.fromJson(json["week_top_rank"]),
      recentActivity: json["recentActivity"] == null
          ? []
          : List<Event>.from(
              json["recentActivity"]!.map((x) => Event.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "mostLiked": mostLiked?.toJson(),
        // "week_top_rank": weekTopRank?.toJson(),
        // "quiz_categories": quizCategories?.map((x) => x.toJson()).toList(),
      };
}

// class Category {
//   Category({
//     required this.id,
//     required this.title,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.quizCount,
//     required this.v,
//   });

//   final String? id;
//   final String? title;
//   final DateTime? createdAt;
//   final DateTime? updatedAt;
//   final int? quizCount;
//   final int? v;

//   factory Category.fromJson(Map<String, dynamic> json) {
//     return Category(
//       id: json["_id"],
//       title: json["title"],
//       createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
//       updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
//       quizCount: json["quizCount"],
//       v: json["__v"],
//     );
//   }

//   Map<String, dynamic> toJson() => {
//         "_id": id,
//         "title": title,
//         "createdAt": createdAt?.toIso8601String(),
//         "updatedAt": updatedAt?.toIso8601String(),
//         "quizCount": quizCount,
//         "__v": v,
//       };
// }

class Event {
  Event({
    required this.id,
    required this.title,
    required this.caption,
    required this.school,
    required this.imageUrl,
    required this.createdAt,
    required this.updatedAt
  });

  final String? id;
  final String? title;
  final String? caption;
  final School? school;
  final String? imageUrl;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json["id"],
      title: json["title"],
      caption: json["caption"],
      imageUrl: json['imageUrl'] ?? "https://placehold.co/600x400.png",
      school: School.fromJson(json["school"]),
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "caption": caption,
        "school": school?.toJson(),
        "imageUrl":imageUrl,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

// class WeekTopRank {
//   WeekTopRank({
//     required this.quizWon,
//     required this.id,
//     required this.user,
//     required this.points,
//     required this.quizPlayed,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   final int? quizWon;
//   final String? id;
//   final User? user;
//   final int? points;
//   final int? quizPlayed;
//   final DateTime? createdAt;
//   final DateTime? updatedAt;

//   factory WeekTopRank.fromJson(Map<String, dynamic> json) {
//     return WeekTopRank(
//       quizWon: json["quizWon"],
//       id: json["_id"],
//       user: json["user"] == null ? null : User.fromJson(json["user"]),
//       points: json["points"],
//       quizPlayed: json["quizPlayed"],
//       createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
//       updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
//     );
//   }

//   Map<String, dynamic> toJson() => {
//         "quizWon": quizWon,
//         "_id": id,
//         "user": user?.toJson(),
//         "points": points,
//         "quizPlayed": quizPlayed,
//         "createdAt": createdAt?.toIso8601String(),
//         "updatedAt": updatedAt?.toIso8601String(),
//       };
// }

class School {
  School({
    required this.id,
    required this.schoolName,
    required this.city,
    required this.profilePic,
  });

  final String? id;
  final String? schoolName;
  final String? city;
  final String? profilePic;

  factory School.fromJson(Map<String, dynamic> json) {
    return School(
        id: json["id"],
        schoolName: json["schoolName"],
        city: json["city"],
        profilePic: json["profilePic"]);
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "schoolName": schoolName,
        "city": city,
        "profilePic": profilePic
      };
}
