import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_instaclone/pages/SignIn_page.dart';
import 'package:flutter_instaclone/services/prefs_service.dart';

class AuthService {
  static final _auth = FirebaseAuth.instance;

  static Future<FirebaseUser> signInUser(BuildContext context, String email, String password) async {
    try {
      _auth.signInWithEmailAndPassword(email: email, password: password);
      final FirebaseUser user = await _auth.currentUser();
      print(user.toString());
      return user;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  static Future<Map<String, FirebaseUser>> signUpUser(BuildContext context, String name, String email, String password) async {
    Map<String, FirebaseUser> map = new Map();
    try {
      var authResult = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser firebaseUser = authResult.user;
      map.addAll({"Succes": firebaseUser});
    } catch (error) {
      print(error);
      switch (error.code){
        case "ERROR_EMAIL_ALREADY_IN_USE":
          map.addAll({"ERROR_EMAIL_ALREADY_IN_USE": null});
          break;
        default:
          map.addAll({'ERROR': null});
      }
    }
    return map;
  }

  static void signOutUser(BuildContext context) {
    _auth.signOut();
    Prefs.removeUserId().then((value) {
      Navigator.pushReplacementNamed(context, SignIn.id);
    });
  }

}