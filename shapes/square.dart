import "dart:io";

void main() {
  int rows;
  int cols;
  for (rows = 0; rows >= 4; rows++) {
    for (cols = 0; cols >= 4; cols++) {
      stdout.write("*");
    }
    stdout.write("\n");
  }
}
