class UpdatePasswordPostBodyModel {
  UpdatePasswordPostBodyModel(
      {required this.newPassword,
      required this.oldPassword,
      required this.confirmPassword});

  final String? newPassword;
  final String? oldPassword;
  final String? confirmPassword;

  factory UpdatePasswordPostBodyModel.fromJson(Map<String, dynamic> json) {
    return UpdatePasswordPostBodyModel(
      newPassword: json["newPassword"],
      oldPassword: json["oldPassword"],
      confirmPassword: json["confirmPassword"],
    );
  }

  Map<String, dynamic> toJson() => {
        "newPassword": newPassword,
        "oldPassword": oldPassword,
        "confirmPassword": confirmPassword
      };
}
