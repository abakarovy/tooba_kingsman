import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiResult<T> {
  final T? data;
  final int statusCode;
  final String? error;

  ApiResult({this.data, required this.statusCode, this.error});

  factory ApiResult.fromResponse(T Function(Map<String, dynamic>) fromJson, http.Response response) {
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return ApiResult(
        data: fromJson(jsonData),
        statusCode: response.statusCode
      );
    } else {
      return ApiResult(
        data: null,
        statusCode: response.statusCode,
        error: response.body
      );
    }
  }
}