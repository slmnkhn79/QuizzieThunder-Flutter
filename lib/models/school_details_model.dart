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
  School({
    required this.id,
    required this.name,
    required this.achivements,
    required this.city,
    required this.district,
    required this.state,
    required this.footerImageUrl,
    required this.coursesOffered,
    required this.type,
    required this.description,
    required this.headerImageUrl
  });

  final String? id;
  final String? name;
  // final List<Achievements> achivements;
  final List<dynamic> achivements;
  final String city;
  final String district;
  final String state;
  final String footerImageUrl;
  final List<dynamic> coursesOffered;
  final String type;
  final String description;
  final String headerImageUrl;

  factory School.fromJson(Map<String, dynamic> json) {
    return School(
      id: json["_id"],
      name: json["name"],
      achivements: json["achivements"],
      
      // json["achivements"] == null
      //     ? []
      //     : List<Achievements>.from(
      //         json["achivements"]!.map((x) => Achievements.fromJson(x))),
      city: json["city"],
      state: json["state"],
      district: json["district"],
      footerImageUrl:  json["footerImageUrl"],
      coursesOffered:  json["coursesOffered"],
      type: json['type'],
      description: json['description'],
      headerImageUrl:  json['headerImageUrl']
    );
  }

  Map<String, dynamic> toJson() => {
        "_id" : id,
        "name" : name,
        "achivements" :  achivements,
        // achivements?.map((x) => x.toJson()).toList(),
        "city" : city,
        "state" : state,
        "district" : district,
        "footerImageUrl" : footerImageUrl,
        "coursesOffered" : coursesOffered,
        "type" : type,
        "description" : description,
        "headerImageUrl" : headerImageUrl
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
      achiveText: json['achiveOne'],
      // achiveTwo : json['achiveTwo'],
      // achiveThree : json['achiveThree'],
      achiveImageUrl: json['achiveOneImageUrl'],
      // achiveTwoImageUrl : json['achiveTwoImageUrl'],
      // achiveThreeImageUrl : json['achiveThreeImageUrl']
    );
  }

  Map<String, dynamic> toJson() => {
        "achiveOne": achiveText,
        // "achiveTwo" :achiveTwo,
        // "achiveThree" :achiveThree,
        "achiveOneImageUrl": achiveImageUrl,
        // "achiveTwoImageUrl" :achiveTwoImageUrl,
        // "achiveThreeImageUrl" :achiveThreeImageUrl,
      };
}
