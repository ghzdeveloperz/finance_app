class FinancialAccountDto {
  final String id;
  final String name;
  final double balance;

  const FinancialAccountDto({
    required this.id,
    required this.name,
    required this.balance,
  });

  factory FinancialAccountDto.fromMap(Map<String, dynamic> map) {
    return FinancialAccountDto(
      id: map['id'],
      name: map['name'],
      balance: (map['balance'] as num).toDouble(),
    );
  }
}