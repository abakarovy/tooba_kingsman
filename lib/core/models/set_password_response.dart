class SetPasswordResponse {
  final String message;
  final String userId;

  SetPasswordResponse({required this.message, required this.userId});

  factory SetPasswordResponse.fromJson(Map<String, dynamic> json) {
    return SetPasswordResponse(
      message: json['message'],
      userId: json['user_id']
    );
  }
}