class BankAccount {
  // Private variables
  String _accountHolder;
  String _accountNumber;
  double _balance;

  // Constructor
  BankAccount(this._accountHolder, this._accountNumber, this._balance);

  // Getter for accountHolder
  String get accountHolder => _accountHolder;

  // Setter for accountHolder with validation
  set accountHolder(String newName) {
    if (newName.isNotEmpty && newName.length >= 3) {
      _accountHolder = newName;
    } else {
      print("Invalid account holder name.");
    }
  }

  // Getter for accountNumber (Read-only)
  String get accountNumber => _accountNumber;

  // Getter for balance (Read-only)
  double get balance => _balance;

  // Computed getter
  bool get isRich => _balance >= 100000;

  // Deposit method
  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;

      print("Deposited: $amount");
      print("New Balance: $_balance");
    } else {
      print("Invalid deposit amount.");
    }
  }

  // Withdraw method
  void withdraw(double amount) {
    if (amount <= 0) {
      print("Invalid withdraw amount.");
    } else if (amount > _balance) {
      print("Insufficient balance.");
    } else {
      _balance -= amount;

      print("Withdrawn: $amount");
      print("New Balance: $_balance");
    }
  }

  // Display method
  void display() {
    print("Account Holder: $accountHolder");
    print("Account Number: $accountNumber");
    print("Balance: $balance");
    print("Rich: $isRich");
  }
}

void main() {
  // Create BankAccount object
  BankAccount account = BankAccount(
    "Ali",
    "ACC123",
    10000.0,
  );

  // Initial information
  account.display();

  print("");

  // Deposit
  account.deposit(5000);

  print("");

  // Withdraw
  account.withdraw(3000);

  print("");

  // Insufficient balance
  account.withdraw(50000);

  print("");

  // Display after transactions
  account.display();

  print("");

  // Invalid account holder name
  account.accountHolder = "Al";

  print("");

  // Display - name should remain Ali
  account.display();

  print("");

  // Valid account holder name
  account.accountHolder = "Ahmed";

  print("");

  // Display - name should become Ahmed
  account.display();
}
