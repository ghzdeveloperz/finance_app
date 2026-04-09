import 'log_event.dart';

class AppLogger {
  const AppLogger();

  void info(String message) {
    final event = LogEvent(
      message: message,
      level: 'INFO',
      createdAt: DateTime.now(),
    );
    _log(event);
  }

  void error(String message) {
    final event = LogEvent(
      message: message,
      level: 'ERROR',
      createdAt: DateTime.now(),
    );
    _log(event);
  }

  void _log(LogEvent event) {
    // ignore: avoid_print
    print('[${event.level}] ${event.createdAt.toIso8601String()} ${event.message}');
  }
}