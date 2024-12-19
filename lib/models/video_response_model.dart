class VideoReponseModel {
final int code;
  final bool status;
  final String message;
  final Video? video;

  VideoReponseModel(
      {required this.code,
      required this.status,
      required this.message,
      required this.video});
  factory VideoReponseModel.fromJson(Map<String, dynamic> json) {
    return VideoReponseModel(
      code: json['code'],
      status: json['status'],
      message: json['message'],
      video: json['video'] == null
          ? null
          :  Video.fromJson(json['video']),
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
      videoLink: json['videoLink'] ,
      title: json['title'] ,
      duration: json['duration'] ,
      thumbnail: json['thumbnail'] ,
      videoType: json['videoType'] ,
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