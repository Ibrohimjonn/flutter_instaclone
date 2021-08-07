import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_instaclone/pages/SignIn_page.dart';
import 'package:flutter_instaclone/pages/SignUp_page.dart';
import 'package:flutter_instaclone/pages/home_page.dart';
import 'package:flutter_instaclone/pages/splash_page.dart';
import 'package:flutter_instaclone/services/prefs_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  Widget _startPage() {
    return StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          Prefs.saveUserId(snapshot.data.uid);
          return Splash();
        } else {
          Prefs.removeUserId();
          return SignIn();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: _startPage(),
      routes: {
        Splash.id: (context) => Splash(title: 'splash',),
        Home.id: (context) => Home(title: 'home',),
        SignIn.id: (context) => SignIn(title: 'sign_in',),
        SignUp.id: (context) => SignUp(title: 'sign_up',),
      },
    );
  }
}
