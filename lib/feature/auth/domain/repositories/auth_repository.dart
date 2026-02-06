import 'package:dartz/dartz.dart';
import 'package:chat_app/core/error/failure.dart';
import 'package:chat_app/feature/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, UserEntity>> register({
    required String email,
    required String username,
    required String password,
  });
}
