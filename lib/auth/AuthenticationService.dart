import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

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

  Future<String?> signUp(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "Signed in";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}
