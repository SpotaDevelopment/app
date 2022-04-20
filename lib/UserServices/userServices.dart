import 'dart:convert';
import 'dart:io';

import 'package:sign_ups/model/UserAccount.dart';

import '../constants/backend_constants.dart';
import 'package:http/http.dart' as http;

import '../model/Game.dart';

Future<List<UserAccount>> getUsersByPrefixService(
    String prefix, bool isEmail) async {
  String field = (isEmail) ? "email" : "username";
  var url = Uri.parse(
      serverDomain + "users/getUsersByPrefix/" + prefix + "/" + field);
  final response = await http.get(url);
  if (response.statusCode != 200) {
    print(response.statusCode);
    print(response.body);
    throw Exception(response.statusCode);
  }
  print(response.body);
  List<UserAccount> userAccounts = (json.decode(response.body) as List)
      .map((i) => UserAccount.fromJson(i))
      .toList();
  return userAccounts;
}

Future<UserAccount?> getUserAccountByEmail(String email) async {
  var url = Uri.parse(serverDomain + "users/getUserByEmail/" + email);
  final response = await http.get(url);
  if (response.statusCode != 200) {
    print(response.statusCode);
    print(response.body);
    throw Exception(response.statusCode);
  }
  print(response.body);
  UserAccount userAccount = UserAccount.fromJson(json.decode(response.body));
  return userAccount;
}

// Get all friends of the user who has an email 'email'
Future<List<UserAccount?>> getFriendsByEmail(String? email) async {
  var url = Uri.parse(serverDomain + "users/getFriends/" + email!);
  final response = await http.get(url);
  if (response.statusCode != 200) {
    print(response.statusCode);
    print(response.body);
    throw Exception(response.statusCode);
  }
  List<UserAccount> friendAccounts = (json.decode(response.body) as List)
      .map((i) => UserAccount.fromJson(i))
      .toList();
  return friendAccounts;
}
