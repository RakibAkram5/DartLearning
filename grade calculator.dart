import "dart:io";

void main() {
  stdout.write("Enter your Grade: ");
  double cgpa = double.parse(stdin.readLineSync()!);

  if (cgpa > 100 || cgpa < 0) {
    print("Invalid input");
  } else if (cgpa >= 90) {
    print("Grade: A");
  } else if (cgpa >= 80) {
    print("Grade: B");
  } else if (cgpa >= 70) {
    print("Grade: C");
  } else if (cgpa >= 60) {
    print("Grade: D");
  } else {
    print("Grade: F");
  }
}
