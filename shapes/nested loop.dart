import "dart:io";

void main() {
  int n = 5;

  for (int rows = 1; rows <= n; rows++) {
    for (int cols = 1; cols <= n; cols++) {
      stdout.write("Rows: $rows, Cols: $cols");
    }
    stdout.write("\n");
  }
}