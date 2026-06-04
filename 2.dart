import 'dart:io';

void main() {
  print("Enter length: ");
  double length = double.parse(stdin.readLineSync()!);
  print("Enter Width: ");
  double width = double.parse(stdin.readLineSync()!);
  double area = length * width;
  print("Area= $area");
}
