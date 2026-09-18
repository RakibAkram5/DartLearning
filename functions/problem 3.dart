class BankAccount {
  String accountHolder;
  int accountNumber;
  double balance;

  BankAccount(this.accountHolder, this.accountNumber, this.balance);

  void deposit(double amount) {
    balance += amount;
    print("Deposited: $amount");
  }

  void withdraw(double amount) {
    if (amount <= balance) {
      balance -= amount;
      print("Withdrawn: $amount");
    } else {
      print("Insufficient Balance");
    }
  }

  void displayBalance() {
    print("Account Holder: $accountHolder");
    print("Account Number: $accountNumber");
    print("Balance: $balance");
  }
}

void main() {
  BankAccount account1 = BankAccount("Rakib", 12345, 50000);

  account1.displayBalance();

  account1.deposit(10000);

  account1.withdraw(20000);

  account1.displayBalance();
}
