import "dart:io";

void main() {
  // for (int i = 0; i <= 10; i++) {
  //   print("i: $i");
  // }
  stdout.write("Enter the Number: ");
  int number = int.parse(stdin.readLineSync()!);
  for (int i = 1; i <= 10; i++) {
    // O(n)
    int multiplication = number * i;
    print("$number X $i = $multiplication");
  }
}
