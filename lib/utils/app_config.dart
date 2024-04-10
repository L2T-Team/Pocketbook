/// Environment of the app
class AppEnvironment {
  AppEnvironment._({
    required this.apiBaseUrl,
  });

  String? apiBaseUrl;

  factory AppEnvironment.live({
    required String apiBaseUrl,
  }) {
    return AppEnvironment._(
      apiBaseUrl: apiBaseUrl,
    );
  }
}
