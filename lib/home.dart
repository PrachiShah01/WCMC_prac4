import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'main.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      image: Image.asset(
        'assets/splashps.png',
      ),
      photoSize: 250,
      seconds: 3,
      loaderColor: Colors.blue,
      navigateAfterSeconds: MyHomePage(),
    );
  }
}

class second extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Text(
          'Login Successful',
          style: TextStyle(
              fontWeight: FontWeight.w900, color: Colors.white, fontSize: 30),
        ),
      ),
    );
  }
}

class third extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Text(
          'Your account is disabled',
          style: TextStyle(
              fontWeight: FontWeight.w900, color: Colors.white, fontSize: 30),
        ),
      ),
    );
  }
}
