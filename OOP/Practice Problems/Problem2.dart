class BankAccount {
  String accountHolder;
  String accountNumber;
  double balance;

  BankAccount(
    this.accountHolder,
    this.accountNumber,
    this.balance,
  );

  void deposit(double amount) {
    print("Deposited: $amount");

    balance += amount;

    print("New Balance: $balance");
  }

  void showBalance() {
    print("Account Holder: $accountHolder");
    print("Account Number: $accountNumber");
    print("Balance: $balance");
  }
}

void main() {
  BankAccount b = BankAccount(
    "Ali",
    "ACC12345",
    5000.0,
  );

  b.showBalance();

  print("\n--- Deposit ---");

  b.deposit(2000.0);
}