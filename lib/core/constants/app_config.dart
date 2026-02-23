class AppConfig {
  AppConfig._();

  /// Set to `true` to use mock authentication (no backend required).
  /// Set to `false` to use real backend authentication.
  static const bool useMockAuth = true;

  /// Set to `true` to use mock chat data (no backend required).
  /// Set to `false` to use real backend chat data.
  static const bool useMockChat = true;
}
