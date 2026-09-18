import "dart:io";

void main() {
  List<int> stack = [];
  // Push
  stack.add(10);
  stack.add(20);
  stack.add(30);
  stack.add(40);
  stack.add(50);
  for (int i = 0; i < stack.length; i++) {
    stdout.write("Stack[$i]: ${stack[i]}\n");
  }
  // top of stack
  print("Top of Stack: ${stack.last}");
  // pop
  int removed = stack.removeLast();
  print("Pop: $removed");
}
