import "dart:io";

void main() {
  print("Enter your Age: ");
  int age = int.parse(stdin.readLineSync()!);
  print("Age: $age");
}
