class ApiErrorResponseModel {
  ApiErrorResponseModel({
    required this.message,
    required this.status,
    this.error
  });

  final String? message;
  final int? status;
  final String? error;

  factory ApiErrorResponseModel.fromJson(Map<String, dynamic> json) {
    return ApiErrorResponseModel(
      message: json["message"],
      status: json["status"],
      error: json["error"],

    );
  }

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "error": error,

      };
}
