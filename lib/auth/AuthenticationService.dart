import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static final String spotaIP = "http://137.184.0.205";
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

  Future<String?> signUp(
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

        var url = Uri.parse("http://137.184.0.205:8080/users/signUp");
        Map data = {
          'email': email,
          'username': username,
        };
        FirebaseAuth.instance.currentUser?.updateDisplayName(
            username); //adds users username to their account
        var body = json.encode(data);
        var response = await http.post(url,
            headers: {"content-type": "application/json"}, body: body);
        //print('Response body: ${response.body} , ${response.statusCode}');
        return null;
      } on FirebaseAuthException catch (e) {
        return e.message;
      }
    }
  }

  Future<String?> signUpNew(
      {required String email, required String username}) async {
    try {
      var url = Uri.parse("http://137.184.0.205:8080/users/signUp");
      Map data = {
        'email': email,
        'username': username,
      };
      FirebaseAuth.instance.currentUser
          ?.updateDisplayName(username); //adds users username to their account
      var body = json.encode(data);
      var response = await http.post(url,
          headers: {"content-type": "application/json"}, body: body);
      //print('Response body: ${response.body} , ${response.statusCode}');
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
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
}
