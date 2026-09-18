import 'dart:io';

class BankAccount {
  // Properties
  String accountNumber;
  String accountHolder;
  double balance;
  String accountType;

  // Constructor
  BankAccount(
    this.accountNumber,
    this.accountHolder,
    this.balance,
    this.accountType,
  );

  // Deposit Method
  void deposit(double amount) {
    if (amount > 0) {
      balance += amount;
      print("$accountHolder deposited Rs. $amount");
    } else {
      print("Invalid deposit amount!");
    }
  }

  // Withdraw Method
  void withdraw(double amount) {
    if (amount <= 0) {
      print("Invalid withdrawal amount!");
    } else if (amount > balance) {
      print("$accountHolder does not have enough balance!");
    } else {
      balance -= amount;
      print("$accountHolder withdrew Rs. $amount");
    }
  }

  // Transfer Method
  void transfer(BankAccount receiver, double amount) {
    if (amount <= 0) {
      print("Invalid transfer amount!");
    } else if (amount > balance) {
      print("$accountHolder does not have enough balance!");
    } else {
      balance -= amount;
      receiver.balance += amount;

      print(
        "$accountHolder transferred Rs. $amount "
        "to ${receiver.accountHolder}",
      );
    }
  }

  // Interest Method
  double calculateInterest(double rate) {
    double interest = balance * rate / 100;
    return interest;
  }

  // Premium Customer Method
  bool isPremiumCustomer() {
    if (balance >= 500000) {
      return true;
    } else {
      return false;
    }
  }

  // Display Method
  void displayAccount() {
    print("-----------------------------------");
    print("Account Holder : $accountHolder");
    print("Account Number : $accountNumber");
    print("Account Type   : $accountType");
    print("Balance        : Rs. $balance");
    print("Premium        : ${isPremiumCustomer()}");
    print("-----------------------------------");
  }
}

void main() {
  // Objects
  BankAccount ali = BankAccount(
    "1001",
    "Ali",
    200000,
    "Savings",
  );

  BankAccount ahmed = BankAccount(
    "1002",
    "Ahmed",
    100000,
    "Current",
  );

  BankAccount usman = BankAccount(
    "1003",
    "Usman",
    700000,
    "Savings",
  );

  // 1. Ali deposits 50,000
  ali.deposit(50000);

  // 2. Ahmed withdraws 20,000
  ahmed.withdraw(20000);

  // 3. Ali transfers 100,000 to Ahmed
  ali.transfer(ahmed, 100000);

  // 4. Calculate Ali's interest
  double aliInterest = ali.calculateInterest(5);

  print("\nAli's Interest at 5%: Rs. $aliInterest");

  // 5. Check Usman premium status
  print(
    "Is Usman a Premium Customer? "
    "${usman.isPremiumCustomer()}",
  );

  // 6. Display all accounts
  print("\nFINAL ACCOUNT DETAILS");

  ali.displayAccount();
  ahmed.displayAccount();
  usman.displayAccount();
}