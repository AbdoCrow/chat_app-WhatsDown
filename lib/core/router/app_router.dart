import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:chat_app/core/router/route_names.dart';
import 'package:chat_app/core/router/route_paths.dart';
import 'package:chat_app/feature/auth/presentation/screens/welcome_screen.dart';
import 'package:chat_app/feature/auth/presentation/screens/login_screen.dart';
import 'package:chat_app/feature/auth/presentation/screens/register_screen.dart';
import 'package:chat_app/feature/chat/presentation/screens/home_screen.dart';
import 'package:chat_app/feature/chat/presentation/screens/chat_room_screen.dart';
import 'package:chat_app/feature/settings/presentation/screens/settings_screen.dart';
import 'package:chat_app/feature/profile/presentation/screens/my_profile_screen.dart';

/// Riverpod provider for GoRouter
final appRouterProvider = Provider<GoRouter>((ref) {
  return AppRouter.router;
});

/// Extra data class for ChatRoom navigation
class ChatRoomExtra {
  final String? imageUrl;
  final bool isGroup;

  const ChatRoomExtra({this.imageUrl, this.isGroup = false});
}

/// Main application router configuration
class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: RoutePaths.welcome,
    debugLogDiagnostics: true,
    routes: _routes,
  );

  static final List<RouteBase> _routes = [
    // Welcome Screen
    GoRoute(
      path: RoutePaths.welcome,
      name: RouteNames.welcome,
      builder: (context, state) => const WelcomeScreen(),
    ),

    // Login Screen
    GoRoute(
      path: RoutePaths.login,
      name: RouteNames.login,
      builder: (context, state) => const LoginScreen(),
    ),

    // Register Screen
    GoRoute(
      path: RoutePaths.register,
      name: RouteNames.register,
      builder: (context, state) => const RegisterScreen(),
    ),

    // Home Screen (Main app shell with tabs)
    GoRoute(
      path: RoutePaths.home,
      name: RouteNames.home,
      builder: (context, state) => const HomeScreen(),
    ),

    // Chat Room Screen (with parameters)
    GoRoute(
      path: RoutePaths.chatRoom,
      name: RouteNames.chatRoom,
      builder: (context, state) {
        final name =
            state.pathParameters['name'] ??
            'Unknown'; //fall back for safety if no name the unknown
        final extra = state.extra as ChatRoomExtra?; //a nullable object
        return ChatRoomScreen(
          name: Uri.decodeComponent(
            name,
          ), //decoding for retaining spaces and emojis for the user to see
          imageUrl: extra?.imageUrl,
          isGroup: extra?.isGroup ?? false,
        );
      },
    ),

    // Settings Screen
    GoRoute(
      path: RoutePaths.settings,
      name: RouteNames.settings,
      builder: (context, state) => const SettingsScreen(),
    ),

    // Profile Screen
    GoRoute(
      path: RoutePaths.profile,
      name: RouteNames.profile,
      builder: (context, state) => const MyProfileScreen(),
    ),
  ];
}

/// Navigation extension for easier access
extension AppRouterExtension on BuildContext {
  /// Navigate to welcome screen (replaces entire stack)
  void goToWelcome() => GoRouter.of(this).go(RoutePaths.welcome);

  /// Navigate to login screen (replaces entire stack)
  void goToLogin() => GoRouter.of(this).go(RoutePaths.login);

  /// Navigate to register screen (replaces entire stack)
  void goToRegister() => GoRouter.of(this).go(RoutePaths.register);

  /// Navigate to home screen (replaces entire stack)
  void goToHome() => GoRouter.of(this).go(RoutePaths.home);

  /// Push chat room screen onto stack
  void goToChatRoom({
    required String name,
    String? imageUrl,
    bool isGroup = false,
  }) {
    GoRouter.of(this).pushNamed(
      RouteNames.chatRoom,
      pathParameters: {'name': Uri.encodeComponent(name)},
      extra: ChatRoomExtra(imageUrl: imageUrl, isGroup: isGroup),
    );
  }

  /// Push settings screen onto stack
  void goToSettings() => GoRouter.of(this).push(RoutePaths.settings);

  /// Push profile screen onto stack
  void goToProfile() => GoRouter.of(this).push(RoutePaths.profile);
}
