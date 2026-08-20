import "dart:io";

void main() {
  stdout.write("Enter 1st Number: ");
  int number_1 = int.parse(stdin.readLineSync()!);
  stdout.write("Enter The Second Number: ");
  int number_2 = int.parse(stdin.readLineSync()!);
  int sum = number_1 + number_2;
  print("Sum=$sum");
}
