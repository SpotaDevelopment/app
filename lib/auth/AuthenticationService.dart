import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/all_constants.dart';
import '../model/Game.dart';
import '../model/NewsPost.dart';
import '../model/UserAccount.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  //final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  //final SharedPreferences prefs = SharedPreferences.getInstance();

  var client = http.Client();

  get user => _firebaseAuth.currentUser;
  // AuthenticationService(this._firebaseAuth);

  Stream<User?> get authStateChanges => _firebaseAuth
      .idTokenChanges(); //used to go to home page or authentication page (listen in the widget tree)

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<String?> signIn(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String?> verifyValidUsername({required String username}) async {
    //Do this later
  }

  Future<String?> createUserWithEmailAndPassword(
      {required String email,
      required String password,
      required String passwordCheck,
      required String username}) async {
    if (password != passwordCheck) {
      return "Passwords must match";
    } else {
      try {
        await _firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);

        FirebaseAuth.instance.currentUser?.updateDisplayName(
            username); //adds users username to their account
        return null;
      } on FirebaseAuthException catch (e) {
        return e.message;
      }
    }
  }

  Future<String?> signUp({required UserAccount userAccount}) async {
    try {
      var url = Uri.parse(serverDomain + "users/signUp");
      var body = jsonEncode(userAccount);
      var response = await http.post(url,
          headers: {"content-type": "application/json"}, body: body);
      if (response.statusCode != 201) {
        print(response.body);
        return '${response.statusCode}';
      }
      return null;
    } on SocketException {
      print('No Internet connection');
    } on FormatException {
      print("Bad response format");
    }
  }

  Future<String?> passwordReset({required String email}) async {
    try {
      final user = await _firebaseAuth.sendPasswordResetEmail(email: email);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String?> addTeamSubscription(
      {required String teamName, required String email}) async {
    try {
      var url = Uri.parse(
          serverDomain + "/users/teamSubscription/" + teamName + "/" + email);
      var response =
          await http.post(url, headers: {"content-type": "application/json"});
      print('Response body: ${response.body} , ${response.statusCode}');
      if (response.statusCode != 201) {
        return '${response.statusCode}';
      }
      return null;
    } on SocketException {
      print('No Internet connection');
    } on FormatException {
      print("Bad response format");
    }
  }

  Future<String?> addTeamSubscriptions(
      {required var selectedTeams, required String email}) async {
    for (int i = 0; i < selectedTeams.length; i++) {
      print(userAccount.email);
      addTeamSubscription(teamName: selectedTeams[i], email: email);
    }
    //return null; //@mattyost00 do we want to add this here?
  }

  ///fetchGames() calls the backend to get all the games from the database and returns a list of games.
  Future<List<Game>> fetchGames() async {
    var user_email = "";
    var link = "";
    if (FirebaseAuth.instance.currentUser != null) {
      user_email = FirebaseAuth.instance.currentUser!.email.toString();
      link = serverDomain + "users/getScores/" + user_email;
    } else {
      print("went into getGeneralScores");
      link = serverDomain + "users/getGeneralScores"; //no user is logged in
    }
    final response = await http.get(Uri.parse(link));
    if (response.statusCode == 200) {
      List<Game> games = (json.decode(response.body) as List)
          .map((i) => Game.fromJson(i))
          .toList();

      return games;
    } else {
      print(response.body);
      throw Exception('Failed to load games');
    }
  }

  ///fetchNewsPosts() calls the backend to get all the posts from the database and returns a list of news posts.
  Future<List<NewsPost>> fetchNewsPosts() async {
    var user_email = "";
    var link = "";
    if (FirebaseAuth.instance.currentUser != null) {
      user_email = FirebaseAuth.instance.currentUser!.email.toString();
      link = serverDomain + "users/getNews/" + user_email;
    } else {
      print("went into getGeneralNews");
      link = serverDomain + "users/getGeneralNews"; //no user is logged in
    }
    final response = await http.get(Uri.parse(link));
    if (response.statusCode == 200) {
      List<NewsPost> posts = (json.decode(response.body) as List)
          .map((i) => NewsPost.fromJson(i))
          .toList();
      //print all posts and attributes in the list of NewsPosts
      for (int i = 0; i < posts.length; i++) {
        print(posts[i].title);
        print(posts[i].url);
        print(posts[i].image);
        print("\n");
      }

      return posts;
    } else {
      print(response.body);
      throw Exception('Failed to get news posts');
    }
  }
}
