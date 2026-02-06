//this class will be responsible for the communication between the app and the remote server for authentication-related operations.
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:chat_app/core/constants/api_endpoints.dart';
//import 'package:chat_app/core/errors/exceptions.dart';
import 'package:chat_app/feature/auth/domain/models/user_dto.dart';

//Don't foget to change all the future void to future userDTO :<
abstract class AuthRemoteDataSource {
  Future<UserDto> login({required String email, required String password});
  Future<UserDto> register({
    required String email,
    required String username,
    required String password,
  });
}

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio _dio; //Getit will get the dio instance and add it here
  AuthRemoteDataSourceImpl(this._dio);

  //Now I need to convert the JSON (aka ME) :> to a DTO
  @override
  Future<UserDto> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        ApiEndpoints.login,
        data: {'email': email, 'password': password},
      );

      return UserDto.fromJson(response.data);
    } on DioException catch (e) {
      final message =
          e.response?.data?['message'] ?? e.message ?? 'Login failed';
      throw Exception('Failed to login: $message');
    } catch (e) {
      throw Exception('Failed to login: $e');
    }
  }

  @override
  Future<UserDto> register({
    required String email,
    required String username,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        ApiEndpoints.register,
        data: {'email': email, 'password': password, 'username': username},
      );
      return UserDto.fromJson(response.data);
    } on DioException catch (e) {
      final message =
          e.response?.data?['message'] ?? e.message ?? 'Registration failed';
      throw Exception('Failed to register: $message');
    } catch (e) {
      throw Exception('Failed to register: $e');
    }
  }
}
