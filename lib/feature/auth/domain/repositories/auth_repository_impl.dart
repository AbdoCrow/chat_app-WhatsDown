import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:chat_app/core/error/failure.dart';
import 'package:chat_app/core/error/exceptions.dart';
import 'package:chat_app/feature/auth/domain/repositories/auth_repository.dart';
//import 'package:chat_app/feature/auth/domain/entities/user_entity.dart';
import 'package:chat_app/feature/auth/domain/datasources/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource; //used for networking
  final FlutterSecureStorage _secureStorage; //used to store token
  AuthRepositoryImpl(this._remoteDataSource, this._secureStorage);

  //all the voids here will be replaced by userEntity later
  @override
  Future<Either<Failure, void>> login({
    required String email,
    required String password,
  }) async {
    try {
      // 1. Call remote data source
      final userDto = await _remoteDataSource.login(
        email: email,
        password: password,
      );

      // 2. Store token if present
      if (userDto.token != null) {
        await _secureStorage.write(key: 'auth_token', value: userDto.token);
      }

      // 3. Return success (replace void with userDto.toEntity() later)
      return const Right(null);
    } on ServerException catch (e) {
      // 4. Handle known server errors (e.g. 401 Unauthorized)
      return Left(ServerFailure(e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      // 5. Handle network errors (e.g. No Internet)
      return Left(NetworkFailure(e.message));
    } catch (e) {
      // 6. Handle unknown errors
      return Left(ServerFailure(e.toString()));
    }
  }
}
