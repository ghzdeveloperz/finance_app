import 'env.dart';

class Flavor {
  final AppEnv env;
  final String appName;

  const Flavor({
    required this.env,
    required this.appName,
  });

  bool get isProd => env == AppEnv.prod;
  bool get isStaging => env == AppEnv.staging;
  bool get isDev => env == AppEnv.dev;
}