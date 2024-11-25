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
    required this.createdAt,
    required this.updatedAt,
  });

  final String? id;
  final String? title;
  final String? caption;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? imageUrl;

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json["id"],
      title: json["title"],
      caption: json["caption"],
      imageUrl: json["image_url"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "caption": caption,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "image_url":imageUrl
      };
}


