class Person {
  String name;
  int age;

  // Person constructor
  Person(this.name, this.age);

  // Display person information
  void display() {
    print("Name: $name");
    print("Age: $age");
  }

  // Person role
  void role() {
    print("I am a person.");
  }
}

class Employee extends Person {
  String employeeId;

  // Employee constructor
  Employee(String name, int age, this.employeeId) : super(name, age);

  // Override display()
  @override
  void display() {
    super.display();
    print("Employee ID: $employeeId");
  }

  // Override role()
  @override
  void role() {
    super.role();
    print("I am an employee.");
  }
}

class Manager extends Employee {
  String department;

  // Manager constructor
  Manager(String name, int age, String employeeId, this.department)
    : super(name, age, employeeId);

  // Override display()
  @override
  void display() {
    super.display();
    print("Department: $department");
  }

  // Override role()
  @override
  void role() {
    super.role();
    print("I am a manager.");
  }
}

void main() {
  // Person object
  Person person = Person("Ali", 30);

  person.display();

  print("");

  person.role();

  print("");

  // Employee object
  Employee employee = Employee("Ahmed", 28, "EMP001");

  employee.display();

  print("");

  employee.role();

  print("");

  // Manager object
  Manager manager = Manager("Sara", 35, "EMP002", "IT");

  manager.display();

  print("");

  manager.role();
}
