import 'package:firebase_auth/firebase_auth.dart';

class UserAccount {
  String username;
  String email;
  String firstName;
  String lastName;
  String birthday = "";

  UserAccount(
      {required this.username,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.birthday
  });
  Map toJson() => {
    'username': username,
    'email': email,
    'firstName': firstName,
    'lastName': lastName,
    'birthday': birthday
  };

  void addBirthday(String birthday) {
    this.birthday = birthday;
  }
}
