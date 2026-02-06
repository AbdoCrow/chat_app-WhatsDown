import 'package:flutter/foundation.dart';

class ApiEndpoints {
  static String get baseUrl {
    if (kIsWeb) {
      return 'http://localhost:8081'; // For Chrome
    }
    return 'http://192.168.1.9:8081';
  }

  static const String login = '/api/auth/login';
  static const String register = '/api/auth/register';
}
