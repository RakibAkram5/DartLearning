import "dart:io";

void main() {
  stdout.write("Enter the 1st Number: ");
  int number_1 = int.parse(stdin.readLineSync()!);
  stdout.write("Enter the 2nd Number: ");
  int number_2 = int.parse(stdin.readLineSync()!);
  stdout.write("Enter the 3rd Number: ");
  int number_3 = int.parse(stdin.readLineSync()!);
  if (number_1 > number_2 && number_1 > number_3) {
    print("$number_1 is greater Number.");
  } else if (number_2 > number_1 && number_2 > number_3) {
    print("$number_2 is greater Number.");
  } else {
    print("$number_3 is greater number.");5
  }
}
