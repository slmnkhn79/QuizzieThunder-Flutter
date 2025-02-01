class UserProgressResponseModel {
  final int code;
  final String message;
  final bool status;
  final List<UserProgress> userProgress;

  UserProgressResponseModel({required this.code, required this.message, required this.status, required this.userProgress});

  factory UserProgressResponseModel.fromJson(Map<String, dynamic> json) {
    return UserProgressResponseModel(
      code: json['code'],
      message: json['message'],
      status: json['status'],
      userProgress: (json['userProgress'] as List)
          .map((i) => UserProgress.fromJson(i))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'message': message,
      'status': status,
      'userProgress': userProgress.map((i) => i.toJson()).toList(),
    };
  }
}

class UserProgress {
  String id;
  DateTime createdAt;
  DateTime updatedAt;
  String user;
  String course;
  String currentModule;
  int rewardPoints;

  UserProgress({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
    required this.course,
    required this.currentModule,
    required this.rewardPoints,
  });

  factory UserProgress.fromJson(Map<String, dynamic> json) {
    return UserProgress(
      id: json['id'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      user: json['user'],
      course: json['course'],
      currentModule: json['currentModule'],
      rewardPoints: json['rewardPoints'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'user': user,
      'course': course,
      'currentModule': currentModule,
      'rewardPoints': rewardPoints,
    };
  }
}