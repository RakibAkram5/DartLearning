import 'dart:io';

void main() {
  print("Enter Temperature in Celsius: ");
  double c = double.parse(stdin.readLineSync()!);
  double f = (9 / 5) * c + 32;
  print("Temperature in Fahrenheit= $f");
}
