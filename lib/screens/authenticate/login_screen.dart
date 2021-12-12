import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  final void Function() toggle;

  const LoginScreen({Key? key, required this.toggle}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tweet'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("Sign Up"),
          onPressed: widget.toggle,
        ),
      ),
    );
  }
}
