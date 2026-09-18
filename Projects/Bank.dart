import 'dart:io';

// ============================================================
// TRANSACTION CLASS
// ============================================================
// Ye class bank ki har transaction ko represent karegi.
// Example:
// Deposit  : +5000
// Withdraw : -2000
// Transfer : -3000
// ============================================================

class Transaction {
  final int id;
  final String type;
  final double amount;
  final String description;
  final DateTime date;

  // Constructor
  Transaction({
    required this.id,
    required this.type,
    required this.amount,
    required this.description,
  }) : date = DateTime.now();

  // Transaction ki details display karne ka method
  void displayTransaction() {
    print(
      '#$id | $type | Rs. ${amount.toStringAsFixed(2)} | '
      '$description | ${date.toString().substring(0, 19)}',
    );
  }
}

// ============================================================
// BANK ACCOUNT - PARENT CLASS
// ============================================================
// Ye parent class hai.
// SavingsAccount aur CurrentAccount is class se inherit karengi.
//
// OOP Concepts:
// 1. Class
// 2. Constructor
// 3. Encapsulation
// 4. Inheritance
// 5. Method Overriding
// 6. Polymorphism
// ============================================================

class BankAccount {
  // Private variables
  // Encapsulation ka example
  final String _accountNumber;
  final String _customerName;
  double _balance;

  // Transaction history ko bhi private rakha gaya hai.
  final List<Transaction> _transactions = [];

  int _transactionCounter = 0;

  // Constructor
  BankAccount({
    required String accountNumber,
    required String customerName,
    required double initialBalance,
  })  : _accountNumber = accountNumber,
        _customerName = customerName,
        _balance = initialBalance;

  // Getter account number ko safely read karne ke liye
  String get accountNumber => _accountNumber;

  // Getter customer name ko safely read karne ke liye
  String get customerName => _customerName;

  // Getter balance ko safely read karne ke liye
  double get balance => _balance;

  // ==========================================================
  // DEPOSIT
  // ==========================================================

  bool deposit(double amount) {
    if (amount <= 0) {
      print('❌ Deposit amount must be greater than 0.');
      return false;
    }

    _balance += amount;

    _transactionCounter++;

    _transactions.add(
      Transaction(
        id: _transactionCounter,
        type: 'DEPOSIT',
        amount: amount,
        description: 'Money deposited',
      ),
    );

    print('✅ Rs. ${amount.toStringAsFixed(2)} deposited successfully.');
    print('💰 New Balance: Rs. ${_balance.toStringAsFixed(2)}');

    return true;
  }

  // ==========================================================
  // WITHDRAW
  // ==========================================================

  bool withdraw(double amount) {
    if (amount <= 0) {
      print('❌ Withdrawal amount must be greater than 0.');
      return false;
    }

    if (amount > _balance) {
      print('❌ Insufficient balance.');
      print('💰 Available Balance: Rs. ${_balance.toStringAsFixed(2)}');
      return false;
    }

    _balance -= amount;

    _transactionCounter++;

    _transactions.add(
      Transaction(
        id: _transactionCounter,
        type: 'WITHDRAW',
        amount: amount,
        description: 'Money withdrawn',
      ),
    );

    print('✅ Rs. ${amount.toStringAsFixed(2)} withdrawn successfully.');
    print('💰 New Balance: Rs. ${_balance.toStringAsFixed(2)}');

    return true;
  }

  // ==========================================================
  // TRANSFER MONEY
  // ==========================================================

  bool transfer(BankAccount receiver, double amount) {
    if (amount <= 0) {
      print('❌ Transfer amount must be greater than 0.');
      return false;
    }

    if (amount > _balance) {
      print('❌ Insufficient balance for transfer.');
      return false;
    }

    // Sender ka balance minus
    _balance -= amount;

    // Receiver ka balance plus
    receiver._balance += amount;

    // Sender ki transaction history
    _transactionCounter++;

    _transactions.add(
      Transaction(
        id: _transactionCounter,
        type: 'TRANSFER',
        amount: amount,
        description: 'Transferred to ${receiver.accountNumber}',
      ),
    );

    // Receiver ki transaction history
    receiver._transactionCounter++;

    receiver._transactions.add(
      Transaction(
        id: receiver._transactionCounter,
        type: 'RECEIVED',
        amount: amount,
        description: 'Received from $_accountNumber',
      ),
    );

    print(
      '✅ Rs. ${amount.toStringAsFixed(2)} transferred successfully.',
    );

    print(
      '💰 Your New Balance: Rs. ${_balance.toStringAsFixed(2)}',
    );

    return true;
  }

  // ==========================================================
  // INTEREST CALCULATION
  // ==========================================================
  // Ye method child classes override karengi.
  //
  // Is method ko parent class mein define karne ka reason ye hai
  // ke har type ke account mein interest calculate karne ka
  // concept ho sakta hai, lekin calculation different ho sakti hai.
  // ==========================================================

  double calculateInterest() {
    return 0;
  }

  // ==========================================================
  // TRANSACTION HISTORY
  // ==========================================================

  void displayTransactionHistory() {
    print('\n========== TRANSACTION HISTORY ==========');

    if (_transactions.isEmpty) {
      print('No transactions found.');
      return;
    }

    for (Transaction transaction in _transactions) {
      transaction.displayTransaction();
    }
  }

  // ==========================================================
  // ACCOUNT DETAILS
  // ==========================================================

  void displayAccountDetails() {
    print('\n========== ACCOUNT DETAILS ==========');
    print('Account Number : $_accountNumber');
    print('Customer Name  : $_customerName');
    print('Balance        : Rs. ${_balance.toStringAsFixed(2)}');
  }
}

// ============================================================
// SAVINGS ACCOUNT - CHILD CLASS
// ============================================================
// SavingsAccount, BankAccount se inherit kar raha hai.
//
// Inheritance:
// SavingsAccount extends BankAccount
// ============================================================

class SavingsAccount extends BankAccount {
  final double interestRate;

  // Constructor
  SavingsAccount({
    required String accountNumber,
    required String customerName,
    required double initialBalance,
    this.interestRate = 5.0,
  }) : super(
          accountNumber: accountNumber,
          customerName: customerName,
          initialBalance: initialBalance,
        );

  // ==========================================================
  // METHOD OVERRIDING
  // ==========================================================
  // Parent class mein bhi calculateInterest() tha.
  // Yahan hum usko apne Savings Account ke according override
  // kar rahe hain.
  // ==========================================================

  @override
  double calculateInterest() {
    return balance * interestRate / 100;
  }

  // Savings account ki specific details
  @override
  void displayAccountDetails() {
    print('\n========== SAVINGS ACCOUNT ==========');
    print('Account Number : $accountNumber');
    print('Customer Name  : $customerName');
    print('Balance        : Rs. ${balance.toStringAsFixed(2)}');
    print('Interest Rate  : $interestRate%');
    print(
      'Annual Interest: Rs. ${calculateInterest().toStringAsFixed(2)}',
    );
  }
}

// ============================================================
// CURRENT ACCOUNT - CHILD CLASS
// ============================================================

class CurrentAccount extends BankAccount {
  final double maintenanceFee;

  // Constructor
  CurrentAccount({
    required String accountNumber,
    required String customerName,
    required double initialBalance,
    this.maintenanceFee = 500,
  }) : super(
          accountNumber: accountNumber,
          customerName: customerName,
          initialBalance: initialBalance,
        );

  // ==========================================================
  // METHOD OVERRIDING
  // ==========================================================
  // Current Account mein interest nahi milega.
  // Isliye calculateInterest() ko override karke 0 return kar rahe
  // hain.
  // ==========================================================

  @override
  double calculateInterest() {
    return 0;
  }

  @override
  void displayAccountDetails() {
    print('\n========== CURRENT ACCOUNT ==========');
    print('Account Number : $accountNumber');
    print('Customer Name  : $customerName');
    print('Balance        : Rs. ${balance.toStringAsFixed(2)}');
    print('Maintenance Fee: Rs. ${maintenanceFee.toStringAsFixed(2)}');
  }
}

// ============================================================
// CUSTOMER CLASS
// ============================================================
// Ek Customer ke multiple bank accounts ho sakte hain.
// ============================================================

class Customer {
  final String customerId;
  final String name;
  final String phone;

  // Customer ke accounts
  final List<BankAccount> _accounts = [];

  // Constructor
  Customer({
    required this.customerId,
    required this.name,
    required this.phone,
  });

  // Account add karne ka method
  void addAccount(BankAccount account) {
    _accounts.add(account);
  }

  // Account find karne ka method
  BankAccount? findAccount(String accountNumber) {
    for (BankAccount account in _accounts) {
      if (account.accountNumber == accountNumber) {
        return account;
      }
    }

    return null;
  }

  // Customer ke accounts display karna
  void displayCustomerDetails() {
    print('\n========== CUSTOMER DETAILS ==========');
    print('Customer ID : $customerId');
    print('Name        : $name');
    print('Phone       : $phone');

    print('\nAccounts:');

    if (_accounts.isEmpty) {
      print('No accounts found.');
      return;
    }

    for (BankAccount account in _accounts) {
      print(
        '- ${account.accountNumber} | '
        '${account.runtimeType} | '
        'Rs. ${account.balance.toStringAsFixed(2)}',
      );
    }
  }
}

// ============================================================
// BANK CLASS
// ============================================================
// Bank multiple customers ko manage karega.
// ============================================================

class Bank {
  final String name;

  final List<Customer> _customers = [];

  // Constructor
  Bank(this.name);

  // ==========================================================
  // ADD CUSTOMER
  // ==========================================================

  bool addCustomer(Customer customer) {
    // Duplicate Customer ID check
    for (Customer existingCustomer in _customers) {
      if (existingCustomer.customerId == customer.customerId) {
        print('❌ Customer ID already exists.');
        return false;
      }
    }

    _customers.add(customer);

    print('✅ Customer added successfully.');
    return true;
  }

  // ==========================================================
  // FIND CUSTOMER
  // ==========================================================

  Customer? findCustomer(String customerId) {
    for (Customer customer in _customers) {
      if (customer.customerId == customerId) {
        return customer;
      }
    }

    return null;
  }

  // ==========================================================
  // FIND ACCOUNT
  // ==========================================================

  BankAccount? findAccount(String accountNumber) {
    for (Customer customer in _customers) {
      BankAccount? account = customer.findAccount(accountNumber);

      if (account != null) {
        return account;
      }
    }

    return null;
  }

  // ==========================================================
  // CHECK DUPLICATE ACCOUNT
  // ==========================================================

  bool accountExists(String accountNumber) {
    return findAccount(accountNumber) != null;
  }

  // ==========================================================
  // DISPLAY ALL CUSTOMERS
  // ==========================================================

  void displayAllCustomers() {
    print('\n========== ALL CUSTOMERS ==========');

    if (_customers.isEmpty) {
      print('No customers found.');
      return;
    }

    for (Customer customer in _customers) {
      print(
        '${customer.customerId} | '
        '${customer.name} | '
        '${customer.phone}',
      );
    }
  }
}

// ============================================================
// INPUT HELPER FUNCTIONS
// ============================================================
// Ye functions user se input lene ko easy banayenge.
// ============================================================

String getInput(String message) {
  stdout.write(message);
  return stdin.readLineSync()?.trim() ?? '';
}

double getDoubleInput(String message) {
  while (true) {
    String input = getInput(message);

    double? value = double.tryParse(input);

    if (value != null) {
      return value;
    }

    print('❌ Please enter a valid number.');
  }
}

// ============================================================
// CREATE CUSTOMER
// ============================================================

void createCustomer(Bank bank) {
  print('\n========== CREATE CUSTOMER ==========');

  String id = getInput('Enter Customer ID: ');
  String name = getInput('Enter Customer Name: ');
  String phone = getInput('Enter Phone Number: ');

  if (id.isEmpty || name.isEmpty || phone.isEmpty) {
    print('❌ All fields are required.');
    return;
  }

  Customer customer = Customer(
    customerId: id,
    name: name,
    phone: phone,
  );

  bank.addCustomer(customer);
}

// ============================================================
// CREATE SAVINGS ACCOUNT
// ============================================================

void createSavingsAccount(Bank bank) {
  print('\n========== CREATE SAVINGS ACCOUNT ==========');

  String customerId = getInput('Enter Customer ID: ');

  Customer? customer = bank.findCustomer(customerId);

  if (customer == null) {
    print('❌ Customer not found.');
    return;
  }

  String accountNumber = getInput('Enter Account Number: ');

  if (accountNumber.isEmpty) {
    print('❌ Account number cannot be empty.');
    return;
  }

  if (bank.accountExists(accountNumber)) {
    print('❌ Account number already exists.');
    return;
  }

  double initialBalance = getDoubleInput('Enter Initial Balance: ');

  if (initialBalance < 0) {
    print('❌ Initial balance cannot be negative.');
    return;
  }

  SavingsAccount account = SavingsAccount(
    accountNumber: accountNumber,
    customerName: customer.name,
    initialBalance: initialBalance,
  );

  customer.addAccount(account);

  print('✅ Savings Account created successfully.');
}

// ============================================================
// CREATE CURRENT ACCOUNT
// ============================================================

void createCurrentAccount(Bank bank) {
  print('\n========== CREATE CURRENT ACCOUNT ==========');

  String customerId = getInput('Enter Customer ID: ');

  Customer? customer = bank.findCustomer(customerId);

  if (customer == null) {
    print('❌ Customer not found.');
    return;
  }

  String accountNumber = getInput('Enter Account Number: ');

  if (accountNumber.isEmpty) {
    print('❌ Account number cannot be empty.');
    return;
  }

  if (bank.accountExists(accountNumber)) {
    print('❌ Account number already exists.');
    return;
  }

  double initialBalance = getDoubleInput('Enter Initial Balance: ');

  if (initialBalance < 0) {
    print('❌ Initial balance cannot be negative.');
    return;
  }

  CurrentAccount account = CurrentAccount(
    accountNumber: accountNumber,
    customerName: customer.name,
    initialBalance: initialBalance,
  );

  customer.addAccount(account);

  print('✅ Current Account created successfully.');
}

// ============================================================
// DEPOSIT MONEY
// ============================================================

void depositMoney(Bank bank) {
  print('\n========== DEPOSIT MONEY ==========');

  String accountNumber = getInput('Enter Account Number: ');

  BankAccount? account = bank.findAccount(accountNumber);

  if (account == null) {
    print('❌ Account not found.');
    return;
  }

  double amount = getDoubleInput('Enter Deposit Amount: ');

  account.deposit(amount);
}

// ============================================================
// WITHDRAW MONEY
// ============================================================

void withdrawMoney(Bank bank) {
  print('\n========== WITHDRAW MONEY ==========');

  String accountNumber = getInput('Enter Account Number: ');

  BankAccount? account = bank.findAccount(accountNumber);

  if (account == null) {
    print('❌ Account not found.');
    return;
  }

  double amount = getDoubleInput('Enter Withdrawal Amount: ');

  account.withdraw(amount);
}

// ============================================================
// TRANSFER MONEY
// ============================================================

void transferMoney(Bank bank) {
  print('\n========== TRANSFER MONEY ==========');

  String senderNumber = getInput('Enter Sender Account Number: ');

  BankAccount? sender = bank.findAccount(senderNumber);

  if (sender == null) {
    print('❌ Sender account not found.');
    return;
  }

  String receiverNumber = getInput('Enter Receiver Account Number: ');

  BankAccount? receiver = bank.findAccount(receiverNumber);

  if (receiver == null) {
    print('❌ Receiver account not found.');
    return;
  }

  if (senderNumber == receiverNumber) {
    print('❌ Sender and receiver cannot be the same account.');
    return;
  }

  double amount = getDoubleInput('Enter Transfer Amount: ');

  sender.transfer(receiver, amount);
}

// ============================================================
// CHECK BALANCE
// ============================================================

void checkBalance(Bank bank) {
  print('\n========== CHECK BALANCE ==========');

  String accountNumber = getInput('Enter Account Number: ');

  BankAccount? account = bank.findAccount(accountNumber);

  if (account == null) {
    print('❌ Account not found.');
    return;
  }

  print('Account Number: ${account.accountNumber}');
  print('Customer: ${account.customerName}');
  print('Balance: Rs. ${account.balance.toStringAsFixed(2)}');
}

// ============================================================
// VIEW TRANSACTION HISTORY
// ============================================================

void viewTransactionHistory(Bank bank) {
  print('\n========== TRANSACTION HISTORY ==========');

  String accountNumber = getInput('Enter Account Number: ');

  BankAccount? account = bank.findAccount(accountNumber);

  if (account == null) {
    print('❌ Account not found.');
    return;
  }

  account.displayTransactionHistory();
}

// ============================================================
// VIEW ACCOUNT DETAILS
// ============================================================

void viewAccountDetails(Bank bank) {
  print('\n========== ACCOUNT DETAILS ==========');

  String accountNumber = getInput('Enter Account Number: ');

  BankAccount? account = bank.findAccount(accountNumber);

  if (account == null) {
    print('❌ Account not found.');
    return;
  }

  account.displayAccountDetails();
}

// ============================================================
// VIEW CUSTOMER DETAILS
// ============================================================

void viewCustomerDetails(Bank bank) {
  print('\n========== CUSTOMER DETAILS ==========');

  String customerId = getInput('Enter Customer ID: ');

  Customer? customer = bank.findCustomer(customerId);

  if (customer == null) {
    print('❌ Customer not found.');
    return;
  }

  customer.displayCustomerDetails();
}

// ============================================================
// POLYMORPHISM DEMONSTRATION
// ============================================================
// Ye function specifically polymorphism demonstrate karta hai.
//
// Dono variables ka type:
// BankAccount
//
// Lekin actual objects:
// SavingsAccount
// CurrentAccount
//
// Same method:
// calculateInterest()
//
// Different behavior:
// SavingsAccount → interest calculate
// CurrentAccount → 0
// ============================================================

void demonstratePolymorphism() {
  print('\n========== POLYMORPHISM DEMO ==========');

  BankAccount savings = SavingsAccount(
    accountNumber: 'S001',
    customerName: 'Ali',
    initialBalance: 100000,
  );

  BankAccount current = CurrentAccount(
    accountNumber: 'C001',
    customerName: 'Ahmed',
    initialBalance: 100000,
  );

  // Same method call
  print(
    'Savings Interest: '
    'Rs. ${savings.calculateInterest().toStringAsFixed(2)}',
  );

  print(
    'Current Interest: '
    'Rs. ${current.calculateInterest().toStringAsFixed(2)}',
  );
}

// ============================================================
// MAIN FUNCTION
// ============================================================

void main() {
  // Object creation
  Bank bank = Bank('PakBank');

  while (true) {
    print('\n');
    print('==============================================');
    print('        ${bank.name} MANAGEMENT SYSTEM');
    print('==============================================');

    print('1. Create Customer');
    print('2. Create Savings Account');
    print('3. Create Current Account');
    print('4. Deposit Money');
    print('5. Withdraw Money');
    print('6. Transfer Money');
    print('7. Check Balance');
    print('8. View Transaction History');
    print('9. View Account Details');
    print('10. View Customer Details');
    print('11. View All Customers');
    print('12. Polymorphism Demo');
    print('13. Exit');

    String choice = getInput('\nEnter your choice: ');

    switch (choice) {
      case '1':
        createCustomer(bank);
        break;

      case '2':
        createSavingsAccount(bank);
        break;

      case '3':
        createCurrentAccount(bank);
        break;

      case '4':
        depositMoney(bank);
        break;

      case '5':
        withdrawMoney(bank);
        break;

      case '6':
        transferMoney(bank);
        break;

      case '7':
        checkBalance(bank);
        break;

      case '8':
        viewTransactionHistory(bank);
        break;

      case '9':
        viewAccountDetails(bank);
        break;

      case '10':
        viewCustomerDetails(bank);
        break;

      case '11':
        bank.displayAllCustomers();
        break;

      case '12':
        demonstratePolymorphism();
        break;

      case '13':
        print('\nThank you for using ${bank.name}. Goodbye! 👋');
        return;

      default:
        print('❌ Invalid choice. Please try again.');
    }
  }
}