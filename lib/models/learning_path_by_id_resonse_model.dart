class LearningPathByIdResponseModel {
  final int code;
  final bool status;
  final String message;
  final LearningPath? paths;

  LearningPathByIdResponseModel(
      {required this.code,
      required this.status,
      required this.message,
      required this.paths});

  factory LearningPathByIdResponseModel.fromJson(Map<String, dynamic> json) {
    return LearningPathByIdResponseModel(
      code: json['code'],
      status: json['status'],
      message: json['message'],
      paths:
          json['paths'] == null ? null : LearningPath.fromJson(json['paths']),
    );
  }

  // Method to convert a ResponseModel instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'status': status,
      'message': message,
      'paths': paths,
    };
  }
}

class LearningPath {
  final String id;
  final String pathName;
  final dynamic description;
  final dynamic content;

  LearningPath(
      {required this.id,
      required this.pathName,
      required this.description,
      required this.content});

  // Factory constructor to create a PathModel from a JSON map
  factory LearningPath.fromJson(Map<String, dynamic> json) {
    return LearningPath(
        id: json['id'],
        pathName: json['pathName'],
        description: json['description'],
        content: json['content']);
  }

  // Method to convert a PathModel instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'pathName': pathName,
      'description': description,
      "content": content
    };
  }
}
