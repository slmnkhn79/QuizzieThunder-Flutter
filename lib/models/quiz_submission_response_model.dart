class QuizSubmissionResponseModel {
  final int code;
  final bool status;
  final String message;
  final Data data;

  QuizSubmissionResponseModel({
    required this.code,
    required this.status,
    required this.message,
    required this.data,
  });

  factory QuizSubmissionResponseModel.fromJson(Map<String, dynamic> json) {
    return QuizSubmissionResponseModel(
      code: json['code'],
      status: json['status'],
      message: json['message'],
      data: Data.fromJson(json['data']),
    );
  }
}

class Data {
  final List<Result>? allResults;
  final Result? self;

  Data({
    required this.allResults,
    this.self,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    var list = json['allResults'] as List;
    List<Result> allResultsList = list.map((i) => Result.fromJson(i)).toList();

    return Data(
      allResults: allResultsList,
      self: json['self'] != null ? Result.fromJson(json['self']) : null,
    );
  }
}

class Result {
  final String id;
  final String imageUrl;
  bool? isLiked;

  Result({
    required this.id,
    required this.imageUrl,
    required this.isLiked
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      id: json['id'],
      imageUrl: json['imageUrl'],
      isLiked: json['isLiked'] ?? false
    );
  }
}