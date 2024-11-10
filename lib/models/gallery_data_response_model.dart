class GalleryDatesResponseModel {
  GalleryDatesResponseModel(
      {required this.code,
      required this.status,
      required this.message,
      required this.dates});

  final int? code;
  final bool? status;
  final String? message;
  final List<DatePair> dates;

  factory GalleryDatesResponseModel.fromJson(Map<String, dynamic> json) {
    return GalleryDatesResponseModel(
      code: json["code"],
      status: json["status"],
      message: json["message"],
      dates: json["dates"] == null
          ? []
          : List<DatePair>.from(
              json["dates"]!.map((x) => DatePair.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() =>
      {"code": code, "status": status, "message": message};
}

class DatePair {
  final int year;
  final List<String> month;

  DatePair({required this.year, required this.month});

  factory DatePair.fromJson(Map<String, dynamic> json) {
    return DatePair(year: json["year"], month: json['month']);
  }
  Map<String, dynamic> toJson() => {"year": year, "month": month.toList()};
}
