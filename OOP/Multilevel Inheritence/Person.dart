class Person {
  String _name;
  int _age;

  Person(this._name, this._age);

  // Setters
  void setName(String name) {
    _name = name;
  }

  void setAge(int age) {
    _age = age;
  }

  // Getters
  String getName() {
    return _name;
  }

  int getAge() {
    return _age;
  }

  // Display
  void displayInfo() {
    print("Name: $_name");
    print("Age: $_age");
  }
}

// Person → Student
class Student extends Person {
  String _rollNumber;

  Student(String name, int age, this._rollNumber)
      : super(name, age);

  // Setter
  void setRollNumber(String rollNumber) {
    _rollNumber = rollNumber;
  }

  // Getter
  String getRollNumber() {
    return _rollNumber;
  }

  // Display
  void displayRollNumber() {
    print("Roll Number: $_rollNumber");
  }
}

// Person → Student → UniversityStudent
class UniversityStudent extends Student {
  String _degree;

  UniversityStudent(
    String name,
    int age,
    String rollNumber,
    this._degree,
  ) : super(name, age, rollNumber);

  // Setter
  void setDegree(String degree) {
    _degree = degree;
  }

  // Getter
  String getDegree() {
    return _degree;
  }

  // Display
  void displayDegree() {
    print("Degree: $_degree");
  }
}

void main() {
  UniversityStudent student = UniversityStudent(
    "Rakib",
    25,
    "CS-101",
    "BS Computer Science",
  );

  // Person ka method
  student.displayInfo();

  // Student ka method
  student.displayRollNumber();

  // UniversityStudent ka method
  student.displayDegree();
}