import "dart:io";

void main() {
  stdout.write("Enter the Number: ");
  int number = int.parse(stdin.readLineSync()!);
  if (number > 0) {
    stdout.write("$number is Positive.");
  } else if (number < 0) {
    stdout.write("$number is Negative.");
  } else {
    stdout.write("$number is Zero");
  }
}
