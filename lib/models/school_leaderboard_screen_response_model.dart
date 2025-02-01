class SchoolLeaderboardScreenResponseModel {
  SchoolLeaderboardScreenResponseModel({
    required this.code,
    required this.status,
    required this.message,
    required this.schoolLeaderboard,
  });

  final int? code;
  final bool? status;
  final String? message;
  final List<SchoolLeaderboard>? schoolLeaderboard;

  factory SchoolLeaderboardScreenResponseModel.fromJson(Map<String, dynamic> json) {
    return SchoolLeaderboardScreenResponseModel(
      code: json["code"],
      status: json["status"],
      message: json["message"],
      schoolLeaderboard: json["schoolLeaderboard"] == null
          ? []
          : List<SchoolLeaderboard>.from(json["schoolLeaderboard"]!
              .map((x) => SchoolLeaderboard.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "schoolLeaderboard":
            schoolLeaderboard?.map((x) => x.toJson()).toList()
      };
}

class SchoolLeaderboard {
  SchoolLeaderboard({
    required this.quizWon,
    required this.id,
    required this.school,
    required this.points,
    required this.quizPlayed,
    required this.studentParticipated,
    required this.bestQuiz,
    required this.createdAt,
    required this.updatedAt,
  });

  
  final String id;
  final School school;
  final int points;
  final int quizPlayed;
  final int quizWon;
  final int studentParticipated;
  final Quiz bestQuiz;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory SchoolLeaderboard.fromJson(Map<String, dynamic> json) {
    return SchoolLeaderboard(
      
      id: json["id"],
      school: School.fromJson(json["school"]),
      points: json["points"],
      quizPlayed: json["quizPlayed"],
      quizWon: json["quizWon"],
      studentParticipated: json['studentParticipated'],
      bestQuiz: Quiz.fromJson(json['bestQuiz']),
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        
        "id": id,
        "school": school.toJson(),
        "points": points,
        "quizPlayed": quizPlayed,
        "quizWon": quizWon,
        "studentParticipated": studentParticipated,
        "bestQuiz": studentParticipated,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

class School {
  School({
    required this.id,
    required this.schoolName,
    required this.schoolCity,
    required this.profilePic
  });

  final String? id;
  final String? schoolName;
  final String? schoolCity;
  final String? profilePic;

  factory School.fromJson(Map<String, dynamic> json) {
    return School(
        id: json["id"],
        schoolName: json["schoolName"],
        schoolCity: json["schoolCity"],
        profilePic: json['profilePic']
        );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "schoolName": schoolName,
        "schoolCity": schoolCity,
        "profilePic": profilePic
      };
}

class Quiz {
  Quiz({
    required this.id,
    required this.quizName,
    required this.quizCategory,
    required this.quizLevel
  });

  final String? id;
  final String? quizName;
  final String? quizCategory;
  final String? quizLevel;

  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz(
        id: json["id"],
        quizName: json["quizName"],
        quizCategory: json["quizCategory"],
        quizLevel: json['quizLevel']
        );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "quizName": quizName,
        "quizCategory": quizCategory,
        "quizLevel": quizLevel
      };
}
