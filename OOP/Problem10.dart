class BankAccount {
  double _balance = 0.0;
  String accountHolder = "";

  BankAccount(this.accountHolder);

  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
      print("Deposited: $amount");
    } else {
      print("Invalid deposit amount");
    }
  }

  void withdraw(double amount) {
    if (amount > 0 && amount <= _balance) {
      _balance -= amount;
      print("Withdrawn: $amount");
    } else {
      print("Invalid withdrawal");
    }
  }

  void showBalance() {
    print("Balance: $_balance");
  }
}

void main() {
  BankAccount b1 = BankAccount("Ali");
  b1.deposit(500);
  b1.showBalance();
  b1.withdraw(200);
  b1.showBalance();
  b1.withdraw(1000);
  b1.showBalance();
}
