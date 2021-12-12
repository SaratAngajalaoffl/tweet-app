import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tweet/screens/authenticate/authenticate.dart';
import 'package:tweet/screens/home/home.dart';

class WrapperWidget extends StatelessWidget {
  const WrapperWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);

    if (user == null) {
      return const AuthenticationScreen();
    } else {
      return const HomeScreen();
    }
  }
}
