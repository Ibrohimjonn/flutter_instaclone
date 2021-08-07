import 'dart:async';
import 'package:flutter/material.dart';
import 'home_page.dart';


class Splash extends StatefulWidget {
  const Splash({Key key,this.title}) : super(key: key);

  static final String id = 'splash';

  final String title;
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  _initTimer(){
    Timer(Duration(seconds: 2),(){
      _callHome();
    });
  }

  _callHome(){
    Navigator.pushReplacementNamed(context, Home.id);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Center(
                child: Text(
                  "Instagram",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 45,
                    fontFamily: 'Billabong',
                  ),
                ),
              ),
            ),
            Text(
              'All rights reserved',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
