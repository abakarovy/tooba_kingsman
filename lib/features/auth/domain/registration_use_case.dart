import '../../../core/models/api_result.dart';
import 'registration_data_source.dart';

class RegistrationUseCase {
  final RegistrationDataSource dataSource;

  RegistrationUseCase(this.dataSource);

  Future<ApiResult<RegistrationResult>> register({
    required String phone,
    required String smsCode,
    required String password,
  }) async {
    return await dataSource.register(phone: phone, smsCode: smsCode, password: password);
  }
}

class RegistrationResult {
  final String userId;
  final String? message;

  RegistrationResult({required this.userId, this.message});

  factory RegistrationResult.fromJson(Map<String, dynamic> json) {
    return RegistrationResult(
      userId: json['user_id'] ?? '',
      message: json['message'],
    );
  }
}
