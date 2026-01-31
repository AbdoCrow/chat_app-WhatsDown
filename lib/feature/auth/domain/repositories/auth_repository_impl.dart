import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:chat_app/core/error/failure.dart';
import 'package:chat_app/feature/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<Either<Failure, void>> login({
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(milliseconds: 400));
    if (email.isEmpty || password.isEmpty) {
      return left(const Failure('Email and password are required'));
    }
    return right(null);
  }
}
