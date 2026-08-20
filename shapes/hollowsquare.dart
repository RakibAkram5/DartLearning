import "dart:io";

void main() {
  int n = 4;
  for (int rows = 0; rows < n; rows++) {
    for (int cols = 0; cols < n; cols++) {
      if (rows == 0 || rows == n - 1 || cols == 0 || cols == n - 1) {
        stdout.write("*");
      } else {
        stdout.write(" ");
      }
    }
    stdout.write("\n");
  }
}
