import 'dart:io';

class Employee {
  String _name;
  String _id;
  double _salary;

  // Constructor
  Employee(this._name, this._id, this._salary);

  // Increase salary
  double increaseSalary(double percentage) {
    if (_salary > 0 && percentage >= 0) {
      _salary += _salary * percentage / 100;
      return _salary;
    } else {
      print("Invalid Salary or Percentage.");
      return _salary;
    }
  }

  // Setters
  void setName(String name) {
    this._name = name;
  }

  void setID(String id) {
    this._id = id;
  }

  void setSalary(double salary) {
    if (salary >= 0) {
      this._salary = salary;
    } else {
      print("Salary cannot be negative.");
    }
  }

  // Getters
  String getName() {
    return _name;
  }

  String getID() {
    return _id;
  }

  double getSalary() {
    return _salary;
  }
}

void main() {
  Employee e1 = Employee(
    "Rakib",
    "L1S23BSCS0192",
    80000,
  );

  e1.setName("Akram");

  print("Name: ${e1.getName()}");
  print("ID: ${e1.getID()}");
  print("Old Salary: ${e1.getSalary()}");

  double newSalary = e1.increaseSalary(10);

  print("New Salary: $newSalary");
}