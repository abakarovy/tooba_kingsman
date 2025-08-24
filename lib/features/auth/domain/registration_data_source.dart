import '../../../core/api_service.dart';
import '../../../core/models/api_result.dart';
import 'registration_use_case.dart';
import '../../../core/models/set_password_response.dart';

class RegistrationDataSource {
  final ApiService apiService;

  RegistrationDataSource(this.apiService);

  Future<ApiResult<RegistrationResult>> register({
    required String phone,
    required String smsCode,
    required String password,
  }) async {
    // Call setPassword and map the result to RegistrationResult
    final ApiResult<SetPasswordResponse> setPasswordResult = await apiService.setPassword(phone, password);
    if (setPasswordResult.data != null) {
      return ApiResult(
        data: RegistrationResult(userId: setPasswordResult.data!.userId, message: setPasswordResult.data!.message),
        statusCode: setPasswordResult.statusCode,
      );
    } else {
      return ApiResult(
        data: null,
        statusCode: setPasswordResult.statusCode,
        error: setPasswordResult.error,
      );
    }
  }
}
