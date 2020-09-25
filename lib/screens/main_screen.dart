import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MainScreen extends StatefulWidget{
  static const String id = 'main_screen';

  MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>{
  final _auth = FirebaseAuth.instance;
  User loggedInUser;

  void getCurrentUser() {
    final user = _auth.currentUser;
    if (user != null) {
      loggedInUser = user;
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Logged In'),
                RaisedButton(
                  child: Text('Log Out'),
                  onPressed: () {
                    _auth.signOut();
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          )),
    );
  }

}