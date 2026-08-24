import 'dart:io';

class Person {
  String _name;
  int _age;
  Person(this._name, this._age);

  void setName(String name) {
    _name = name;
  }

  void setAge(int age) {
    _age = age;
  }

  String getName() => _name;
  int getAge() => _age;

  void displayPerson() {
    stdout.write("Name: $_name\n");
    stdout.write("Age: $_age\n");
  }
}

class Student extends Person {
  String _rollNumber;

  Student(String name, int age, this._rollNumber) : super(name, age);

  void setRollnumber(String rollnumber) {
    _rollNumber = rollnumber;
  }

  String getRollnumber() => _rollNumber;

  void displayStudent() {
    stdout.write("Name: $_name\n");
    stdout.write("Age: $_age\n");
    stdout.write("RollNumber: $_rollNumber\n");
  }
}

void main() {
  Student s = Student("Rakib", 24, "R123");
  s.displayStudent();
}