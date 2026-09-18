import "dart:io";

void main() {
  // for (int i = 1; i <= 50; i += 2) {
  //   print(i);
  // }
  stdout.write("Enter the Number: ");
  int number = int.parse(stdin.readLineSync()!);
  int original = number;
  int reverse = 0;
  while (number > 0) {
    int digit = number % 10;
    reverse = reverse * 10 + digit;
    number = number ~/ 10;
  }
  if (original == reverse) {
    print("Palindrome.");
  } else {
    print("Not Palindrome.");
  }
}
