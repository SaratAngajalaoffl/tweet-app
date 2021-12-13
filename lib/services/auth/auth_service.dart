import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tweet/helpers/dio_helpers.dart';

const _baseUrl = "http://192.168.1.8:8080";

const _storage = FlutterSecureStorage();

Future<void> registerUser({required String uid}) async {
  Map<String, dynamic> response = await postRequest(
    data: <String, dynamic>{
      "uid": uid,
    },
    url: "$_baseUrl/auth/register",
  );

  print("Access Token is ${response["data"]["data"]["accessToken"]}");

  await _storage.write(
    key: 'accessToken',
    value: response["data"]["data"]["accessToken"],
  );
}

Future<void> loginUser({required String uid}) async {
  Map<String, dynamic> response = await postRequest(
    data: <String, dynamic>{
      "uid": uid,
    },
    url: "$_baseUrl/auth/login",
  );

  print("Access Token is ${response["data"]["data"]["accessToken"]}");

  await _storage.write(
    key: 'accessToken',
    value: response["data"]["data"]["accessToken"],
  );
}

Future<void> logoutUser() async {
  await _storage.deleteAll();
}
