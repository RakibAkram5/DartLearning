import "dart:io";

void main() {
  int count = 0;
  stdout.write("Enter a Number: ");
  int number = int.parse(stdin.readLineSync()!);
  while (number > 0) {
    count++;
    number = number ~/ 10;
  }
  print("total Digit: $count");
}
