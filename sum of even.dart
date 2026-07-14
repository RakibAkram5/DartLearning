import "dart:io";

void main() {
  int size;
  int sum = 0;
  stdout.write("Enter the size of Number: ");
  size = int.parse(stdin.readLineSync()!);
  for (int i = 0; i <= size; i++) {
    if (i % 2 == 0) {
      sum += i;
      print("$i");
    }
  }
  print("Sum of Even Number: $sum");
}
