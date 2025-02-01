class PostCommentResponseModel {
  final int code;
  final bool status;
  final String message;
  final List<Comment> comments;

  PostCommentResponseModel({
    required this.code,
    required this.status,
    required this.message,
    required this.comments,
  });

  // Factory constructor for creating a new ApiResponse instance from a map
  factory PostCommentResponseModel.fromJson(Map<String, dynamic> json) {
    return PostCommentResponseModel(
      code: json['code'],
      status: json['status'],
      message: json['message'],
      comments:(json['comments'] as List)
          .map((comment) => Comment.fromJson(comment))
          .toList(),
    );
  }

  // Method for converting ApiResponse instance into a map
  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'status': status,
      'message': message,
      'comments': comments.map((comment) => comment.toJson()).toList(),
    };
  }
}

class Comment {
  final String id;
  final String content;
  final String user;
  final String profilePic;
  final DateTime createdAt;
  final DateTime updatedAt;

  Comment({
    required this.id,
    required this.content,
    required this.user,
    required this.profilePic,
    required this.createdAt,
    required this.updatedAt,
  });

  // Factory constructor for creating a new Comment instance from a map
  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'],
      content: json['content'],
      user: json['user'],
      profilePic: json['profilePic'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  // Method for converting Comment instance into a map
  Map<String, dynamic> toJson() {
    return {
      'id':id,
      'content': content,
      'user': user,
      'profilePic': profilePic,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
