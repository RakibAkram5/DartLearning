class BankAccount {
  double _balance;

  BankAccount(this._balance);

  double deposit(double amount) {
    _balance += amount;
    return _balance;
  }

  double withdraw(double amount) {
    if (amount <= _balance) {
      _balance -= amount;
      return _balance;
    } else {
      print("Insufficient balance.");
      return _balance;
    }
  }

  void setBalance(double balance) {
    _balance = balance;
  }

  double get balance => _balance;

  void display() {
    print("Balance: $_balance");
  }
}