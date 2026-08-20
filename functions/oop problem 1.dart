class Student {
  String name;
  int age;
  double marks;
  Student(this.name, this.age, this.marks);
  void displayinfo() {
    print("Name: $name");
    print("Age: $age");
    print("Marks: $marks");
  }
}

void main() {
  Student student1 = Student("Rakib", 24, 85.5);
  student1.displayinfo();
}
