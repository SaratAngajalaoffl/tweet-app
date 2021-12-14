import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tweet/helpers/dio_helpers.dart';
import 'package:tweet/models/post_model.dart';
import 'package:tweet/models/user_model.dart';

const _baseUrl = "http://192.168.73.117:8081";

const _storage = FlutterSecureStorage();

Future<UserModel?> getUser() async {
  await Future.delayed(const Duration(seconds: 5));

  String? accessToken = await _storage.read(key: 'accessToken');

  print("access token is $accessToken");

  if (accessToken == null) {
    throw Error();
  }

  Map<String, dynamic> response = await postRequest(
    data: <String, dynamic>{},
    url: "$_baseUrl/users/get-user",
    accessToken: accessToken,
  );

  if (response["data"]["data"] == null) return null;

  print(response["data"]["data"]);

  return UserModel(
    authId: response["data"]["data"]["authId"],
    id: response["data"]["data"]["_id"],
    picture: response["data"]["data"]["picture"],
    username: response["data"]["data"]["username"],
  );
}

Future<UserModel> initiateUser({required username, required picture}) async {
  String? accessToken = await _storage.read(key: 'accessToken');
  String? authId = await _storage.read(key: 'authId');

  if (accessToken == null || authId == null) {
    throw Error();
  }

  Map<String, dynamic> response = await postRequest(
    data: <String, dynamic>{
      "authId": authId,
      "username": username,
      "picture": picture
    },
    url: "$_baseUrl/users/initiate-user",
    accessToken: accessToken,
  );

  return UserModel(
    authId: response["data"]["data"]["authId"],
    id: response["data"]["data"]["_id"],
    picture: response["data"]["data"]["picture"],
    username: response["data"]["data"]["username"],
  );
}

Future<void> createPost({
  required pictures,
  required title,
  required body,
  required userId,
  required rating,
}) async {
  String? accessToken = await _storage.read(key: 'accessToken');
  String? authId = await _storage.read(key: 'authId');

  if (accessToken == null || authId == null) {
    throw Error();
  }

  await postRequest(
    data: <String, dynamic>{
      "pictures": authId,
      "title": title,
      "body": body,
      "owner": userId,
      "bullyRating": rating
    },
    url: "$_baseUrl/posts/create-post",
    accessToken: accessToken,
  );
}

Future<List<PostModel>> getPosts() async {
  String? accessToken = await _storage.read(key: 'accessToken');
  String? authId = await _storage.read(key: 'authId');

  if (accessToken == null || authId == null) {
    throw Error();
  }

  Map<String, dynamic> response = await getRequest(
      url: "$_baseUrl/posts/get-posts", accessToken: accessToken);

  print(response["data"]["data"]);

  return response["data"]["data"]
      .map<PostModel>(
        (post) => PostModel(
            body: post["body"],
            id: post["_id"],
            pictures: post["pictures"].map<String>((i) => i as String).toList(),
            title: post["title"],
            userDetails: post["owner"]),
      )
      .toList();
}
