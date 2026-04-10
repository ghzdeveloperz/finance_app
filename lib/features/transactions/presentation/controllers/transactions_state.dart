import '../../domain/entities/transaction_entity.dart';

class TransactionsState {
  final bool isLoading;
  final List<TransactionEntity> items;
  final String? errorMessage;

  const TransactionsState({
    this.isLoading = false,
    this.items = const [],
    this.errorMessage,
  });

  TransactionsState copyWith({
    bool? isLoading,
    List<TransactionEntity>? items,
    String? errorMessage,
  }) {
    return TransactionsState(
      isLoading: isLoading ?? this.isLoading,
      items: items ?? this.items,
      errorMessage: errorMessage,
    );
  }
}
