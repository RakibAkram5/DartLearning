import "dart:io";

void main() {
  stdout.write("Enter the Number: ");
  int number = int.parse(stdin.readLineSync()!);
  if (number % 5 == 0 && number % 3 == 0) {
    print("$number is divisible by 3 and 5");
  } else {
    print("$number is not divisible by 3 and 5");
  }
}
