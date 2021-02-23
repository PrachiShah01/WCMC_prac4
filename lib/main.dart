import 'package:flutter/material.dart';
import 'home.dart';
import 'dart:io';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: home(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  Color bgcolor;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormState> fkey = GlobalKey<FormState>();
  Color bgcolor;
  bool _enabled = true;
  int counter = 3;
  String email, password;

  void enableButton() {
    final formstate = fkey.currentState;
    if (formstate.validate()) {
      formstate.save();
    }

    if (email != 'prachi@gmail.com' || password != 'prachi') {
      setState(() {
        counter--;
      });
    } else {
      setState(() {
        _enabled = true;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => second(),
          ),
        );
      });
    }
    if (counter == 0) {
      setState(() {
        _enabled = false;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => third(),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: fkey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Image.asset('assets/prac4img.png'),
              ),
              SizedBox(
                height: 60,
              ),
              Text(
                'Login Screen',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 50,
                  color: Color(0xFFcf8c29),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    hintText: "Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                  ),
                  validator: (String value) {
                    if (value != 'prachi@gmail.com') {
                      return 'Enter correct mail';
                    }
                    return null;
                  },
                  onChanged: (value) => email = value,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    hintText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                  ),
                  validator: (String value) {
                    if (value != 'prachi') {
                      return 'Enter correct password';
                    }
                    return null;
                  },
                  onChanged: (value) => password = value,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: RaisedButton(
                  padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                  onPressed: _enabled ? enableButton : null,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: Color(0xFFcf8c29),
                  child: Text(
                    'Login',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: RaisedButton(
                  padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                  onPressed: () => exit(0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: Color(0xFFcf8c29),
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
