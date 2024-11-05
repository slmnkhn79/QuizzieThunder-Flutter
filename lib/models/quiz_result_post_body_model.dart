class QuizResultPostBodyModel {
  QuizResultPostBodyModel({
    required this.ansMap,
    required this.quizId,
    required this.userId,
  });

  final Map<String,String> ansMap;
  final String quizId;
  final String userId;

  factory QuizResultPostBodyModel.fromJson(Map<String, dynamic> json) {
    return QuizResultPostBodyModel(
      ansMap: json['ansMap'],
      quizId: json['quizId'],
      userId: json['userId']
    );
  }

  Map<String, dynamic> toJson() => {
        "ansMap": ansMap,
        "userId": userId,
        'quizId':quizId
      };
}
