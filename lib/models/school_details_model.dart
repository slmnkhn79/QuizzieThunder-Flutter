class SchoolDetailsModel {
  SchoolDetailsModel({
    required this.code,
    required this.status,
    required this.message,
    required this.school,
  });

  final int? code;
  final bool? status;
  final String? message;
  final School school;

  factory SchoolDetailsModel.fromJson(Map<String, dynamic> json) {
    return SchoolDetailsModel(
        code: json["code"],
        status: json["status"],
        message: json["message"],
        school: School.fromJson(json["school"]));
  }

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "school": school.toJson()
      };
}

class School {
  School(
      {required this.id,
      required this.name,
      required this.achivements,
      required this.city,
      required this.district,
      required this.state,
      required this.footerImageUrl,
      required this.coursesOffered,
      required this.schoolType,
      required this.description,
      required this.headerImageUrl,
      required this.numOfStudents,
      required this.facultyRatio,
      required this.attributes});

  final String? id;
  final String? name;
  // final List<Achievements> achivements;
  final List<Achievements> achivements;
  final String city;
  final String district;
  final String state;
  final String footerImageUrl;
  final List<Course> coursesOffered;
  final String schoolType;
  final String description;
  final String headerImageUrl;
  final int numOfStudents;
  final String facultyRatio;
  final List<Attribute> attributes;

  factory School.fromJson(Map<String, dynamic> json) {
    return School(
      id: json["_id"],
      name: json["name"],
      achivements: 
      // json["achivements"],

      json["achivements"] == null
          ? []
          : List<Achievements>.from(
              json["achivements"]!.map((x) => Achievements.fromJson(x))),
      city: json["city"],
      state: json["state"],
      district: json["district"],
      footerImageUrl: json["footerImageUrl"],
      coursesOffered: json["coursesOffered"] == null ? [] : List<Course>.from(json["coursesOffered"]!.map((x) => Course.fromJson(x))),
      schoolType: json['type'],
      description: json['description'],
      headerImageUrl: json['headerImageUrl'],
      numOfStudents: json['numOfStudents'],
      facultyRatio: json['facultyRatio'],
      attributes: json["attributes"] == null
          ? []
          : List<Attribute>.from(
              json["attributes"]!.map((x) => Attribute.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "achivements": achivements,
        // achivements?.map((x) => x.toJson()).toList(),
        "city": city,
        "state": state,
        "district": district,
        "footerImageUrl": footerImageUrl,
        "coursesOffered": coursesOffered,
        "type": schoolType,
        "description": description,
        "headerImageUrl": headerImageUrl,
        "numOfStudents": numOfStudents,
        "facultyRatio": facultyRatio,
      };
}

class Achievements {
  final String achiveText;
  // final String achiveTwo;
  // final String achiveThree;
  final String achiveImageUrl;
  // final String achiveTwoImageUrl;
  // final String achiveThreeImageUrl;

  Achievements({
    required this.achiveText,
    //  required this.achiveTwo, required this.achiveThree,
    required this.achiveImageUrl,
    // required this.achiveTwoImageUrl, required this.achiveThreeImageUrl
  });

  factory Achievements.fromJson(Map<String, dynamic> json) {
    return Achievements(
      achiveText: json['achivement_text'],
      // achiveTwo : json['achiveTwo'],
      // achiveThree : json['achiveThree'],
      achiveImageUrl: json['achivement_image'],
      // achiveTwoImageUrl : json['achiveTwoImageUrl'],
      // achiveThreeImageUrl : json['achiveThreeImageUrl']
    );
  }

  Map<String, dynamic> toJson() => {
        "achivement_text": achiveText,
        // "achiveTwo" :achiveTwo,
        // "achiveThree" :achiveThree,
        "achivement_image": achiveImageUrl,
        // "achiveTwoImageUrl" :achiveTwoImageUrl,
        // "achiveThreeImageUrl" :achiveThreeImageUrl,
      };
}

class Attribute {
  final String type;
  final String score;
  final String ratings;

  Attribute({required this.type, required this.score, required this.ratings});
  factory Attribute.fromJson(Map<String, dynamic> json) {
    return Attribute(
        type: json['type'], score: json['score'], ratings: json['ratings']);
  }

  Map<String, dynamic> toJson() => {
        "type": type,
        "score": score,
        "ratings": ratings,
      };
}


class Course
{
  final String courseName;
  final String successPct;
  final String totalStudents;

  Course({required this.courseName, required this.successPct, required this.totalStudents});
  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
        courseName: json['courseName'], successPct: json['successPct'], totalStudents: json['totalStudents']);
  }

  Map<String, dynamic> toJson() => {
        "courseName": courseName,
        "successPct": successPct,
        "totalStudents": totalStudents,
      };
}