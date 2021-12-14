import 'package:tweet/models/user_model.dart';

class PostModel {
  List<String> pictures;
  String title;
  String body;
  String id;
  late UserModel owner;

  PostModel({
    required this.pictures,
    required this.title,
    required this.body,
    required this.id,
    required userDetails,
  }) {
    owner = UserModel(
        authId: userDetails["authId"],
        username: userDetails["username"],
        picture: userDetails["picture"],
        id: userDetails["_id"]);
  }
}
