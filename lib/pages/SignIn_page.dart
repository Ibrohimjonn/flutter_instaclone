import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_instaclone/services/auth_service.dart';
import 'package:flutter_instaclone/services/prefs_service.dart';
import 'package:flutter_instaclone/services/utils_service.dart';

import 'SignUp_page.dart';
import 'home_page.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key key, this.title}) : super(key: key);

  static final String id = 'sign_in';
  final String title;
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  var isLoading = false;

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  _doSignIn(){
    String email = emailController.text.toString().trim();
    String password = passwordController.text.toString().trim();

    if(email.isEmpty || password.isEmpty) return;
    setState(() {
      isLoading = true;
    });
    AuthService.signInUser(context, email, password).then((firebaseUser) => {
      _getFirebaseUser(firebaseUser),
    });
  }
  _getFirebaseUser(FirebaseUser firebaseUser) async{
    setState(() {
      isLoading = false;
    });
    if(firebaseUser != null){
      await Prefs.saveUserId(firebaseUser.uid);
      Navigator.pushReplacementNamed(context, Home.id);
    }else{
      Utils.fireToast("Check your email or password");
    }
  }
  
  _callSignUp(){
    Navigator.pushReplacementNamed(context, SignUp.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(252, 175, 69, 1),
                Color.fromRGBO(245, 96, 64, 1),
              ],
            ),
          ),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Instagram",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 45,
                            fontFamily: 'Billabong',
                          ),
                        ),
                        SizedBox(height: 20,),

                        // #email
                        Container(
                          height: 50,
                          padding: EdgeInsets.only(left: 10,right: 10),
                          decoration: BoxDecoration(
                            color: Colors.white54.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: TextField(
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            controller: emailController,
                            decoration: InputDecoration(
                              hintText: 'Email',
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                fontSize: 17.0,
                                color: Colors.white54,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 20,),
                        // #password
                        Container(
                          height: 50,
                          padding: EdgeInsets.only(left: 10,right: 10),
                          decoration: BoxDecoration(
                            color: Colors.white54.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: TextField(
                            obscureText: true,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            controller: passwordController,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                fontSize: 17.0,
                                color: Colors.white54,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 20,),

                        // #signinbutton
                        TextButton(
                          onPressed: (){
                            _doSignIn();
                          },
                          child: Container(
                            height: 50,
                            padding: EdgeInsets.only(left: 10,right: 10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.white54.withOpacity(0.2),width: 2),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Center(
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(width: 10,),
                        TextButton(
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: _callSignUp,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20,),
                ],
              ),
              isLoading ?
              Center(
                child: CircularProgressIndicator(),
              ): SizedBox.shrink()
            ],
          ),
        ),
      ),
    );
  }
}
