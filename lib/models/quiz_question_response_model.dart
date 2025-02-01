import 'package:quizzie_thunder/utils/app_utils.dart';

class QuizQuestionResponseModel {
  QuizQuestionResponseModel({
    required this.code,
    required this.status,
    required this.quiz,
    required this.questions,
  });

  final int? code;
  final bool? status;
  final Quiz? quiz;
  final List<Question>? questions;

  factory QuizQuestionResponseModel.fromJson(Map<String, dynamic> json) {
    return QuizQuestionResponseModel(
      code: json["code"],
      status: json["status"],
      quiz: json["quiz"] == null ? null : Quiz.fromJson(json["quiz"]),
      questions: json["questions"] == null
          ? []
          : List<Question>.from(
              json["questions"]!.map((x) => Question.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "quiz": quiz?.toJson(),
        "questions": questions?.map((x) => x.toJson()).toList(),
      };
}

class Question {
  Question({
    required this.id,
    required this.question,
    required this.options,
    required this.correctOptionIndex,
    required this.createdAt,
    required this.updatedAt,
    required this.questionType,
    required this.imageUrl
  });

  final String? id;
  final String? question;
  final List<String> options;
  final int? correctOptionIndex;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String questionType;
  final String? imageUrl;

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json["_id"],
      question: AppUtils().convertBase64ToString(json["question"]),
      options: json["options"] == null
          ? []
          : List<String>.from(json["options"]!.map((x) => x)),
      correctOptionIndex: json["correctOptionIndex"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      questionType: json['question_type'],
      imageUrl: json['image_url']
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "question": question,
        "options": options.map((x) => x).toList(),
        "correctOptionIndex": correctOptionIndex,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

class Quiz {
  Quiz({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.createdAt,
    required this.updatedAt,
    required this.totalQuestions,
    required this.timeLimit
  });

  final String? id;
  final String? title;
  final String? description;
  final Category? category;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? totalQuestions;
  final String? timeLimit;

  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz(
      id: json["_id"],
      title: json["title"],
      description: json["description"],
      category:
          json["category"] == null ? null : Category.fromJson(json["category"]),
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      totalQuestions: json['totalQuestions'],
      timeLimit: json['time_limit']
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "description": description,
        "category": category?.toJson(),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "totalQuestions":totalQuestions
      };
}

class Category {
  Category({
    required this.id,
    required this.title,
    required this.createdAt,
    required this.updatedAt,
  });

  final String? id;
  final String? title;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json["_id"],
      title: json["title"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
enum QuestionType {
  mcq,
  imageUpload,
  longAnswer,
}
