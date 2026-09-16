class Student {
  String name;
  int age;
  String grade;

  Student(this.name, this.age, this.grade);

  void displayInfo() {
    print("Name: $name");
    print("Age: $age");
    print("Grade: $grade");
  }
}

void main() {
  Student s1 = Student("Ali", 18, "A");
  Student s2 = Student("Sara", 20, "B");

  s1.displayInfo();
  print("---");
  s2.displayInfo();
}
