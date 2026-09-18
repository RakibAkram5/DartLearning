import "dart:io";

void main() {
  print("Enter your CPGA: ");
  double cgpa = double.parse(stdin.readLineSync()!);
  print("CGPA: $cgpa");
}
