class AppFailure implements Exception {
  final String message;

  AppFailure([this.message = 'An unknown error occurred.']);

  @override
  String toString() => 'UnkownFailure: $message';
}

class HttpFailure extends AppFailure {
  HttpFailure([super.message = 'Network error occurred.']);
}
