import "dart:io";

List<String> expenseNames = [];
List<double> amounts = [];
List<String> categories = [];

void addExpense() {
  stdout.write("Enter expense name: ");
  String name = stdin.readLineSync()!;

  stdout.write("Enter amount: ");
  double amount = double.parse(stdin.readLineSync()!);

  stdout.write("Enter category: ");
  String category = stdin.readLineSync()!;

  expenseNames.add(name);
  amounts.add(amount);
  categories.add(category);

  print("\nExpense added successfully!");
}

void showExpenses() {
  if (expenseNames.isEmpty) {
    print("\nNo expenses found.");
    return;
  }

  print("\n========== ALL EXPENSES ==========");

  for (int i = 0; i < expenseNames.length; i++) {
    print(
      "${i + 1}. ${expenseNames[i]} - Rs.${amounts[i]} - ${categories[i]}",
    );
  }
}

void calculateTotal() {
  if (amounts.isEmpty) {
    print("\nNo expenses found.");
    return;
  }

  double total = 0;

  for (double amount in amounts) {
    total += amount;
  }

  print("\nTotal Expense: Rs.$total");
}

void findHighest() {
  if (amounts.isEmpty) {
    print("\nNo expenses found.");
    return;
  }

  double highest = amounts[0];
  int highestIndex = 0;

  for (int i = 1; i < amounts.length; i++) {
    if (amounts[i] > highest) {
      highest = amounts[i];
      highestIndex = i;
    }
  }

  print("\n========== HIGHEST EXPENSE ==========");
  print("Name: ${expenseNames[highestIndex]}");
  print("Amount: Rs.${amounts[highestIndex]}");
  print("Category: ${categories[highestIndex]}");
}

void findLowest() {
  if (amounts.isEmpty) {
    print("\nNo expenses found.");
    return;
  }

  double lowest = amounts[0];
  int lowestIndex = 0;

  for (int i = 1; i < amounts.length; i++) {
    if (amounts[i] < lowest) {
      lowest = amounts[i];
      lowestIndex = i;
    }
  }

  print("\n========== LOWEST EXPENSE ==========");
  print("Name: ${expenseNames[lowestIndex]}");
  print("Amount: Rs.${amounts[lowestIndex]}");
  print("Category: ${categories[lowestIndex]}");
}

void searchExpense() {
  if (expenseNames.isEmpty) {
    print("\nNo expenses found.");
    return;
  }

  stdout.write("Enter expense name to search: ");
  String searchName = stdin.readLineSync()!;

  bool found = false;

  for (int i = 0; i < expenseNames.length; i++) {
    if (expenseNames[i].toLowerCase() == searchName.toLowerCase()) {
      print("\nExpense Found!");
      print("Name: ${expenseNames[i]}");
      print("Amount: Rs.${amounts[i]}");
      print("Category: ${categories[i]}");

      found = true;
    }
  }

  if (!found) {
    print("\nExpense not found.");
  }
}

void deleteExpense() {
  if (expenseNames.isEmpty) {
    print("\nNo expenses found.");
    return;
  }

  showExpenses();

  stdout.write("\nEnter expense number to delete: ");
  int index = int.parse(stdin.readLineSync()!);

  if (index >= 1 && index <= expenseNames.length) {
    int actualIndex = index - 1;

    String deletedName = expenseNames[actualIndex];

    expenseNames.removeAt(actualIndex);
    amounts.removeAt(actualIndex);
    categories.removeAt(actualIndex);

    print("\n$deletedName deleted successfully!");
  } else {
    print("\nInvalid expense number.");
  }
}

void showAboveAmount() {
  if (amounts.isEmpty) {
    print("\nNo expenses found.");
    return;
  }

  stdout.write("Enter amount: ");
  double amount = double.parse(stdin.readLineSync()!);

  bool found = false;

  print("\n========== EXPENSES ABOVE Rs.$amount ==========");

  for (int i = 0; i < amounts.length; i++) {
    if (amounts[i] > amount) {
      print(
        "${i + 1}. ${expenseNames[i]} - Rs.${amounts[i]} - ${categories[i]}",
      );

      found = true;
    }
  }

  if (!found) {
    print("No expense found above Rs.$amount");
  }
}

void calculateAverage() {
  if (amounts.isEmpty) {
    print("\nNo expenses found.");
    return;
  }

  double total = 0;

  for (double amount in amounts) {
    total += amount;
  }

  double average = total / amounts.length;

  print("\nAverage Expense: Rs.${average.toStringAsFixed(2)}");
}

void main() {
  int choice = 0;

  do {
    print("\n==================================");
    print("        EXPENSE TRACKER");
    print("==================================");
    print("1. Add Expense");
    print("2. Show All Expenses");
    print("3. Total Expense");
    print("4. Highest Expense");
    print("5. Lowest Expense");
    print("6. Search Expense");
    print("7. Delete Expense");
    print("8. Expenses Above Amount");
    print("9. Average Expense");
    print("10. Exit");
    print("==================================");

    stdout.write("Enter your choice: ");

    try {
      choice = int.parse(stdin.readLineSync()!);
    } catch (e) {
      print("\nPlease enter a valid number.");
      continue;
    }

    switch (choice) {
      case 1:
        addExpense();
        break;

      case 2:
        showExpenses();
        break;

      case 3:
        calculateTotal();
        break;

      case 4:
        findHighest();
        break;

      case 5:
        findLowest();
        break;

      case 6:
        searchExpense();
        break;

      case 7:
        deleteExpense();
        break;

      case 8:
        showAboveAmount();
        break;

      case 9:
        calculateAverage();
        break;

      case 10:
        print("\nThank you for using Expense Tracker!");
        break;

      default:
        print("\nInvalid choice. Please try again.");
    }
  } while (choice != 10);
}