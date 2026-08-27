class Employee {
  String name;
  Employee(this.name);

  void showDetails() {
    print("Employee Name: $name");
  }
}

class Manager extends Employee {
  Manager(String name) : super(name);

  void manageTeam() {
    print("$name is managing the team.");
  }
}

class Developer extends Employee {
  Developer(String name) : super(name);

  void writeCode() {
    print("$name is writing code.");
  }
}

void main() {
  Manager m = Manager("Ali");
  m.showDetails();
  m.manageTeam();

  Developer d = Developer("Sara");
  d.showDetails();
  d.writeCode();
}