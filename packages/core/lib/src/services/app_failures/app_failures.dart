class AppFailure implements Exception {
  final String message;

  AppFailure([this.message = 'An unknown error occurred.']);

  @override
  String toString() => 'UnkownFailure: $message';
}

class AppHttpFailure extends AppFailure {
  AppHttpFailure([super.message = 'Network error occurred.']);
}
