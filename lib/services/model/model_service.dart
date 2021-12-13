import 'dart:io';

import 'package:tweet/helpers/dio_helpers.dart';

const _baseUrl = "http://192.168.1.8:8083";

Future<double> getDetection(
    {required String title, required String description}) async {
  Map<String, dynamic> response = await postRequest(
    data: <String, dynamic>{"data": "$title $description"},
    url: "$_baseUrl/check-bullying",
  );

  print(response);

  return response["data"]["result"] == "sexism"
      ? 0.8
      : response["data"]["result"] == "racism"
          ? 0.6
          : 0.0;
}
