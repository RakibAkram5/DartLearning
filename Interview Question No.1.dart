import "dart:io";

void main() {
  stdout.write("Input: ");
  int number = int.parse(stdin.readLineSync()!);

  bool result = number % 3 == 0 && number % 5 != 0;

  print("Output: $result");
}