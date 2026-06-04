import 'dart:io';

void main() {
  print("Enter a Number: ");
  int num = int.parse(stdin.readLineSync()!);
  if (num % 2 == 0) {
    print("Even Number.");
  } else {
    print("Odd Number.");
  }
}
