class TransactionDto {
  final String id;
  final String accountId;
  final String? categoryId;
  final double amount;
  final String description;
  final String type;
  final DateTime transactionDate;
  final DateTime? createdAt;

  const TransactionDto({
    required this.id,
    required this.accountId,
    required this.categoryId,
    required this.amount,
    required this.description,
    required this.type,
    required this.transactionDate,
    required this.createdAt,
  });

  factory TransactionDto.fromMap(Map<String, dynamic> map) {
    return TransactionDto(
      id: map['id'] as String,
      accountId: map['account_id'] as String,
      categoryId: map['category_id'] as String?,
      amount: (map['amount'] as num).toDouble(),
      description: (map['description'] as String?) ?? '',
      type: map['type'] as String,
      transactionDate: DateTime.parse(map['transaction_date'] as String),
      createdAt: map['created_at'] != null
          ? DateTime.parse(map['created_at'] as String)
          : null,
    );
  }
}
