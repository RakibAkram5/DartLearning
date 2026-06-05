import "dart:io";

void main() {
  int number = int.parse(stdin.readLineSync()!);
  int number2 = int.parse(stdin.readLineSync()!);
  int number3 = int.parse(stdin.readLineSync()!);
  if (number > number2 && number > number3) {
    print("$number is greater.");
  } else if (number2 > number && number2 > number3) {
    print("$number2 is greater.");
  } else {
    print("$number3 is greater.");
  }
}
