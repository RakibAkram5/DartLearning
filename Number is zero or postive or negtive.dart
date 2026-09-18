import "dart:io";

void main() {
  print("Enter the Number: ");
  int number = int.parse(stdin.readLineSync()!);
  if (number >= 0) {
    print("Number is Zero or Postive.");
  } else {
    print("Negitive Number.");
  }
}
