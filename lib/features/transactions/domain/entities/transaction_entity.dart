class TransactionEntity {
  final String id;
  final String accountId;
  final String? categoryId;
  final double amount;
  final String description;
  final String type;
  final DateTime transactionDate;
  final DateTime? createdAt;

  const TransactionEntity({
    required this.id,
    required this.accountId,
    required this.categoryId,
    required this.amount,
    required this.description,
    required this.type,
    required this.transactionDate,
    required this.createdAt,
  });

  bool get isIncome => type == 'income';
  bool get isExpense => type == 'expense';
}
