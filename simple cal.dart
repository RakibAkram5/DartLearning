import 'dart:io';

void main() {
  stdout.write("Enter the Number1: ");
  int number_1 = int.parse(stdin.readLineSync()!);
  stdout.write("Enter the Number2: ");
  int number_2 = int.parse(stdin.readLineSync()!);
  stdout.write("Enter Operator (+,-,/,*,%): ");
  String? op = stdin.readLineSync();

  switch (op) {
    case '+':
      int sum = number_1 + number_2;
      print("$number_1 $op $number_2 = $sum");
      break;
    case '-':
      int diff = number_1 - number_2;
      print("$number_1 $op $number_2 = $diff");
      break;
    case '*':
      int product = number_1 * number_2;
      print("$number_1 $op $number_2 = $product");
      break;
    case '/':
      if (number_2 == 0) {
        print("Error: Division by zero");
      } else {
        double quotient = number_1 / number_2;
        print("$number_1 $op $number_2 = $quotient");
      }
      break;
    case '%':
      if (number_2 == 0) {
        print("Error: Division by zero");
      } else {
        int remainder = number_1 % number_2;
        print("$number_1 $op $number_2 = $remainder");
      }
      break;
    default:
      print("Invalid operator");
  }
}