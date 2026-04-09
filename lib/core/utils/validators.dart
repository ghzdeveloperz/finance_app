class Validators {
  const Validators._();

  static String? requiredField(String? value, {String fieldName = 'Campo'}) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName é obrigatório';
    }
    return null;
  }

  static String? email(String? value) {
    final required = requiredField(value, fieldName: 'Email');
    if (required != null) return required;

    final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
    if (!emailRegex.hasMatch(value!.trim())) {
      return 'Email inválido';
    }
    return null;
  }

  static String? password(String? value) {
    final required = requiredField(value, fieldName: 'Senha');
    if (required != null) return required;

    if (value!.trim().length < 8) {
      return 'Senha deve ter pelo menos 8 caracteres';
    }
    return null;
  }
}