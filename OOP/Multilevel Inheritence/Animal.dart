import 'dart:io';

class Animal {
  void eat() {
    stdout.write("\nAnimal is Eating.");
  }
}

class Dog extends Animal {
  void bark() {
    stdout.write("\nDog is Barking.");
  }
}

class Puppy extends Dog {
  void play() {
    stdout.write("\nPuppy is Playing.");
  }
}

void main() {
  Puppy puppy = Puppy();

  puppy.eat();
  puppy.bark();
  puppy.play();
}