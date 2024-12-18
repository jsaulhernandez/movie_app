class ApiResponse<T> {
  final bool success;
  final T content;
  final String message;

  ApiResponse({
    required this.success,
    required this.content,
    required this.message,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse<T>(
      success: json['success'] ?? false,
      content: json['content'] as T,
      message: json['message'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'content': content,
      'message': message,
    };
  }
}
