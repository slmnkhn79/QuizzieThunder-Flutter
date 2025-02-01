class StudyPlanResponseModel {
  final int code;
  final bool status;
  final String message;
  final StudyPlan? plan;

  StudyPlanResponseModel(
      {required this.code,
      required this.status,
      required this.message,
      required this.plan});
  factory StudyPlanResponseModel.fromJson(Map<String, dynamic> json) {
    return StudyPlanResponseModel(
      code: json['code'],
      status: json['status'],
      message: json['message'],
      plan: json['plan'] == null
          ? null
          :  StudyPlan.fromJson(json['plan']),
    );
  }
}

class StudyPlan {
  final String id;
  final String planName;
  final String planDescription;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? pdfLink;
  final Standard standard;
  final dynamic planAttributes;
  

  StudyPlan(
      {required this.id,
      required this.planName,
      required this.planDescription,
      required this.createdAt,
      required this.updatedAt,
      required this.pdfLink,
      required this.standard,
      required this.planAttributes});

  // Factory method to create a StudyPlan from a JSON map
  factory StudyPlan.fromJson(Map<String, dynamic> json) {
    return StudyPlan(
        id: json['id'],
        planName: json['planName'],
        planDescription: json['planDescription'],
        createdAt: DateTime.parse(json['createdAt']),
        updatedAt: DateTime.parse(json['updatedAt']),
        pdfLink: json['pdfLink'],
        standard: Standard.fromJson(json['standard']),
        planAttributes: json['planAttributes']);
  }

  // Method to convert a StudyPlan to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'objectId': id,
      'planName': planName,
      'planDescription': planDescription,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'pdfLink': pdfLink,
      'standard': standard.toJson(),
      'planAttributes': planAttributes
    };
  }
}

// Define the class for the Standard object
class Standard {
  final String id;
  final String standardName;
  final String standardcode;

  Standard({
    required this.id,
    required this.standardName,
    required this.standardcode,
  });

  factory Standard.fromJson(Map<String, dynamic> json) {
    return Standard(
      id: json['id'],
      standardName: json['standardName'],
      standardcode: json['standardcode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'standardName': standardName,
      'standardcode': standardcode,
    };
  }
}
