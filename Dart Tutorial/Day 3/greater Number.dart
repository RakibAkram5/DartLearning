import "Dart:io";

void main() {
  stdout.write("Enter the First Number: ");
  int number_1 = int.parse(stdin.readLineSync()!);
  stdout.write("Enter the Second Number: ");
  int number_2 = int.parse(stdin.readLineSync()!);
  if (number_1 > number_2) {
    print("$number_1 is greate than $number_2");
  } else {
    print("$number_2 is greater than $number_1");
  }
}
