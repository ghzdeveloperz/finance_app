enum AppEnv {
  dev,
  staging,
  prod;

  static AppEnv fromString(String value) {
    switch (value) {
      case 'prod':
        return AppEnv.prod;
      case 'staging':
        return AppEnv.staging;
      case 'dev':
      default:
        return AppEnv.dev;
    }
  }
}