import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserDetails extends StatefulWidget {
  final void Function(String username, XFile? image) handleSave;

  const UserDetails({Key? key, required this.handleSave}) : super(key: key);

  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  String username = "";

  final ImagePicker _picker = ImagePicker();
  XFile? selectedImage;

  void _handlePickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      selectedImage = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Enter Details",
                  style: Theme.of(context).textTheme.headline4,
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 200,
                      width: 200,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100.0),
                        child: GestureDetector(
                          onTap: _handlePickImage,
                          child: selectedImage != null
                              ? Image.file(
                                  File(selectedImage?.path ?? ""),
                                  fit: BoxFit.fill,
                                )
                              : const Expanded(
                                  child: Center(
                                    child: Text("Add Image"),
                                  ),
                                ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20.0),
                TextField(
                  decoration: const InputDecoration(
                    label: Text("Enter Username"),
                  ),
                  onChanged: (text) {
                    setState(() {
                      username = text;
                    });
                  },
                ),
                Expanded(child: Container()),
                GestureDetector(
                  onTap: () => widget.handleSave(username, selectedImage),
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
          )),
    ));
  }
}
