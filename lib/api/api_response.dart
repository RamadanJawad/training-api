class ApiResponse<T> {
  final String message;
  final bool success;
  T? object;

  ApiResponse({required this.message, required this.success, this.object});
}
