class PostCardModel {
  final String id;
  final String photoUrl;
  final String profImage;
  final User user;
  final int likes;
  final String? postUrl;
  final String? caption;
  final List<Comments> comments;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  PostCardModel(
      {
      required this.id,
      required this.photoUrl,
      required this.profImage,
      required this.user,
      required this.likes,
      required this.postUrl,
      required this.comments,
      required this.createdAt,
      required this.updatedAt,
      required this.caption
      });

  factory PostCardModel.fromJson(Map<String, dynamic> json) {
    return PostCardModel(
      id: json["id"],
      photoUrl: json["photoUrl"],
      profImage: json["profImage"] == null ?  '' : json['profImage'],
      // user: json["user"] == null ? null : User.fromJson(json["user"]),
      user: User.fromJson(json['user']),
      likes: json["likes"],
      postUrl: json["postUrl"] == null ? '' : json['postUrl'],
      caption : json["caption"],
      comments: json["comments"] == null
          ? []
          : List<Comments>.from(
              json["comments"]!.map((x) => Comments.fromJson(x))),
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "photoUrl": photoUrl,
        "profImage": profImage!,
        "user": user.toJson(),
        "likes": likes,
        "postUrl": postUrl!,
        "caption":caption,
        "comments": comments.map((x) => x.toJson()).toList(),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

class User {
  User({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.username,
    required this.profilePic,
  });

  final String id;
  final String firstname;
  final String lastname;
  final String profilePic;
  final String username;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json["_id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        profilePic: json["profilePic"],
        username: json['username']);
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "firstname": firstname,
        "lastname": lastname,
        "profilePic": profilePic,
        "username":username
      };
}

class Comments {
  final String id;
  final String comment;
  final User user;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Comments(
      {
      required this.id,
      required this.comment,
      required this.user,
      required this.createdAt,
      required this.updatedAt
      });

  factory Comments.fromJson(Map<String, dynamic> json) {
    return Comments(
      id: json["_id"],
      comment: json["firstname"],
      // user: json["user"] == null ? null : User.fromJson(json["user"]),
      user : User.fromJson(json["user"]),
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "comment": comment,
        "user": user?.toJson(),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
