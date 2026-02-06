import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:chat_app/core/error/failure.dart';
import 'package:chat_app/core/error/exceptions.dart';
import 'package:chat_app/feature/auth/domain/repositories/auth_repository.dart';
import 'package:chat_app/feature/auth/domain/entities/user_entity.dart';
import 'package:chat_app/feature/auth/domain/datasources/auth_remote_datasource.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource; //used for networking
  final FlutterSecureStorage _secureStorage; //used to store token
  AuthRepositoryImpl(this._remoteDataSource, this._secureStorage);

  @override
  Future<Either<Failure, UserEntity>> login({
    required String email,
    required String password,
  }) async {
    try {
      final userDto = await _remoteDataSource.login(
        email: email,
        password: password,
      );

      if (userDto.token != null) {
        await _secureStorage.write(key: 'auth_token', value: userDto.token);
      }

      return Right(userDto.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> register({
    required String email,
    required String username,
    required String password,
  }) async {
    try {
      final userDto = await _remoteDataSource.register(
        email: email,
        username: username,
        password: password,
      );
      if (userDto.token != null) {
        await _secureStorage.write(key: 'auth_token', value: userDto.token);
      }

      return Right(userDto.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
