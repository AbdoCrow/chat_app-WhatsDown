import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:chat_app/core/error/failure.dart';
import 'package:chat_app/feature/auth/domain/repositories/auth_repository.dart';
import 'package:chat_app/feature/auth/domain/entities/user_entity.dart';

/// Mock implementation of AuthRepository that doesn't connect to any backend.
/// Used for testing and development purposes.
@Named('mock')
@LazySingleton(as: AuthRepository)
class AuthRepositoryMock implements AuthRepository {
  @override
  Future<Either<Failure, UserEntity>> login({
    required String email,
    required String password,
  }) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));

    // Simple validation for mock
    if (email.isEmpty || password.isEmpty) {
      return Left(ServerFailure('Email and password are required'));
    }

    // Return a mock user
    return Right(
      UserEntity(
        id: 'mock-user-id-123',
        email: email,
        username: email.split('@').first,
        avatarUrl: null,
      ),
    );
  }

  @override
  Future<Either<Failure, UserEntity>> register({
    required String email,
    required String username,
    required String password,
  }) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));

    // Simple validation for mock
    if (email.isEmpty || username.isEmpty || password.isEmpty) {
      return Left(ServerFailure('All fields are required'));
    }

    // Return a mock user
    return Right(
      UserEntity(
        id: 'mock-user-id-${DateTime.now().millisecondsSinceEpoch}',
        email: email,
        username: username,
        avatarUrl: null,
      ),
    );
  }
}
