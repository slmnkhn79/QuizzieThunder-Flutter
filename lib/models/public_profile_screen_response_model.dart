import 'package:quizzie_thunder/models/discover_screen_response_model.dart';

class PublicProfileScreenResponseModel {
  PublicProfileScreenResponseModel(
      {required this.code,
      required this.status,
      required this.message,
      required this.userDetail,
      required this.stats,
      required this.otherAttributes});

  final int? code;
  final bool? status;
  final String? message;
  final UserDetail? userDetail;
  final Stats? stats;
  final OtherAttributes? otherAttributes;

  factory PublicProfileScreenResponseModel.fromJson(Map<String, dynamic> json) {
    return PublicProfileScreenResponseModel(
      code: json["code"],
      status: json["status"],
      message: json["message"],
      userDetail: json["user_detail"] == null
          ? null
          : UserDetail.fromJson(json["user_detail"]),
      stats: json["stats"] == null ? null : Stats.fromJson(json["stats"]),
      otherAttributes: json["otherAttributes"] == null ? null : OtherAttributes.fromJson(json["otherAttributes"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "user_detail": userDetail?.toJson(),
        "stats": stats?.toJson(),
      };
}

class OtherAttributes {
  final dynamic perfromance;
  final dynamic keyInterest;
  final List<dynamic> keySkills;
  final dynamic scores;

  OtherAttributes({
    required this.keyInterest,
    required this.keySkills,
    required this.scores,
    required this.perfromance,
  });
  factory OtherAttributes.fromJson(Map<String, dynamic> json) {
    return OtherAttributes(
      keyInterest: json['keyInterest'],
      keySkills: json['keySkills'],
      scores: json['scores'],
      perfromance: json['perfromance'],
    );
  }
}

class Stats {
  Stats({
    required this.quizWon,
    required this.id,
    required this.points,
    required this.totalQuizPlayed,
    required this.rank,
    required this.successRate,
    required this.averagePointsPerQuiz,
    required this.quizParticipationRate,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? quizWon;
  final String? id;
  final int? points;
  final int? totalQuizPlayed;
  final int? rank;
  final int? successRate;
  final double? averagePointsPerQuiz;
  final double? quizParticipationRate;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Stats.fromJson(Map<String, dynamic> json) {
    return Stats(
      quizWon: json["quiz_won"],
      id: json["_id"],
      points: json["points"],
      totalQuizPlayed: json["total_quiz_played"],
      rank: json["rank"],
      successRate: json["success_rate"],
      averagePointsPerQuiz: json["average_points_per_quiz"]?.toDouble(),
      quizParticipationRate: json["quiz_participation_rate"]?.toDouble(),
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "quiz_won": quizWon,
        "_id": id,
        "points": points,
        "total_quiz_played": totalQuizPlayed,
        "rank": rank,
        "success_rate": successRate,
        "average_points_per_quiz": averagePointsPerQuiz,
        "quiz_participation_rate": quizParticipationRate,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

class UserDetail {
  UserDetail({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.mobile,
    required this.about,
    required this.role,
    required this.isMobileNumberVerified,
    required this.isEmailVerified,
    required this.isBlocked,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.profilePic,
    required this.headerImage,
    required this.school,
    required this.standard,
    required this.description,
    required this.state,
    required this.city,
    required this.rank
  });

  final String? id;
  final String? firstname;
  final String? lastname;
  final String? email;
  final String? mobile;
  final String? about;
  final String? role;
  final bool? isMobileNumberVerified;
  final bool? isEmailVerified;
  final bool? isBlocked;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final String? profilePic;
  final String? headerImage;
  final School? school;
  final String? standard;
  final String? description;
  final String? state;
  final String? city;
  final int? rank;

  factory UserDetail.fromJson(Map<String, dynamic> json) {
    return UserDetail(
      id: json["_id"],
      firstname: json["firstname"],
      lastname: json["lastname"],
      email: json["email"],
      mobile: json["mobile"],
      about: json["about"],
      role: json["role"],
      isMobileNumberVerified: json["isMobileNumberVerified"],
      isEmailVerified: json["isEmailVerified"],
      isBlocked: json["isBlocked"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
      profilePic: json["profilePic"].length == 0
          ? "https://academy-v1.s3.ap-northeast-1.amazonaws.com/avatars/profile_pic.jpg"
          : json["profilePic"],
      headerImage: json["headerImage"].length == 0 ?
      "https://academy-v1.s3.ap-northeast-1.amazonaws.com/student_header_image/header_gif.gif"
      :json["headerImage"],
      school: json["school"] == null ? null : School.fromJson(json["school"]),
      standard: json["standard"],
      description: json["description"].length == 0 ? "No description available" : json["description"],
      state: json["state"],
      city:  json["city"],
      rank: json['rank']
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "mobile": mobile,
        "about": about,
        "role": role,
        "isMobileNumberVerified": isMobileNumberVerified,
        "isEmailVerified": isEmailVerified,
        "isBlocked": isBlocked,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "profilePic": profilePic,
      };
}
class School{
  final String? id;
  final String? schoolName;
  final String? schoolType;
  final String? city;
  final String? state;
  final String? logo;

  School( {
    required this.id,
    required this.schoolName,
    required this.schoolType,
    required this.city,
    required this.state,
    required this.logo,
  });
  factory School.fromJson(Map<String, dynamic> json) {
    return School(
      id: json["_id"],
      schoolName: json["schoolName"],
      schoolType: json["type"],
      state: json["state"],
      city: json["city"],
      logo: json["logo"],
    );
  }

Map<String, dynamic> toJson() => {
      "_id": id,
      "schoolName": schoolName,
      "type": schoolType,
      "state": state,
      "city": city,
      "logo": logo,
    };
}