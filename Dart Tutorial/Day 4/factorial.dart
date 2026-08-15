import "dart:io";

void main() {
  stdout.write("Enter the Numbers whoes Factorial: ");
  int number = int.parse(stdin.readLineSync()!);
  int fact = 1;
  for (int i = 1; i <= number; i++) {
    fact *= i;
  }
  print("Factorial: $fact");
}
