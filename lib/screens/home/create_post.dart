import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:tweet/services/firebase/firebase_auth.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({Key? key}) : super(key: key);

  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuthService();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Create Post'),
          actions: [
            IconButton(
              onPressed: _auth.signOut,
              icon: const Icon(EvaIcons.logOut),
            )
          ],
        ),
        body: Column());
  }
}
