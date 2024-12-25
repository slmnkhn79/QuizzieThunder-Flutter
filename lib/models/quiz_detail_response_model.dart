class QuizDetailResponseModel {
  QuizDetailResponseModel(
      {required this.code,
      required this.status,
      required this.quizDetail,
      required this.message});

  final int? code;
  final bool? status;
  final QuizDetail quizDetail;
  final String message;

  factory QuizDetailResponseModel.fromJson(Map<String, dynamic> json) {
    return QuizDetailResponseModel(
      code: json["code"],
      status: json["status"],
      message: json["message"],
      quizDetail: QuizDetail.fromJson(json["quizDetail"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "quizDetail": quizDetail.toJson(),
      };
}

class QuizDetail {
  final String id;
  final String quizName;
  final String quizDescription;
  final List<dynamic> quizPrizeDetails;
  final int numQuestions;
  final int? points;
  bool isPlayed;
  final String quizType;
  final String categoryName;
  final String? timeLimit;
  final String standard;
  final String level;

  QuizDetail(
      {
      required this.id,
      required this.quizName,
      required this.quizDescription,
      required this.quizPrizeDetails,
      required this.numQuestions,
      required this.points,
      required this.isPlayed,
      required this.quizType,
      required this.categoryName,
      required this.timeLimit,
      required this.standard,
      required this.level
      });

  factory QuizDetail.fromJson(Map<String, dynamic> json) {
    return QuizDetail(
      id: json['id'],
      quizName : json["quizName"],
      quizDescription : json["quizDescription"],
      quizPrizeDetails : json["quizPrizeDetails"],
      numQuestions : json["numQuestions"],
      points : json["points"],
      isPlayed : json["isPlayed"],
      quizType : json["quizType"],
      categoryName : json["categoryName"],
      timeLimit : json["timeLimit"],
      standard : json["standard"],
      level : json["level"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id":id,
        "quizName":quizName,
        "quizDescription":quizDescription,
        "quizPrizeDetails":quizPrizeDetails,
        "numQuestions":numQuestions,
        "points":points,
        "isPlayed":isPlayed,
        "quizType":quizType,
        "categoryName":categoryName,
        "timeLimit":timeLimit,
        "standard":standard,
        "level":level
      };
}
