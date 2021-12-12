import 'package:flutter/material.dart';
import 'package:tweet/screens/authenticate/login_screen.dart';
import 'package:tweet/screens/authenticate/signup_screen.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  bool isSignUpActive = false;

  void toggleSignUpScreen() {
    setState(() {
      isSignUpActive = !isSignUpActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isSignUpActive) {
      return SignUpScreen(toggle: toggleSignUpScreen);
    } else {
      return LoginScreen(toggle: toggleSignUpScreen);
    }
  }
}
