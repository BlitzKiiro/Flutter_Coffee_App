import 'package:coffee_app/models/user.dart';
import 'package:coffee_app/services/db.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create custom user obj
  User _createCustomUsr(FirebaseUser usr) {
    return usr != null ? User(uid: usr.uid) : null;
  }

  //user authentication change stream
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_createCustomUsr);
  }

  // sign in anon
  Future signInAnon() async {
    try {
      AuthResult rslt = await _auth.signInAnonymously();
      FirebaseUser usr = rslt.user;
      return _createCustomUsr(usr);
    } on Exception catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in with email and password
  Future emailSignIn(String email, String password) async {
    try {
      AuthResult rslt = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser usr = rslt.user;
      return _createCustomUsr(usr);
    } on Exception catch (e) {
      print(e.toString());
      return null;
    }
  }

  // register with email and password
  Future emailRegister(String email, String password) async {
    try {
      AuthResult rslt = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      FirebaseUser usr = rslt.user;
      //create db document
      await DB_Service(uid: usr.uid).updateUserData('0', 'new user', 100);

      return _createCustomUsr(usr);
    } catch (e) {
      print(e);
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } on Exception catch (e) {
      print(e.toString());
      return null;
    }
  }
}
