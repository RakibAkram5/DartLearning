class Student {
  String _name;
  int _age;
  double _marks;
  Student(
    // generative contructor to intitalize properties
    this._name,
    this._age,
    this._marks,
  );
  void setName(String name) {
    this._name = name;
  }

  String getName() {
    return _name;
  }

  void setAge(int age) {
    this._age = age;
  }

  int getAge() {
    return _age;
  }

  void setMarks(double marks) {
    this._marks = marks;
  }

  double getMarks() {
    return _marks;
  }

  void displayInfo() {
    print("===========Student Information=========");
    print("Name: $_name");
    print("Age: $_age");
    print("Marks:$_marks");
  }
}

void main() {
  String name = "Muhammad Rakib Akram.";
  int age = 24;
  double marks = 98.23;
  Student s1 = Student(name, age, marks);
  s1.displayInfo();
  s1.setName("Khadija Irshad.");
  s1.setMarks(99.23);
  s1.setAge(21);
  print("Name: ${s1.getName()}");
}
