import 'package:dartz/dartz.dart';
import 'package:chat_app/core/error/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, void>> login({
    required String email,
    required String password,
  });
}
