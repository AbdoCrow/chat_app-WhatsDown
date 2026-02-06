/// Base failure class for the application
/// Used with Either<Failure, Success> pattern from dartz
abstract class Failure {
  final String message;
  const Failure(this.message);

  @override
  String toString() => message;
}

/// Failure for server/API errors
class ServerFailure extends Failure {
  final int? statusCode;
  const ServerFailure(super.message, {this.statusCode});
}

/// Failure for network/connectivity errors
class NetworkFailure extends Failure {
  const NetworkFailure([super.message = 'No internet connection']);
}

/// Failure for cache/local storage errors
class CacheFailure extends Failure {
  const CacheFailure([super.message = 'Cache error occurred']);
}

/// Failure for authentication errors
class AuthFailure extends Failure {
  const AuthFailure(super.message);
}

/// Failure for validation errors
class ValidationFailure extends Failure {
  final Map<String, String>? fieldErrors;
  const ValidationFailure(super.message, {this.fieldErrors});
}
