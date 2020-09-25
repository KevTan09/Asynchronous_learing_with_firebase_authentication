import 'register_screen.dart';
import 'main_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class WelcomeScreen extends StatefulWidget{
  static const String id = 'welcome_screen';

  WelcomeScreen({Key key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<WelcomeScreen>{
  final _auth = FirebaseAuth.instance;
  String usernameInput;
  String passwordInput;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome Hero!',
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                onChanged: (value) {
                  usernameInput = value;
                },
                decoration: InputDecoration(
                  labelText: 'Username',
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                obscureText: true,
                onChanged: (value) {
                  passwordInput = value;
                },
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RaisedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RegisterScreen.id);
                    },
                    child: Text('Sign Up'),
                  ),
                  RaisedButton(
                    onPressed: () async {
                      final userLogIn =
                      await _auth.signInWithEmailAndPassword(
                          email: usernameInput, password: passwordInput);
                      if (userLogIn != null) {
                        Navigator.pushNamed(context, MainScreen.id);
                      }
                    },
                    child: Text('Sign In'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}