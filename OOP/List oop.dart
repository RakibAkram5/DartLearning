class BankAccount {
  // Private fields (Encapsulation)
  String _accountNumber;
  String _accountHolderName;
  double _balance;
  String _accountType;

  // ---------------- Named Constructors ----------------

  BankAccount.savingsAccount(
      this._accountNumber, this._accountHolderName, this._balance)
      : _accountType = "Savings";

  BankAccount.currentAccount(
      this._accountNumber, this._accountHolderName, this._balance)
      : _accountType = "Current";

  BankAccount.zeroBalance(this._accountNumber, this._accountHolderName)
      : _balance = 0.0,
        _accountType = "Savings";

  // ---------------- Getters ----------------

  String get accountNumber => _accountNumber;
  String get accountHolderName => _accountHolderName;
  double get balance => _balance;
  String get accountType => _accountType;

  // ---------------- Setters ----------------

  set accountHolderName(String name) {
    if (name.isEmpty) {
      print("Error: Account holder name cannot be empty.");
    } else {
      _accountHolderName = name;
    }
  }

  set balance(double amount) {
    if (amount < 0) {
      print("Warning: Balance cannot be negative. Update rejected.");
    } else {
      _balance = amount;
    }
  }

  // ---------------- Other Methods ----------------

  void deposit(double amount) {
    if (amount <= 0) {
      print("Deposit amount must be positive.");
      return;
    }
    _balance += amount;
    print("Deposited: $amount | New Balance: $_balance");
  }

  void withdraw(double amount) {
    if (amount <= 0) {
      print("Withdraw amount must be positive.");
      return;
    }
    if (amount > _balance) {
      print("Insufficient balance! Available balance: $_balance");
    } else {
      _balance -= amount;
      print("Withdrawn: $amount | Remaining Balance: $_balance");
    }
  }

  void displayInfo() {
    print("---------------------------------");
    print("Account Number : $accountNumber");
    print("Account Holder : $accountHolderName");
    print("Account Type   : $accountType");
    print("Balance        : $balance");
    print("---------------------------------");
  }
}

void main() {
  // ---------------- Using a List to store multiple accounts ----------------

  List<BankAccount> accountList = [];

  // Creating accounts using Named Constructors and adding to List
  accountList.add(BankAccount.savingsAccount("SA001", "Ali Raza", 5000.0));
  accountList.add(BankAccount.currentAccount("CA002", "Sara Khan", 15000.0));
  accountList.add(BankAccount.zeroBalance("ZB003", "Bilal Ahmed"));
  accountList.add(BankAccount.savingsAccount("SA004", "Hina Fatima", 3000.0));
  accountList.add(BankAccount.currentAccount("CA005", "Usman Tariq", 20000.0));

  // Display all accounts using List loop
  print("===== All Accounts (Initial) =====");
  for (BankAccount acc in accountList) {
    acc.displayInfo();
  }

  // ---------------- Testing Getter/Setter via List ----------------

  accountList[2].accountHolderName = "Bilal Ahmed Khan"; // valid
  accountList[2].accountHolderName = ""; // invalid (empty)

  accountList[0].balance = 8000.0; // valid
  accountList[0].balance = -500.0; // invalid (negative)

  // ---------------- Deposit/Withdraw on List items ----------------

  accountList[1].deposit(2000.0);
  accountList[1].withdraw(5000.0);
  accountList[1].withdraw(50000.0); // insufficient balance

  // ---------------- Search example: find account by accountNumber ----------------

  String searchAccNo = "CA005";
  BankAccount? foundAccount = accountList.firstWhere(
    (acc) => acc.accountNumber == searchAccNo,
  );
  print("\nSearched Account (${searchAccNo}):");
  foundAccount.displayInfo();

  // ---------------- Filter example: get only Savings accounts ----------------

  List<BankAccount> savingsAccounts =
      accountList.where((acc) => acc.accountType == "Savings").toList();

  print("\n===== Savings Accounts Only =====");
  for (BankAccount acc in savingsAccounts) {
    acc.displayInfo();
  }

  // ---------------- Total balance of all accounts ----------------

  double totalBalance =
      accountList.fold(0.0, (sum, acc) => sum + acc.balance);
  print("\nTotal Balance in Bank: $totalBalance");

  // ---------------- Final state of all accounts ----------------

  print("\n===== All Accounts (Final) =====");
  for (BankAccount acc in accountList) {
    acc.displayInfo();
  }
}