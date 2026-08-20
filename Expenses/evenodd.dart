import "dart:io";

void main() {
  stdout.write("Enter the Number: ");
  int number = int.parse(stdin.readLineSync()!);
  if (number % 2 == 0) {
    print("Number is Even");
  } else {
    print("Number is Odd");
  }
}
