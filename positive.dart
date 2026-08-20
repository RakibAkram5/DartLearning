import "dart:io";

void main() {
  stdout.write("Enter the Number: ");
  int number = int.parse(stdin.readLineSync()!);
  if (number > 0) {
    print("$number is Positive.");
  } else {
    print("$number is Negitive.");
  }
}
