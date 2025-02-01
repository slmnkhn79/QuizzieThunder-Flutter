class GalleryDetailsResponseModel {
  GalleryDetailsResponseModel(
      {required this.code,
      required this.status,
      required this.message,
      required this.eventDetails
      });

  final int? code;
  final bool? status;
  final String? message;
  final List<EventsDetails> eventDetails;

  factory GalleryDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    return GalleryDetailsResponseModel(
      code: json["code"],
      status: json["status"],
      message: json["message"],
      eventDetails: json["events_details"] == null
          ? []
          : List<EventsDetails>.from(json["events_details"]!.map((x) => EventsDetails.fromJson(x))),
    );
  }
}

class EventsDetails {
  final int likes;
  final String imageUrl;
  final String id;
  final DateTime? createdAt;
  final DateTime ?updatedAt;

  EventsDetails(
      {required this.likes,
        required this.createdAt, 
        required this.updatedAt,
      required this.imageUrl,
      required this.id});

  factory EventsDetails.fromJson(Map<String, dynamic> json) {
    return EventsDetails(
        likes: json['likes'],
        imageUrl: json["image_url"],
        id: json['id'],
        createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
        updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
        );
  }
}

