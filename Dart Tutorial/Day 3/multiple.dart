import "dart:io";

void main() {
  stdout.write("Enter the first Number: ");
  double firstnumber = double.parse(stdin.readLineSync()!);
  stdout.write("Enter Your Second Number: ");
  double secondnumber = double.parse(stdin.readLineSync()!);
  double multiply = firstnumber * secondnumber;
  print("Multiplication: $multiply");
  
}
