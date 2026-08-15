import "dart:io";

void main() {
  stdout.write("Enter the Size: ");
  int size = int.parse(stdin.readLineSync()!);
  for (int i = 0; i < size; i++) {
    if (i % 2 == 0) {
      print("Even Numbers: $i");
    } else {
      print("Odd Number: $i");
    }
  }
}
