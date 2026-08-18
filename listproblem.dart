import "dart:io";

void main() {
  List<String> names = ["Ali", "Ahmed", "Usman", "Hamza", "Bilal"];
  print(names[0]);
  print(names[1]);
  print(names[2]);
  print(names[3]);
  print(names[4]);
  stdout.write("Enter the Name to search: ");
  String found = stdin.readLineSync()!;
  for (int i = 0; i < names.length; i++) {
    if (found == names[i]) {
      stdout.write("${names[i]} found.");
    }
  }
}
