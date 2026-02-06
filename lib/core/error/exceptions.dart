/// Base exception class for the application
class AppException implements Exception {
  final String message;
  final int? statusCode;

  const AppException(this.message, {this.statusCode});

  @override
  String toString() => message;
}

/// Exception thrown when a server error occurs (API errors)
class ServerException extends AppException {
  const ServerException(super.message, {super.statusCode});

  factory ServerException.fromStatusCode(int statusCode, [String? message]) {
    switch (statusCode) {
      case 400:
        return ServerException(message ?? 'Bad request', statusCode: 400);
      case 401:
        return ServerException(message ?? 'Unauthorized', statusCode: 401);
      case 403:
        return ServerException(message ?? 'Forbidden', statusCode: 403);
      case 404:
        return ServerException(message ?? 'Not found', statusCode: 404);
      case 500:
        return ServerException(
          message ?? 'Internal server error',
          statusCode: 500,
        );
      default:
        return ServerException(
          message ?? 'Server error occurred',
          statusCode: statusCode,
        );
    }
  }
}

/// Exception thrown when there's no internet connection
class NetworkException extends AppException {
  const NetworkException([String message = 'No internet connection'])
    : super(message);
}

/// Exception thrown when cache operations fail
class CacheException extends AppException {
  const CacheException([String message = 'Cache error occurred'])
    : super(message);
}

/// Exception thrown for authentication-related errors
class AuthException extends AppException {
  const AuthException(super.message, {super.statusCode});
}

/// Exception thrown when input validation fails
class ValidationException extends AppException {
  final Map<String, String>? fieldErrors;

  const ValidationException(super.message, {this.fieldErrors});
}
