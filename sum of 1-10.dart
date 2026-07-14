import "dart:io";

void main() {
  int sum = 0;
  stdout.write("Enter the size of Loop: ");
  int size = int.parse(stdin.readLineSync()!);
  for (int i = 0; i <= size; i++) {
    sum = sum + i;
  }
  print("Sum: $sum");
}
