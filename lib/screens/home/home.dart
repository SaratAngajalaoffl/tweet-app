import 'package:flutter/material.dart';
import 'package:tweet/services/firebase/firebase_auth.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuthService();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Tweet"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            try {
              await _auth.signOut();
            } catch (e) {
              print(e);
            }
          },
          child: const Text("Log Out"),
        ),
      ),
    );
  }
}
