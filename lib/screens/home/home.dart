import 'dart:io';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tweet/models/user_model.dart';
import 'package:tweet/screens/home/create_post.dart';
import 'package:tweet/screens/home/dashboard.dart';
import 'package:tweet/screens/home/user_detail.dart';
import 'package:tweet/services/brain/brain_service.dart';
import 'package:tweet/services/firebase/firebase_auth.dart';
import 'package:tweet/services/storage/storage_service.dart';
import 'package:tweet/widgets/loading_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool loading = true;
  UserModel? user;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _getUserData();
    });
  }

  void _getUserData() async {
    setState(() {
      loading = true;
    });

    UserModel? userData = await getUser();

    setState(() {
      user = userData;
      loading = false;
    });
  }

  void handleSave(String username, XFile? image) async {
    setState(() {
      loading = true;
    });

    List<XFile> xfileImages = image != null ? <XFile>[image] : <XFile>[];

    if (xfileImages.isEmpty) {
      throw Error();
    }

    List<File> images = xfileImages.map((f) => File(f.path)).toList();

    List<String> pictures = await uploadFiles(pictures: images);

    UserModel userData = await initiateUser(
      picture: pictures[0],
      username: username,
    );

    setState(() {
      user = userData;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuthService();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tweet'),
        actions: [
          IconButton(
            onPressed: _auth.signOut,
            icon: const Icon(EvaIcons.logOut),
          ),
          IconButton(
            icon: user?.picture != null
                ? CircleAvatar(
                    backgroundImage: Image.network(
                      user?.picture ?? "",
                      fit: BoxFit.fill,
                    ).image,
                  )
                : const Icon(EvaIcons.person),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/images/bg.jpg'),
          ),
        ),
        child: loading
            ? const LoadingIndicator()
            : user == null
                ? UserDetails(
                    handleSave: handleSave,
                  )
                : const DashboardScreen(),
      ),
      floatingActionButton: user != null
          ? FloatingActionButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (_) => CreatePostScreen(
                            user: user,
                          )),
                );
              },
              child: const Icon(EvaIcons.plus),
            )
          : null,
    );
  }
}
