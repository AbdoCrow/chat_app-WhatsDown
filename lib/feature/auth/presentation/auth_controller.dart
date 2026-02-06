import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:get_it/get_it.dart';

import 'package:chat_app/feature/auth/domain/repositories/auth_repository.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  AsyncValue<void> build() => const AsyncData(null);

  Future<void> login(String email, String password) async {
    state = const AsyncLoading();

    final repository = GetIt.I<AuthRepository>();
    final result = await repository.login(email: email, password: password);

    result.fold(
      (failure) => state = AsyncError(failure.message, StackTrace.current),
      (success) => state = const AsyncData(null),
    );
  }

  Future<void> register(String email, String username, String password) async {
    state = const AsyncLoading();

    final repository = GetIt.I<AuthRepository>();
    final result = await repository.register(
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
