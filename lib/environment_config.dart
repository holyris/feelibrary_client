class EnvironmentConfig {
  static const API_URL =
      String.fromEnvironment('API_URL', defaultValue: 'http://localhost:3000/');
}
