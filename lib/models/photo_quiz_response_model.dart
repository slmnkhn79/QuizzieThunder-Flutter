class PhotoQuizResponseModel {
  final int code;
  final String message;
  final bool status;
  final PhotoQuiz data;

  PhotoQuizResponseModel({required this.code, required this.message, required this.status, required this.data});
  factory PhotoQuizResponseModel.fromJson(Map<String, dynamic> json) {
    return PhotoQuizResponseModel(
      code: json['code'],
      message: json['message'],
      status: json['status'],
      data: PhotoQuiz.fromJson(json['data']),
    );
  }

  
  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'message': message,
      'status': status,
      'data': data,
    };
  }
}
class PhotoQuiz{
  final bool hasAttempted ;
  final String? imageUrl;
  

  PhotoQuiz({required this.hasAttempted, required this.imageUrl}); 

  factory PhotoQuiz.fromJson(Map<String, dynamic> json) {
    return PhotoQuiz(
      hasAttempted: json['hasAttempted'],
      imageUrl: json['imageUrl'] ?? '',

    );
  }
}