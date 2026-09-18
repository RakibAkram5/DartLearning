import "dart:io";

void main() {
  stdout.write("Enter size of Loop: ");
  int size = int.parse(stdin.readLineSync()!);
  for (int i = 0; i <= size; i++) {
    if (i % 5 == 0) {
      print("$i");
    }
  }
}
