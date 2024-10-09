import 'package:quizzie_thunder/models/post_card_item_model.dart';

class FeedScreenResponseModel {
  
  final int? code;
  final bool status;
  final List<PostCardModel> posts;
  final int skip;
  final int limit;

  FeedScreenResponseModel({required this.code, required this.status, required this.posts, required this.skip, required this.limit});

  factory FeedScreenResponseModel.fromJson(Map<String, dynamic> json) {
    return FeedScreenResponseModel(
      code: json["code"],
      status: json["status"],
      posts: List<PostCardModel>.from(json["quizzes"]!.map((x) => PostCardModel.fromJson(x))),
      skip: json['skip'],
      limit: json['limit']
    );
  }

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "posts": posts.map((x) => x.toJson()).toList(),
        "skip": skip,
        "limit": limit
      };

}