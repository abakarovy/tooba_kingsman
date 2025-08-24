class SendSmsResponse {
  final String message;
  final String code;

  SendSmsResponse({required this.message, required this.code});

  factory SendSmsResponse.fromJson(Map<String, dynamic> json) {
    return SendSmsResponse(
      message: json['message'],
      code: json['code'],
    );
  }
}