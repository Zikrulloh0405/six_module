// class User {
//   String? id;
//   String? email;
//   String? password;

//   User(this.id, this.email, this.password);

//   User.fromJson(Map<String, dynamic> json)
//       : id = json['id'],
//         email = json['email'],
//         password = json["password"];

//   Map<String, dynamic> toJson() => {
//     'id' : id,
//     'email' : email,
//     'password' : password
//   };
// }


// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    String? userName;
    String userEmail;
    String? userPhone;
    String? userPassword;

    User({
        this.userName,
        required this.userEmail,
        this.userPhone,
        this.userPassword,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        userName: json["userName"],
        userEmail: json["userEmail"],
        userPhone: json["userPhone"],
        userPassword: json["userPassword"],
    );

    Map<String, dynamic> toJson() => {
        "userName": userName,
        "userEmail": userEmail,
        "userPhone": userPhone,
        "userPassword": userPassword,
    };
}

