class Employee {
  String _name;
  double _salary;
  int _age;

  Employee(this._name, this._salary, this._age);

  // Getter
  String get name {
    return _name;
  }

  // Setter with validation
  set name(String value) {
    if (value.isEmpty) {
      print("Invalid name: Name cannot be empty.");
    } else {
      _name = value;
    }
  }

  // Getter
  double get salary {
    return _salary;
  }

  // Setter with validation
  set salary(double value) {
    if (value <= 0) {
      print("Invalid salary: Salary must be greater than 0.");
    } else {
      _salary = value;
    }
  }

  // Getter
  int get age {
    return _age;
  }

  // Setter with validation
  set age(int value) {
    if (value <= 0 || value > 100) {
      print("Invalid age: Age must be between 1 and 100.");
    } else {
      _age = value;
    }
  }

  void display() {
    print("Name: $name");
    print("Salary: $salary");
    print("Age: $age");
  }
}

void main() {
  Employee e = Employee("Ahmad", 500000.00, 25);

  print("Initial Employee:");
  e.display();

  print("\nTesting Invalid Values:");

  // Invalid values
  e.name = "";
  e.salary = -50000;
  e.age = 150;

  print("\nTesting Valid Values:");

  // Valid values
  e.name = "Rakib";
  e.salary = 600000.00;
  e.age = 26;

  print("\nUpdated Employee:");
  e.display();
}