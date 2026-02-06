import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:chat_app/core/constants/api_endpoints.dart';

@module
abstract class RegisterModule {
  //Register Dio (The HTTP Client)
  @lazySingleton
  Dio get dio {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    //to see API calls in the console
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

    return dio;
  }

  //register Secure Storage (For saving Tokens)
  @lazySingleton
  FlutterSecureStorage get secureStorage => const FlutterSecureStorage();
}
