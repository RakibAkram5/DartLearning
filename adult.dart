import "dart:io";

void main() {
  stdout.write("Enter Your Age: ");
  int age = int.parse(stdin.readLineSync()!);
  if (age >= 18) {
    print("You are above or equal 18 you are Adult.");
  } else {
    print("You are below 18 you are Minor.");
  }
}
