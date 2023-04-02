class ErrorMessageModel {
  final int status_code;
  final String status_message;
  final bool success;

  const ErrorMessageModel({
    required this.status_code,
    required this.status_message,
    required this.success,
  });

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return ErrorMessageModel(
      status_code: json["status_code"],
      status_message: json["status_message"],
      success: json["success"],
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ErrorMessageModel &&
          runtimeType == other.runtimeType &&
          status_code == other.status_code &&
          status_message == other.status_message &&
          success == other.success;

  @override
  int get hashCode =>
      status_code.hashCode ^ status_message.hashCode ^ success.hashCode;
}
