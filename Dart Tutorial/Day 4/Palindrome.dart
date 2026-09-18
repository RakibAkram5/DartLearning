import "dart:io";

void main() {
  int number;
  int reversed = 0;
  stdout.write("Enter the Number: ");
  number = int.parse(stdin.readLineSync()!);

  int original = number;   // 🔑 yahan original save kiya

  while (number > 0) {
    int last_digit = number % 10;
    reversed = reversed * 10 + last_digit;
    number = number ~/ 10;
  }

  if (original == reversed) {   // 🔑 ab sahi comparison ho raha hai
    print("Number is Palindrome.");
  } else {
    print("Number is Not Palindrome.");
  }
}