import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:get_it/get_it.dart';

import 'package:chat_app/core/constants/app_config.dart';
import 'package:chat_app/feature/auth/domain/repositories/auth_repository.dart';
import 'package:chat_app/feature/auth/domain/repositories/auth_repository_mock.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  late final AuthRepository _repository;

  @override
  AsyncValue<void> build() {
    // Toggle between mock and real authentication
    _repository = AppConfig.useMockAuth
        ? AuthRepositoryMock()
        : GetIt.I<AuthRepository>();
    return const AsyncData(null);
  }

  Future<void> login(String email, String password) async {
    state = const AsyncLoading();

    final result = await _repository.login(email: email, password: password);

    result.fold(
      (failure) => state = AsyncError(failure.message, StackTrace.current),
      (success) => state = const AsyncData(null),
    );
  }

  Future<void> register(String email, String username, String password) async {
    state = const AsyncLoading();

    final result = await _repository.register(
      email: email,
      username: username,
      password: password,
    );

    result.fold(
      (failure) => state = AsyncError(failure.message, StackTrace.current),
      (success) => state = const AsyncData(null),
    );
  }
}
