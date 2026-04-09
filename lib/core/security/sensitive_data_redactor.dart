class SensitiveDataRedactor {
  const SensitiveDataRedactor._();

  static String redactEmail(String email) {
    if (email.isEmpty || !email.contains('@')) return '***';
    final parts = email.split('@');
    final name = parts.first;
    final domain = parts.last;

    if (name.length <= 2) {
      return '**@$domain';
    }

    final visible = name.substring(0, 2);
    return '$visible***@$domain';
  }
}