import "dart:io";

void main() {
  String pin = "****";
  double balance = 0.0;
  List<String> transactions = [];

  stdout.write("Enter PIN: ");
  String? enteredPin = stdin.readLineSync();

  if (enteredPin != pin) {
    print("Invalid PIN.");
    return;
  }

  int attemptsLeft = 3; // used for change-PIN verification later
  int choice = 0;

  print("===============================");
  print("\t\tATM System\t");
  print("===============================");

  do {
    print("\n1. Check Balance");
    print("2. Deposit Money");
    print("3. Withdraw Money");
    print("4. Change PIN");
    print("5. Mini Statement");
    print("6. Exit");
    stdout.write("Enter Choice: ");

    try {
      choice = int.parse(stdin.readLineSync()!);
    } catch (e) {
      print("Invalid input. Please enter a number between 1 and 6.");
      continue;
    }

    switch (choice) {
      case 1:
        print("Current Balance: \$${balance.toStringAsFixed(2)}");
        break;

      case 2:
        stdout.write("Enter the Deposit Amount: ");
        double depositMoney = double.parse(stdin.readLineSync()!);
        if (depositMoney <= 0) {
          print("Deposit amount must be positive.");
          break;
        }
        balance += depositMoney;
        transactions.add("Deposited: \$${depositMoney.toStringAsFixed(2)}");
        print(
          "Deposit successful. New Balance: \$${balance.toStringAsFixed(2)}",
        );
        break;

      case 3:
        stdout.write("Enter the Withdrawal Amount: ");
        double withdrawMoney = double.parse(stdin.readLineSync()!);
        if (withdrawMoney <= 0) {
          print("Withdrawal amount must be positive.");
        } else if (withdrawMoney > balance) {
          print("Insufficient balance.");
        } else {
          balance -= withdrawMoney;
          transactions.add("Withdrew: \$${withdrawMoney.toStringAsFixed(2)}");
          print(
            "Withdrawal successful. New Balance: \$${balance.toStringAsFixed(2)}",
          );
        }
        break;

      case 4:
        stdout.write("Enter Current PIN: ");
        String? currentPin = stdin.readLineSync();
        if (currentPin != pin) {
          print("Incorrect current PIN.");
          break;
        }
        stdout.write("Enter New PIN: ");
        String? newPin = stdin.readLineSync();
        stdout.write("Confirm New PIN: ");
        String? confirmPin = stdin.readLineSync();
        if (newPin == null || newPin.isEmpty) {
          print("PIN cannot be empty.");
        } else if (newPin != confirmPin) {
          print("PINs do not match. PIN not changed.");
        } else {
          pin = newPin;
          print("PIN changed successfully.");
        }
        break;

      case 5:
        print("---- Mini Statement ----");
        if (transactions.isEmpty) {
          print("No transactions yet.");
        } else {
          for (var t in transactions) {
            print(t);
          }
        }
        print("Current Balance: \$${balance.toStringAsFixed(2)}");
        break;

      case 6:
        print("Thank you for using the ATM. Goodbye!");
        break;

      default:
        print("Invalid choice. Please select a number between 1 and 6.");
    }
  } while (choice != 6);
}
