class GalleryResponseModel {
  GalleryResponseModel(
      {required this.code,
      required this.status,
      required this.message,
      required this.gallery
      });

  final int? code;
  final bool? status;
  final String? message;
  final List<Gallery> gallery;

  factory GalleryResponseModel.fromJson(Map<String, dynamic> json) {
    return GalleryResponseModel(
      code: json["code"],
      status: json["status"],
      message: json["message"],
      gallery: json["events"] == null
          ? []
          : List<Gallery>.from(json["events"]!.map((x) => Gallery.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() =>
      {"code": code, "status": status, "message": message};
}

class Gallery {
  final DateTime date;
  final String eventName;
  final String headerImageUrl;
  final String id;
  final DateTime? createdAt;
  final DateTime ?updatedAt;

  Gallery(
      {
        required this.createdAt, 
        required this.updatedAt,
        required this.date,
      required this.eventName,
      required this.headerImageUrl,
      required this.id});

  factory Gallery.fromJson(Map<String, dynamic> json) {
    return Gallery(
        date: DateTime.parse(json["event_date"]),
        eventName: json["event_name"] ?? 'Event Name',
        headerImageUrl: json["headerImageUrl"],
        id: json['id'],
        createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
        updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
        );
  }

  Map<String, dynamic> toJson() => {
        "event_date": date,
        "event_name": eventName,
        "headerImageUrl": headerImageUrl,
        "id": id
      };
}
