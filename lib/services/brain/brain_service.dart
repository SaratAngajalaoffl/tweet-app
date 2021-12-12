import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const _baseUrl = "http://192.168.1.8:8081";

const _storage = FlutterSecureStorage();

Future<String> uploadFiles() async {
  String? accessToken = await _storage.read(key: 'accessToken');

  if (accessToken == null) {
    throw Error();
  }

  return "";
}
