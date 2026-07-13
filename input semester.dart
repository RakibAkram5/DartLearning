import "dart:io";

void main() {
  print("Enter your Semester: ");
  int semester = int.parse(stdin.readLineSync()!);
  print("Semester: $semester");
}
