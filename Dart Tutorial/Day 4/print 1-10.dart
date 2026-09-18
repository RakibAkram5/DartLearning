import "dart:io";

void main() {
  stdout.write("Enter the Number: ");
  int size = int.parse(stdin.readLineSync()!);
  for (int i = 0; i < size; i++) {
    stdout.write("$i ");
  }
}
