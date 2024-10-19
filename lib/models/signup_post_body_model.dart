class SignUpPostBodyModel {
  SignUpPostBodyModel({
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.username,
    required this.password,
  });

  final String? firstname;
  final String? lastname;
  final String? email;
  final String? username;
  final String? password;

  factory SignUpPostBodyModel.fromJson(Map<String, dynamic> json) {
    return SignUpPostBodyModel(
      firstname: json["firstname"],
      lastname: json["lastname"],
      email: json["email"],
      username: json["username"],
      password: json["password"],
    );
  }

  Map<String, dynamic> toJson() => {
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "username": username,
        "password": password,
      };
}
