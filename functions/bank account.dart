class Bank {
  double balance;

  Bank(this.balance);

  void deposit(double amount) {
    balance += amount;
  }

  void withdraw(double amount) {
    if (amount <= balance) {
      balance -= amount;
    } else {
      print("Insufficient balance");
    }
  }

  void showBalance() {
    print("Total Balance: $balance");
  }
}

void main() {
  Bank b1 = Bank(5000);

  b1.showBalance();

  b1.deposit(2000);
  b1.showBalance();

  b1.withdraw(1000);
  b1.showBalance();
}
