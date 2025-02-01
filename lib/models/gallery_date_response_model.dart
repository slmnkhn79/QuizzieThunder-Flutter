class GalleryDatesResponseModel {
  GalleryDatesResponseModel(
      {required this.code,
      required this.status,
      required this.message,
      required this.dates});

  final int? code;
  final bool? status;
  final String? message;
  final List<Dates> dates;

  factory GalleryDatesResponseModel.fromJson(Map<String, dynamic> json) {
    return GalleryDatesResponseModel(
      code: json["code"],
      status: json["status"],
      message: json["message"],
      dates: json["dates"] == null
          ? []
          : List<Dates>.from(
              json["dates"]!.map((x) => Dates.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() =>
      {"code": code, "status": status, "message": message};
}

class Dates {
  final int year;
  final List<dynamic> month;

  Dates({required this.year, required this.month});

  factory Dates.fromJson(Map<String, dynamic> json) {
    return Dates(year: json["year"], month: json['month_arr']);
  }
  Map<String, dynamic> toJson() => {"year": year, "month_arr": month};
}
