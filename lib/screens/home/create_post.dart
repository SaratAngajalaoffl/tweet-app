import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tweet/screens/home/carousel_with_indicator.dart';
import 'package:tweet/services/firebase/firebase_auth.dart';
import 'package:tweet/services/model/model_service.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({Key? key}) : super(key: key);

  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  String title = "";
  String body = "";

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

  void _handleCreate() async {
    double response = await getDetection(title: title, description: body);

    print("Response is $response");
  }

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
      resizeToAvoidBottomInset: false,
      body: Padding(
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
