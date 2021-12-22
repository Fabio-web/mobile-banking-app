import 'package:mobile_banking_app/models/transaction.dart';

class Account {
  final String name;
  final double balance;
  Map<String, List<Transaction>> transactions;

  Account(this.name, this.balance, this.transactions);

  static Account generateAccount() {
    return Account("Fabio M.", 2707.42,
        {"Transactions": Transaction.generateTransactions(), "Deposits": []});
  }
}
