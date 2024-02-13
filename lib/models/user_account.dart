// To parse this JSON data, do
//
//     final userAccount = userAccountFromJson(jsonString);

import 'dart:convert';

UserAccount userAccountFromJson(String str) => UserAccount.fromJson(json.decode(str));

String userAccountToJson(UserAccount data) => json.encode(data.toJson());

class UserAccount {
    String userName;
    String userEmail;
    String userPhone;
    String userPassword;

    UserAccount({
        required this.userName,
        required this.userEmail,
        required this.userPhone,
        required this.userPassword,
    });

    factory UserAccount.fromJson(Map<String, dynamic> json) => UserAccount(
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
