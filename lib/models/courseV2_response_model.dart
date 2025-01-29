class Coursev2ResponseModel {
  final bool status;
  final int code;
  final Course data;
  final String message;

  Coursev2ResponseModel({
    required this.status,
    required this.code,
    required this.data,
    required this.message,
  });

  factory Coursev2ResponseModel.fromJson(Map<String, dynamic> json) {
    return Coursev2ResponseModel(
      code: json['code'],
      status: json['status'],
      data: Course.fromJson(json['data']),
      message: json['message'],
    );
  }
}

class Course {
  final String courseId;
  final String title;
  final String description;
  final List<Module> modules;
  final List<Milestone>? milestones;
  

  Course({
    required this.courseId,
    required this.title,
    required this.description,
    required this.modules,
    required this.milestones,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      courseId: json['courseId'],
      title: json['title'],
      description: json['description'],
      modules: (json['modules'] as List).map((i) => Module.fromJson(i)).toList(),
      milestones: (json['milestones'] as List).map((i) => Milestone.fromJson(i)).toList(),
    );
  }
}

class Module {
  final String id;
  final int order;
  final String title;
  final dynamic content;
  final Quiz? quiz;
  final Milestone? milestone;
  final bool isCompleted;

  Module({
    required this.id,
    required this.order,
    required this.title,
    required this.content,
    required this.quiz,
    required this.milestone,
    required this.isCompleted
  });

  factory Module.fromJson(Map<String, dynamic> json) {
    return Module(
      id: json['id'],
      order: json['order'],
      title: json['title'],
      content: json['content'],
      quiz: Quiz.fromJson(json['quiz']),
      milestone: json['milestone'] == null ? null :  Milestone.fromJson(json['milestone']),
      isCompleted : json['isCompleted']
    );
  }
}

class Quiz {
  final List<Question> questions;

  Quiz({required this.questions});

  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz(
      questions: (json['question'] as List).map((i) => Question.fromJson(i)).toList(),
    );
  }
}

class Question {
  final String text;
  final List<String> options;
  final String correctAnswer;

  Question({
    required this.text,
    required this.options,
    required this.correctAnswer,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      text: json['text'],
      options: List<String>.from(json['options']),
      correctAnswer: json['correctAnswer'],
    );
  }
}

class Milestone {
  final String id;
  final String title;
  final String description;
  final int rewardPoints;
  // final List<RequiredModule> requiredModules;

  Milestone({
    required this.id,
    required this.title,
    required this.description,
    required this.rewardPoints,
    // required this.requiredModules,
  });

  factory Milestone.fromJson(Map<String, dynamic> json) {
    return Milestone(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      rewardPoints: json['rewardPoints'],
      // requiredModules: (json['requiredModules'] as List).map((i) => RequiredModule.fromJson(i)).toList(),
    );
  }
}

class RequiredModule {
  final String requiredModuleId;

  RequiredModule({required this.requiredModuleId});

  factory RequiredModule.fromJson(Map<String, dynamic> json) {
    return RequiredModule(
      requiredModuleId: json['requiredModuleId'],
    );
  }
}

class Response {
  final int code;
  final bool status;
  final String message;
  final Course data;

  Response({
    required this.code,
    required this.status,
    required this.message,
    required this.data,
  });

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
      code: json['code'],
      status: json['status'],
      message: json['message'],
      data: Course.fromJson(json['data']),
    );
  }
}