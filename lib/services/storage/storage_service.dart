import 'dart:io';

import 'package:tweet/helpers/dio_helpers.dart';

const _baseUrl = "http://192.168.73.117:8082";

Future<List<String>> uploadFiles({required List<File> pictures}) async {
  Map<String, dynamic> response = await postRequestwithFormData(
    data: <String, dynamic>{},
    url: "$_baseUrl/upload-images",
    files: pictures,
  );

  print(response["data"]);

  return response["data"]["data"].map<String>((i) => i as String).toList() ??
      <String>[];
}
