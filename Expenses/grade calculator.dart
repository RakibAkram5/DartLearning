import "dart:io";

void main() {
  stdout.write("Enter the Grade: ");
  int grade = int.parse(stdin.readLineSync()!);
  if (grade <= 100 && grade >= 0) {
    if (grade <= 100 && grade >= 90) {
      print("A");
    } else if (grade <= 89 && grade >= 80) {
      print("B");
    } else if (grade <= 79 && grade >= 70) {
      print("C");
    } else if (grade <= 69 && grade >= 60) {
      print("D");
    } else {
      print("F");
    }
  } else {
    print("Invalid Marks.");
  }
}
