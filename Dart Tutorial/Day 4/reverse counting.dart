import 'dart:io';

void main() {
  stdout.write("Enter Size: ");
  int size = int.parse(stdin.readLineSync()!);

  for (int i = size; i >= 1; i--) {
    print(i);
  }
}