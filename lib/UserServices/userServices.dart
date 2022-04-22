import 'dart:convert';
import 'dart:io';

import 'package:sign_ups/model/UserAccount.dart';

import '../constants/backend_constants.dart';
import 'package:http/http.dart' as http;

import '../model/Game.dart';

var client = http.Client();

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

Future<UserAccount?> getUserAccountByEmail(String? email) async {
  var url = Uri.parse(serverDomain + "users/getUserByEmail/" + email!);
  final response = await http.get(url);
  print(email);
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

// Get all favorite teams of user with email 'email'
Future<List<String?>> getFavoriteTeams(String? email) async {
  var url = Uri.parse(serverDomain + "users/getFavoriteTeams/" + email!);
  final response = await http.get(url);
  if (response.statusCode != 200) {
    print(response.statusCode);
    print(response.body);
    throw Exception(response.statusCode);
  }
  print(response.body);
  List<String> friendAccounts =
      (jsonDecode(response.body) as List<dynamic>).cast<String>();

  return friendAccounts;
}

Future<String?> addFriend(
    {required String? user, required String? friend}) async {
  try {
    var url =
        Uri.parse(serverDomain + "users/addFriend/" + user! + "/" + friend!);
    var response = await client.post(url,
        headers: {"content-type": "application/json"},
        body: jsonEncode({'user': user, 'friend': friend}));
    print('Response body: ${response.body} , ${response.statusCode}');
    if (response.statusCode == 201 || response.statusCode == 200) {
      return null;
    }
    return '${response.statusCode}';
  } on SocketException {
    print('No Internet connection');
  } on FormatException {
    print("Bad response format");
  }
}

Future<String?> removeFriend(
    {required String? user, required String? friend}) async {
  try {
    var url =
        Uri.parse(serverDomain + "users/removeFriend/" + user! + "/" + friend!);
    var response = await client.post(url,
        headers: {"content-type": "application/json"},
        body: jsonEncode({'user': user, 'friend': friend}));
    print('Response body: ${response.body} , ${response.statusCode}');
    if (response.statusCode == 201 || response.statusCode == 200) {
      return null;
    }
    return '${response.statusCode}';
  } on SocketException {
    print('No Internet connection');
  } on FormatException {
    print("Bad response format");
  }
}
