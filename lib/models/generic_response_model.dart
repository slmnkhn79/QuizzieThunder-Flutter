class GenericResponseModel {
  final int code;
  final String message;
  final bool status;

  GenericResponseModel(
      {required this.code, required this.message, required this.status});
  factory GenericResponseModel.fromJson(Map<String, dynamic> json) {
    return GenericResponseModel(
      code: json['code'],
      message: json['message'],
      status: json['status'],
    );
  }

  // Method to convert an instance to a JSON object
  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'message': message,
      'status': status,
    };
  }
}
