class CrashReporter {
  const CrashReporter();

  Future<void> recordError(
    Object error,
    StackTrace stackTrace,
  ) async {}
}