class DiscoverLearningResponseModel {
  DiscoverLearningResponseModel({
    required this.code,
    required this.status,
    required this.data,
    required this.message
  });

  final int code;
  final bool status;
  final String message;
  final ContentCollections data;

  factory DiscoverLearningResponseModel.fromJson(Map<String, dynamic> json) {
    return DiscoverLearningResponseModel(
      code: json["code"],
      status: json["status"],
      message: json["message"],
      data: ContentCollections.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
        // "code": code,
        // "status": status,
        "data": data,
      };
}

class ContentCollections {
  final List<Book> books;
  final List<Learning> learnings;
  final List<Video> videos;
  final List<StudyPlan> studyPlans;
  final List<Course> courses;

  ContentCollections({
    required this.books,
    required this.learnings,
    required this.videos,
    required this.studyPlans,
    required this.courses,
  });

  // Factory constructor to create a ContentCollections instance from a JSON map
  factory ContentCollections.fromJson(Map<String, dynamic> json) {
    return ContentCollections(
      books: json["books"] == null
          ? []
          : List<Book>.from(json["books"]!.map((x) => Book.fromJson(x))),
      learnings: json["learnings"] == null
          ? []
          : List<Learning>.from(
              json["learnings"]!.map((x) => Learning.fromJson(x))),
      videos: json["mentorVideos"] == null
          ? []
          : List<Video>.from(
              json["mentorVideos"]!.map((x) => Video.fromJson(x))),
      studyPlans: json["studyPlan"] == null
          ? []
          : List<StudyPlan>.from(
              json["studyPlan"]!.map((x) => StudyPlan.fromJson(x))),
      courses: json["courses"] == null
          ? []
          : List<Course>.from(
              json["courses"]!.map((x) => Course.fromJson(x))),
    );
  }

  // Method to convert a ContentCollections instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'books': books.map((book) => book.toJson()).toList(),
      'learnings': learnings.map((learning) => learning.toJson()).toList(),
      'videos': videos.map((video) => video.toJson()).toList(),
      'studyPlans': studyPlans.map((plan) => plan.toJson()).toList(),
      'courses' : courses.map((course) => course.toJson()).toList()
    };
  }
}

class Book {
  final String id;
  final String bookName;
  final String bookPublisher;
  final String bookType;
  final String bookCategory;
  final String pdfLink;

  Book({
    required this.id,
    required this.bookName,
    required this.bookPublisher,
    required this.bookType,
    required this.bookCategory,
    required this.pdfLink,
  });

  // Method to create a Book object from a JSON map
  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      bookName: json['book_name'],
      bookPublisher: json['book_publisher'],
      bookType: json['book_type'],
      bookCategory: json['book_category'],
      pdfLink: json['pdf_link'],
    );
  }

  // Method to convert a Book object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'book_name': bookName,
      'book_publisher': bookPublisher,
      'book_type': bookType,
      'book_category': bookCategory,
      'pdf_link': pdfLink,
    };
  }
}

class Course {
  final String id;
  final String topicName;
  final String pdfUrl;
  final String standard;
  final String courseType;

  Course({
    required this.id,
    required this.topicName,
    required this.pdfUrl,
    required this.standard,
    required this.courseType,
  });

  // Method to create a Book object from a JSON map
  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'],
      topicName: json['topic_name'],
      pdfUrl: json['pdf_url'],
      standard: json['standard_name'],
      courseType: json['course_type'],
    );
  }

  // Method to convert a Book object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'book_name': topicName,
      'book_publisher': pdfUrl,
      'pdf_url':pdfUrl
    };
  }
}

class Learning {
  final String id;
  final String pathName;
  final Map<String, dynamic> description;

  Learning({
    required this.id,
    required this.pathName,
    required this.description,
  });

  // Factory constructor to create a Learning instance from a JSON map
  factory Learning.fromJson(Map<String, dynamic> json) {
    return Learning(
      id: json['id'],
      pathName: json['path_name'],
      description: json['description'],
    );
  }

  // Method to convert a Learning instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'path_name': pathName,
      'description': description,
    };
  }
}

class Video {
  final String id;
  final String videoLink;
  final String title;
  final String duration;
  final String thumbnail;
  final String videoType;

  Video(
      {required this.id,
      required this.videoLink,
      required this.title,
      required this.duration,
      required this.thumbnail,
      required this.videoType});

  // Factory constructor to create a Video instance from a JSON map
  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
        id: json['id'],
        videoLink: json['video_link'],
        title: json['title'],
        duration: json['duration'],
        thumbnail: json['thumbnail'],
        videoType: json['video_type']);
  }

  // Method to convert a Video instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'video_link': videoLink,
      'title': title,
      'duration': duration,
      'thumbnail': thumbnail,
      'video_type': videoType
    };
  }
}

class StudyPlan {
  final String id;
  final String planName;
  final String planDescription;
  final String pdfLink;
  final Map<String, dynamic>? planAttributes;
  final String standard;
  final String standardName;

  StudyPlan({
    required this.id,
    required this.planName,
    required this.planDescription,
    required this.pdfLink,
    required this.planAttributes,
    required this.standard,
    required this.standardName,
  });

  // Factory constructor to create a StudyPlan instance from a JSON map
  factory StudyPlan.fromJson(Map<String, dynamic> json) {
    return StudyPlan(
      id: json['id'],
      planName: json['plan_name'],
      planDescription: json['plan_description'],
      pdfLink: json['pdf_link'],
      planAttributes: json['plan_attributes'],
      standard: json['standard'],
      standardName: json['standard_name'],
    );
  }

  // Method to convert a StudyPlan instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'plan_name': planName,
      'plan_description': planDescription,
      'pdf_link': pdfLink,
      'plan_attributes': planAttributes,
      'standard': standard,
      'standard_name': standardName,
    };
  }
}
