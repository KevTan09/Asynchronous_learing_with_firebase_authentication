import 'main_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatefulWidget{
  static const String id = 'register_screen';

  RegisterScreen({Key key}): super(key : key);

  _RegisterState createState() =>  _RegisterState();
}

class _RegisterState extends State<RegisterScreen> {
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Register',
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
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
                      Navigator.pop(context);
                    },
                    child: Text('Back'),
                  ),
                  RaisedButton(
                    onPressed: () async {
                      try {
                        final newUser =
                        await _auth.createUserWithEmailAndPassword(
                            email: usernameInput, password: passwordInput);
                        if (newUser != null) {
                          Navigator.popAndPushNamed(context, MainScreen.id);
                        }
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: Text('Sign Up'),
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