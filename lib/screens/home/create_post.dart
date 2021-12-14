import 'dart:io';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tweet/models/user_model.dart';
import 'package:tweet/screens/home/carousel_with_indicator.dart';
import 'package:tweet/services/brain/brain_service.dart';
import 'package:tweet/services/firebase/firebase_auth.dart';
import 'package:tweet/services/model/model_service.dart';
import 'package:tweet/services/storage/storage_service.dart';
import 'package:tweet/widgets/loading_widget.dart';

class CreatePostScreen extends StatefulWidget {
  final UserModel? user;
  const CreatePostScreen({Key? key, required this.user}) : super(key: key);

  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  String title = "";
  String body = "";
  bool loading = false;

  final ImagePicker _picker = ImagePicker();
  List<XFile> selectedImages = [];

  void _handlePickImage() async {
    final List<XFile>? images = await _picker.pickMultiImage();
    if (images != null) {
      setState(() {
        selectedImages = images;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuthService();

    void _handleCreate() async {
      setState(() {
        loading = true;
      });

      // double rating = await getDetection(title: title, description: body);
      double rating = 0.0;

      List<String> pictures = await uploadFiles(
        pictures: selectedImages.map<File>((i) => File(i.path)).toList(),
      );

      print("Pictures are $pictures");

      await createPost(
        pictures: pictures,
        title: title,
        body: body,
        userId: widget.user?.id,
        rating: rating,
      );

      setState(() {
        loading = false;
      });

      Navigator.pop(context);
    }

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
      resizeToAvoidBottomInset: false,
      body: loading
          ? Column(
              children: const <Widget>[
                LoadingIndicator(
                  color: Colors.blue,
                ),
              ],
            )
          : Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  selectedImages.isNotEmpty
                      ? MaterialButton(
                          onLongPress: _handlePickImage,
                          onPressed: _handlePickImage,
                          child: CarouselWithIndicatorDemo(
                            imageSliders: selectedImages,
                          ),
                        )
                      : SizedBox(
                          height: 200,
                          child: MaterialButton(
                            onPressed: _handlePickImage,
                            child: const Text('Add Images'),
                          ),
                        ),
                  const SizedBox(height: 20.0),
                  TextField(
                    decoration: const InputDecoration(
                      label: Text('Enter Title'),
                    ),
                    onChanged: (text) {
                      setState(() {
                        title = text;
                      });
                    },
                  ),
                  const SizedBox(height: 20.0),
                  TextField(
                    maxLines: 20,
                    minLines: 5,
                    decoration: const InputDecoration(
                      label: Text('Enter Description'),
                    ),
                    onChanged: (text) {
                      setState(() {
                        body = text;
                      });
                    },
                  ),
                  Expanded(child: Container()),
                  GestureDetector(
                    onTap: _handleCreate,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: SizedBox(
                        height: 40.0,
                        child: Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/images/bg.jpg'),
                            ),
                          ),
                          child: const Center(
                              child: Text(
                            "Save",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                          )),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
