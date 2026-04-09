import 'env.dart';
import 'flavor.dart';

class AppConfig {
  static final Flavor current = Flavor(
    env: AppEnv.fromString(
      const String.fromEnvironment('APP_ENV', defaultValue: 'dev'),
    ),
    appName: const String.fromEnvironment(
      'APP_NAME',
      defaultValue: 'Finance App',
    ),
  );
}