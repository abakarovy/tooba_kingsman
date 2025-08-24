import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kingsman_mobileapp/core/models/api_result.dart';
import 'package:kingsman_mobileapp/core/models/send_sms_response.dart';
import 'package:kingsman_mobileapp/core/models/set_password_response.dart';
import 'package:kingsman_mobileapp/core/models/verify_sms_response.dart';

class ApiService {
  final String _baseUrl = 'http://0.0.0.0:8000';

  Future<ApiResult<SendSmsResponse>> sendSms(String phone) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/api/send-sms'),
      body: jsonEncode({
        'phone': phone,
      }),
      headers: {'Content-Type': 'application/json'}
    );

    ApiResult<SendSmsResponse> resp =  ApiResult.fromResponse(SendSmsResponse.fromJson, response);
    return resp;
  }

  Future<ApiResult<VerifySmsResponse>> verifySms(String phone, String code) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/api/verify-sms'),
      body: jsonEncode({
        'phone': phone,
        'code': code,
      }),
      headers: {'Content-Type': 'application/json'}
    );

    ApiResult<VerifySmsResponse> resp =  ApiResult.fromResponse(VerifySmsResponse.fromJson, response);
    return resp;
  }

  Future<ApiResult<SetPasswordResponse>> setPassword(String userId, String password) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/api/set-password'),
      body: jsonEncode({
        'user_id': userId,
        'password': password,
      }),
      headers: {'Content-Type': 'application/json'}
    );

    ApiResult<SetPasswordResponse> result = ApiResult.fromResponse(SetPasswordResponse.fromJson, response);
    return result;
  }

  Future<http.Response> login(String phone, String password) {
    return http.post(
      Uri.parse('$_baseUrl/api/login'),
      body: jsonEncode({'phone': phone, 'password': password}),
      headers: {'Content-Type': 'application/json'},
    );
  }

  Future<http.Response> getUserCard(String userId, String token) {
    return http.get(
      Uri.parse('$_baseUrl/api/user/$userId/card'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
  }

  Future<http.Response> registerFirebaseToken(String userId, String token, String firebaseToken) {
    return http.post(
      Uri.parse('$_baseUrl/api/register-firebase-token'),
      body: jsonEncode({'userId': userId, 'firebaseToken': firebaseToken}),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
  }

  Future<http.Response> getNotificationStatus(String userId, String token) {
    return http.get(
      Uri.parse('$_baseUrl/api/notification-status?userId=$userId'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
  }

  Future<http.Response> sendNotification(String userId, String token, String message) {
    return http.post(
      Uri.parse('$_baseUrl/api/send-notification'),
      body: jsonEncode({'userId': userId, 'message': message}),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
  }
}