import "dart:io";

void main() {
  stdout.write("Enter your Marks: ");
  double marks = double.parse(stdin.readLineSync()!);
  print("Marks: $marks");
}
