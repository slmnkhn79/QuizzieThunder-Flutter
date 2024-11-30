class LikeUnlikeResponseModel{
  final String code;
  final bool status;
  final String message;
 LikeUnlikeResponse res;

  LikeUnlikeResponseModel({
    required this.code,
    required this.status,
    required this.message,
    required this.res,

  });

  // Factory constructor that creates an instance from a map (e.g., from JSON)
  factory LikeUnlikeResponseModel.fromJson(Map<String, dynamic> map) {
    return LikeUnlikeResponseModel(
      code: map['id'] ,
      status: map['status'] ,
      message: map['message'] ,
      res : LikeUnlikeResponse.fromJson(map['post'])
    );
  }

  // Method to convert an instance back to a map (e.g., for JSON serialization)
  Map<String, dynamic> toJson() {
    return {
      "code" : code,
      "status" : status,
      "message" : message,
      "post" : res,
    };
  }
}

class LikeUnlikeResponse {
  final String id;
  bool isLiked;
  int likes;

  LikeUnlikeResponse({
    required this.id,
    this.isLiked = false,
    this.likes = 0,
  });

  // Factory constructor that creates an instance from a map (e.g., from JSON)
  factory LikeUnlikeResponse.fromJson(Map<String, dynamic> json) {
    return LikeUnlikeResponse(
      id: json['id'] ,
      isLiked: json['isLiked'] as bool? ?? false,
      likes: json['likes'] as int? ?? 0,
    );
  }

  // Method to convert an instance back to a map (e.g., for JSON serialization)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'isLiked': isLiked,
      'likes': likes,
    };
  }
}