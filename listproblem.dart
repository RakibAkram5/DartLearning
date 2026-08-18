import "dart:io";

void main() {
  List<String> names = ["Ali", "Ahmed", "Usman", "Hamza", "Bilal"];
  print(names[0]);
  print(names[1]);
  print(names[2]);
  print(names[3]);
  print(names[4]);
  stdout.write("Enter the Name to search: ");
  int count = 0;
  int frequency = 0;
  String found = stdin.readLineSync()!;
  for (int i = 0; i < names.length; i++) {
    if (found == names[i]) {
      stdout.write("${names[i]} found.");
    }
    count++;
  }
  stdout.write("Enter the Name to find its Frequency: ");
  String name = stdin.readLineSync()!;
  for (int i = 0; i < names.length; i++) {
    if (names[i] == name) {
      frequency++;
    }
  }
  stdout.write("$name appears $frequency times.");
  stdout.write("\n Total Name: $count");
}
