import 'dart:io';

class Animal {
  String name;
  Animal(this.name);
  void eat() {
    stdout.write("$name is Eating.");
  }
}

class Dog extends Animal {
  Dog(String name) : super(name); // must forward name to Animal's constructor

  void barking() {
    stdout.write("\n$name is Barking.");
  }
}

void main() {
  Dog dog = Dog("Rex");
  dog.eat();
  dog.barking();
}