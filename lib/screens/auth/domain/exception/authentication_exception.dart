class AuthenticationException implements Exception {
  const AuthenticationException([
    this.message = 'An unknown exception occurred.',
  ]);

  final String message;
}
