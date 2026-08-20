import "dart:io";

void main() {
  int year;
  stdout.write("Enter Year: ");
  year = int.parse(stdin.readLineSync()!);
  if (year % 4 == 0) {
    print("$year is leap year.");
  } else {
    print("$year not a leap Year.");
  }
}
