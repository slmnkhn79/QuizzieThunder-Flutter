class SignInPostBodyModel {
  SignInPostBodyModel({
    required this.username,
    required this.password,
  });

  final String? username;
  final String? password;

  factory SignInPostBodyModel.fromJson(Map<String, dynamic> json) {
    return SignInPostBodyModel(
      username: json["username"],
      password: json["password"],
    );
  }

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
      };
}
