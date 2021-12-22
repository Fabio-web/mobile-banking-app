
enum TransactionType {
  appliances, refill, purchases, food, transaction
}

extension TransactionTypeExtension on TransactionType {
  String get name {
    switch (this) {
      case TransactionType.appliances:
        return 'Appliances';
      case TransactionType.refill:
        return 'Refill';
      case TransactionType.purchases:
        return 'Purchases';
      case TransactionType.food:
        return 'Restaurant/Food';
      case TransactionType.transaction:
      default:
        return "Transaction";
    }
  }
}

class Transaction {

  final String name;
  final TransactionType type;
  final String logoUrl;
  final double amount;
  final DateTime date;

  Transaction(this.name, this.type, this.logoUrl, this.amount, this.date);

  static List<Transaction> generateTransactions() {

    return [
      Transaction("Apple", TransactionType.appliances, "assets/images/transactions/apple.png", -1897, DateTime.utc(2021, 12, 22, 17, 53)),
      Transaction("John D.", TransactionType.refill, "assets/images/transactions/friend.png", 250, DateTime.utc(2021, 12, 20, 11, 19)),
      Transaction("Mcdo", TransactionType.food, "assets/images/transactions/mcdo.png", -18.96, DateTime.utc(2021, 12, 20, 13, 42)),
    ];

  }
}