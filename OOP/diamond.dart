class A {
  void show() {
    print("A");
  }
}

class B extends A {
  @override
  void show() {
    print("B");
  }

}
class C extends A{
  @override
  print("C");
}
