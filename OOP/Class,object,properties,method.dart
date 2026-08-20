import "dart:io";

class student {
  String name;
  int age;
  double marks;
  student(this.name, this.age, this.marks); //parameterized Constructor
  void displayinfo() {
    stdout.write("Name: $name \n Age: $age \n Marks: $marks");
  }
}

void main() {
  stdout.write("Enter the Name: ");
  String name = stdin.readLineSync()!;
  stdout.write("Enter the Age: ");
  int age = int.parse(stdin.readLineSync()!); // convert string into int
  stdout.write("Enter the Marks: ");
  print("");
  double marks = double.parse(stdin.readLineSync()!);
  student s1 = student(name, age, marks);
  s1.displayinfo();
}
