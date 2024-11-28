class PostDetailsResponseModel {
  PostDetailsResponseModel({
    required this.code,
    required this.status,
    required this.message,
    required this.post,
  });

  final int? code;
  final bool? status;
  final String? message;
  final Post post;

  factory PostDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    return PostDetailsResponseModel(
      code: json["code"],
      status: json["status"],
      message: json["message"],
      post: Post.fromJson(json["post"])
    );
  }

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "post":  post.toJson()
      };
}

class Post {
  Post({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.caption,
    required this.school,
    required this.likes,
    required this.createdAt,
    required this.updatedAt,
  });

  final String? id;
  final String? title;
  final String? caption;
  final School school;
  final int likes;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? imageUrl;

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json["id"],
      title: json["title"],
      caption: json["caption"],
      imageUrl: json["image_url"],
      likes: json['likes'],
      school: School.fromJson(json['school']),
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "caption": caption,
        "likes": likes,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "image_url":imageUrl
      };
}
class School {
  String schoolName;
  String logo;

  School({required this.schoolName, required this.logo});

  // Factory constructor for creating a new School instance from a map.
  factory School.fromJson(Map<String, dynamic> json) {
    return School(
      schoolName: json['schoolName'] ?? '',
      logo: json['logo'] ?? '',
    );
  }

  // A method that converts the School instance into a map.
  Map<String, dynamic> toJson() {
    return {
      'schoolName': schoolName,
      'logo': logo,
    };
  }
}


