class Student {
  String name;
  int age;
  Student(this.name, this.age);
  void display() {
    print("Name: $name");
    print("age: $age");
  }
}

void main() {
  String name = "Ali";
  int age = 20;
  String name1 = "Rakib";
  int age1 = 30;
  Student s1 = Student(name, age);
  Student s2 = Student(name1, age1);
  s1.display();
  s2.display();
}
