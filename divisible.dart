import "dart:io";

void main() {
  stdout.write("Enter the Number: ");
  int number = int.parse(stdin.readLineSync()!);
  if (number % 5 == 0) {
    print("$number is divisible by 5");
  } else {
    print("$number is Not Divisible by 5");
  }
}
