class AllVideosReponseModel {
final int code;
  final bool status;
  final String message;
  final List<Video> videos;

  AllVideosReponseModel(
      {required this.code,
      required this.status,
      required this.message,
      required this.videos});
  factory AllVideosReponseModel.fromJson(Map<String, dynamic> json) {
    return AllVideosReponseModel(
      code: json['code'],
      status: json['status'],
      message: json['message'],
      videos: json['videos'] == null
          ? []
          : List<Video>.from(
              json["videos"]!.map((x) => Video.fromJson(x))),
    );
  }
}
class Video {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? videoLink; 
  final String? title;
  final String? duration;
  final String? thumbnail;
  final String? videoType;

  Video({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.videoLink,
    this.title,
    this.duration,
    this.thumbnail,
    this.videoType,
  });

  // Example of a factory constructor for creating an instance from JSON
  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      id: json['id'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt'] ),
      videoLink: json['video_link'] ,
      title: json['title'] ,
      duration: json['duration'] ,
      thumbnail: json['thumbnail'] ,
      videoType: json['video_type'] ,
    );
  }

  // Example of a method for converting an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'video_link': videoLink,
      'title': title,
      'duration': duration,
      'thumbnail': thumbnail,
      'video_type': videoType,
    };
  }
}