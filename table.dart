import "dart:io";

void main() {
  int number;
  stdout.write("Enter the Number whoes Table to be Print: ");
  number = int.parse(stdin.readLineSync()!);
  for (int i = 1; i <= 10; i++) {
    int mul = number * i;
    print("$number X $i = $mul");
  }
}
