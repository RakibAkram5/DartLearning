import "dart:io";

void main() {
  stdout.write("Enter your age: ");
  int age = int.parse(stdin.readLineSync()!);
  if (age >= 18) {
    print("You are Eligible for Voting.");
  } else {
    print("You are not eligible for voting.");
  }
}
