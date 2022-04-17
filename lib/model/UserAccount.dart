import 'package:firebase_auth/firebase_auth.dart';

class UserAccount {
  String? username;
  String? email;
  String? firstName;
  String? lastName;
  String? birthday;
  String? profilePicColor;

  UserAccount(
      {this.username,
      this.email,
      this.firstName,
      this.lastName,
      this.birthday,
      this.profilePicColor});

  UserAccount.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    birthday = json['birthday'];
    profilePicColor = json['profile_color'];
  }

  Map toJson() => {
        'username': username,
        'email': email,
        'firstName': firstName,
        'lastName': lastName,
        'birthday': birthday,
        'profile_color': profilePicColor,
      };

  void addBirthday(String birthday) {
    this.birthday = birthday;
  }
}

// Global object for when the user is creating their account
var globalUserAccount;
