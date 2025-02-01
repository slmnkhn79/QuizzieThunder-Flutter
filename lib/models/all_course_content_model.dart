class AllCourseContentResponseModel {
  final int code;
  final bool status;
  final String message;
  final List<Course> courses;

  AllCourseContentResponseModel(
      {required this.code,
      required this.status,
      required this.message,
      required this.courses});
  factory AllCourseContentResponseModel.fromJson(Map<String, dynamic> json) {
    return AllCourseContentResponseModel(
      code: json['code'],
      status: json['status'],
      message: json['message'],
      courses: json['courses'] == null
          ? []
          : List<Course>.from(
              json["courses"]!.map((x) => Course.fromJson(x))),
    );
  }
}

class Course {
  final String id;
  final String topicName;
  final String pdfUrl;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Standard standard;
  final String courseType;
  

  Course(
      {required this.id,
      required this.topicName,
      required this.pdfUrl,
      required this.createdAt,
      required this.updatedAt,
      required this.standard,
      required this.courseType});

  // Factory method to create a StudyPlan from a JSON map
  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
        id: json['id'],
        topicName: json['topic_name'],
        pdfUrl: json['pdf_url'],
        createdAt: DateTime.parse(json['createdAt']),
        updatedAt: DateTime.parse(json['updatedAt']),
        standard: Standard.fromJson(json['standard']),
        courseType: json['course_type']);
  }

  // Method to convert a StudyPlan to a JSON map
  Map<String, dynamic> toJson() {
    return {
      
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
      standardName: json['standard_name'],
      standardcode: json['standard_code'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'standard_name': standardName,
      'standard_code': standardcode,
    };
  }
}
