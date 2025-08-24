class VerifySmsResponse {
  final String message;
  final String tempToken;

  VerifySmsResponse({required this.message, required this.tempToken});

  factory VerifySmsResponse.fromJson(Map<String, dynamic> json) {
    return VerifySmsResponse(
      message: json['message'],
      tempToken: json['tempToken'],
    );
  }
}