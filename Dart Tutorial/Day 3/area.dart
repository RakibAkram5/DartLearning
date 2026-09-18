import "dart:io";

void main() {
  double pi = 3.14;
  stdout.write("Enter Radius: ");
  double radius = double.parse(stdin.readLineSync()!);
  double area = radius * pi;
  print("Area: $area");
}
