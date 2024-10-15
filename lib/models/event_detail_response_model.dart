class EventDetailsResponseModel {
  EventDetailsResponseModel({
    required this.code,
    required this.status,
    required this.count,
    required this.images,
  });

  final int? code;
  final bool? status;
  final int? count;
  final List<ImageDetail>? images;

  factory EventDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    return EventDetailsResponseModel(
      code: json["code"],
      status: json["status"],
      count: json["count"],
      images: json["images"] == null
          ? []
          : List<ImageDetail>.from(json["images"]!.map((x) => ImageDetail.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "count": count,
        "images": images?.map((x) => x.toJson()).toList(),
      };
}

class ImageDetail {
  ImageDetail({
    required this.id,
    required this.title,
    required this.caption,
    required this.createdAt,
    required this.updatedAt,
  });

  final String? id;
  final String? title;
  final String? caption;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory ImageDetail.fromJson(Map<String, dynamic> json) {
    return ImageDetail(
      id: json["id"],
      title: json["title"],
      caption: json["caption"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "caption": caption,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}


