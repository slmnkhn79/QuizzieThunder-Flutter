class PostCardModel {
  final String id;
  final String photoUrl;
  final String caption;
  // // final String profImage;
  // // final String? postUrl;
  final School school;
  final List<Comments> comments;
  final int likes;

  final DateTime? createdAt;
  final DateTime? updatedAt;

  PostCardModel({
    required this.id,
    required this.photoUrl,
    required this.caption,
    required this.school,
    required this.comments,
    // // required this.profImage,
    required this.likes,
    // // required this.postUrl,
    
    required this.createdAt,
    required this.updatedAt,
  });

  factory PostCardModel.fromJson(Map<String, dynamic> json) {
    return PostCardModel(
      id: json["id"],
      photoUrl: json["photoUrl"],
      caption: json["caption"],
      // // profImage: json["profImage"] == null ? '' : json['profImage'],
      // // user: json["user"] == null ? null : User.fromJson(json["user"]),
      school: School.fromJson(json['school']),
       comments: json["comments"] == null
          ? []
          : List<Comments>.from(
              json["comments"]!.map((x) => Comments.fromJson(x))),
      likes: json["likes"],
      // // postUrl: json["postUrl"] == null ? '' : json['postUrl'],
      
     
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "photoUrl": photoUrl,
        "caption": caption,
        // // "profImage": profImage,
        "school": school.toJson(),
        "comments": comments.map((x) => x.toJson()).toList(),
        // "likes": likes,
        // // "postUrl": postUrl!,
        
        
        // "createdAt": createdAt?.toIso8601String(),
        // "updatedAt": updatedAt?.toIso8601String(),
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
        id: json["id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        profilePic: json["profilePic"],
        username: json['userName']
        );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstname": firstname,
        "lastname": lastname,
        "profilePic": profilePic,
        "username": username
      };
}

class School {
  final String id;
  final String schoolName;
  final String city;
  final String profilePic;

  School(
      {required this.id,
      required this.schoolName,
      required this.city,
      required this.profilePic});

  factory School.fromJson(Map<String, dynamic> json) {
    return School(
        id: json["id"],
        schoolName: json["schoolName"],
        city: json['city'],
        profilePic: json['profilePic']);
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "schoolName": schoolName,
        "city": city,
        "profilePic": profilePic
      };
}

class Comments {
  final String id;
  final String comment;
  final User user;
  // final DateTime? createdAt;
  // final DateTime? updatedAt;

  Comments(
      {required this.id,
      required this.comment,
      required this.user,
      // required this.createdAt,
      // required this.updatedAt
      });

  factory Comments.fromJson(Map<String, dynamic> json) {
    return Comments(
      id: json["id"],
      comment: json["comment"],
      // user: json["user"] == null ? null : User.fromJson(json["user"]),
      user: User.fromJson(json["user"]),
      // createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      // updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "comment": comment,
        "user": user.toJson(),
        // "createdAt": createdAt?.toIso8601String(),
        // "updatedAt": updatedAt?.toIso8601String(),
      };
}
