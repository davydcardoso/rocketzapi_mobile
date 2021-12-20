import 'dart:convert';

class UserModel {
  final String token;
  final String name;
  final String email;
  final String company;

  UserModel({
    required this.token,
    required this.name,
    required this.email,
    required this.company,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['user']['name'],
      email: map['user']['email'],
      company: map['user']['company'],
      token: map['token'],
    );
  }

  factory UserModel.fromJson(String json) =>
      UserModel.fromMap(jsonDecode(json));

  // factory UserModel.toModel() {
  //   return UserModel(name: name, company: '', email: '', token: '');
  // }

  Map<String, dynamic> toMap() => {
        "name": name,
        "email": email,
        "company": company,
      };

  String toJson() => jsonEncode(toMap());
}
