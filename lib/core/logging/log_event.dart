class LogEvent {
  final String message;
  final String level;
  final DateTime createdAt;

  const LogEvent({
    required this.message,
    required this.level,
    required this.createdAt,
  });
}