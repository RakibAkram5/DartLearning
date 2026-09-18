import 'dart:io';

// ---------------- Parent Class ----------------
class Employee {
  String _name;
  int _age;
  String _employeeId;
  double _salary;

  Employee(this._name, this._age, this._employeeId, this._salary);

  // Getters
  String get name => _name;
  int get age => _age;
  String get employeeId => _employeeId;
  double get salary => _salary;

  // Setters with validation
  set name(String value) => _name = value;

  set age(int value) {
    if (value < 0) {
      print("Error: Age cannot be negative. Keeping previous value.");
    } else {
      _age = value;
    }
  }

  set employeeId(String value) => _employeeId = value;

  set salary(double value) {
    if (value < 0) {
      print("Error: Salary cannot be negative. Keeping previous value.");
    } else {
      _salary = value;
    }
  }

  double calculateBonus() {
    return 0; // default, overridden by children
  }

  void displayInfo() {
    print("Name       : $_name");
    print("Age        : $_age");
    print("Employee ID: $_employeeId");
    print("Salary     : $_salary");
  }
}

// ---------------- Developer ----------------
class Developer extends Employee {
  String programmingLanguage;

  Developer(String name, int age, String employeeId, double salary,
      this.programmingLanguage)
      : super(name, age, employeeId, salary);

  @override
  double calculateBonus() {
    return salary * 0.15; // 15% bonus
  }

  void displayInfo() {
    super.displayInfo();
    print("Role       : Developer");
    print("Language   : $programmingLanguage");
  }
}

// ---------------- Manager ----------------
class Manager extends Employee {
  int teamSize;

  Manager(String name, int age, String employeeId, double salary,
      this.teamSize)
      : super(name, age, employeeId, salary);

  @override
  double calculateBonus() {
    // 20% base + small bonus per team member managed
    return salary * 0.20 + (teamSize * 500);
  }

  void displayInfo() {
    super.displayInfo();
    print("Role       : Manager");
    print("Team Size  : $teamSize");
  }
}

// ---------------- Intern ----------------
class Intern extends Employee {
  int internshipDurationMonths;

  Intern(String name, int age, String employeeId, double salary,
      this.internshipDurationMonths)
      : super(name, age, employeeId, salary);

  @override
  double calculateBonus() {
    // 5% base, plus a small loyalty bonus for longer internships
    double base = salary * 0.05;
    if (internshipDurationMonths >= 6) {
      base += 1000;
    }
    return base;
  }

  void displayInfo() {
    super.displayInfo();
    print("Role       : Intern");
    print("Duration   : $internshipDurationMonths months");
  }
}

// ---------------- Main Program ----------------
void main() {
  print("=== Employee Management System ===");

  stdout.write("Enter employee name: ");
  String name = stdin.readLineSync() ?? "";

  int age = -1;
  while (age < 0) {
    stdout.write("Enter employee age: ");
    age = int.tryParse(stdin.readLineSync() ?? "-1") ?? -1;
    if (age < 0) print("Invalid age. Please enter a non-negative number.");
  }

  stdout.write("Enter employee ID: ");
  String employeeId = stdin.readLineSync() ?? "";

  double salary = -1;
  while (salary < 0) {
    stdout.write("Enter employee salary: ");
    salary = double.tryParse(stdin.readLineSync() ?? "-1") ?? -1;
    if (salary < 0) print("Invalid salary. Please enter a non-negative number.");
  }

  print("\nSelect Employee Role:");
  print("1. Developer");
  print("2. Manager");
  print("3. Intern");
  stdout.write("Enter choice (1-3): ");
  String? choiceInput = stdin.readLineSync();
  int choice = int.tryParse(choiceInput ?? "") ?? 0;

  Employee? employee;

  switch (choice) {
    case 1:
      stdout.write("Enter primary programming language: ");
      String lang = stdin.readLineSync() ?? "Unknown";
      employee = Developer(name, age, employeeId, salary, lang);
      break;

    case 2:
      stdout.write("Enter team size managed: ");
      int teamSize = int.tryParse(stdin.readLineSync() ?? "0") ?? 0;
      employee = Manager(name, age, employeeId, salary, teamSize);
      break;

    case 3:
      stdout.write("Enter internship duration (months): ");
      int duration = int.tryParse(stdin.readLineSync() ?? "0") ?? 0;
      employee = Intern(name, age, employeeId, salary, duration);
      break;

    default:
      print("Invalid role selected. Exiting program.");
  }

  if (employee != null) {
    print("\n--- Employee Details ---");

    if (employee is Developer) {
      employee.displayInfo();
    } else if (employee is Manager) {
      employee.displayInfo();
    } else if (employee is Intern) {
      employee.displayInfo();
    }

    double bonus = employee.calculateBonus();
    double total = employee.salary + bonus;

    print("\nCalculated Bonus : $bonus");
    print("Total Salary     : $total");
  }
}