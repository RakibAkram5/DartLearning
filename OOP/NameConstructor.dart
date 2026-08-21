class Employee {
  String name;
  int age;
  int salary;

  // Normal Constructor
  Employee(this.name, this.age, this.salary);

  // Named Constructor
  Employee.intern()
      : name = "Intern",
        age = 20,
        salary = 15000;

  // Method
  void displayEmployee() {
    print("------------------------");
    print("Name: $name");
    print("Age: $age");
    print("Salary: $salary");
    print("------------------------");
  }
}

void main() {
  Employee e1 = Employee("Rakib", 24, 50000);

  Employee e2 = Employee.intern();

  e1.displayEmployee();
  e2.displayEmployee();
}