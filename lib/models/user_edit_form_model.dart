class UserEditFormModel {
  final String? username;
  final String? name;
  final String? email;
  final String? password;
  final String? ktp;

  UserEditFormModel({
    this.username,
    this.name,
    this.email,
    this.password,
    this.ktp,
  });

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "name": name,
      "email": email,
      "password": password,
      "ktp": ktp ?? "",
    };
  }
}
