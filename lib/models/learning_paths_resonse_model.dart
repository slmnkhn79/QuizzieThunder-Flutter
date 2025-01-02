class LearningPathsResponseModel {
  final int code;
  final bool status;
  final String message;
  final List<LearningPath> paths;

  LearningPathsResponseModel(
      {
      required this.code,
      required this.status,
      required this.message,
      required this.paths});

  factory LearningPathsResponseModel.fromJson(Map<String, dynamic> json) {
    return LearningPathsResponseModel(
      code: json['code'],
      status: json['status'],
      message: json['message'],
      paths: json['paths'] == null ? [] : List<LearningPath>.from(json["paths"]!.map((x) => LearningPath.fromJson(x))),
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


  LearningPath({
    required this.id,
    required this.pathName,
    required this.description,
  });

  // Factory constructor to create a PathModel from a JSON map
  factory LearningPath.fromJson(Map<String, dynamic> json) {
    return LearningPath(
      id: json['id'],
      pathName: json['pathName'],
      description: json['description'],
    );
  }

  // Method to convert a PathModel instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id':id,
      'pathName': pathName,
      'description': description,
    };
  }
}
