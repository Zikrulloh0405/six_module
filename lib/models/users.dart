// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

import 'dart:convert';

List<Users> usersFromJson(String str) => List<Users>.from(json.decode(str).map((x) => Users.fromJson(x)));

String usersToJson(List<Users> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Users {
    String token;
    String email;
    String number;
    String password;
    String id;

    Users({
        required this.token,
        required this.email,
        required this.number,
        required this.password,
        required this.id,
    });

    factory Users.fromJson(Map<String, dynamic> json) => Users(
        token: json["token"],
        email: json["email"],
        number: json["number"],
        password: json["password"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "email": email,
        "number": number,
        "password": password,
        "id": id,
    };
}
