import "dart:io";

void main() {
  int size;
  int sum = 0;
  stdout.write("Enter the size of Loop: ");
  size = int.parse(stdin.readLineSync()!);
  for (int i = 0; i < size; i++) {
    if (i % 2 != 0) {
      print("$i");
      sum += i;
    }
  }
  print("Sum: $sum");
}
