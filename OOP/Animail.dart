class Animal {
  void eat() {
    print("Animal is eating");
  }

  void sleep() {
    print("Animal is sleeping");
  }
}

class Dog extends Animal {
  void bark() {
    print("Dog is barking");
  }
}

void main() {
  Dog dog = Dog();

  dog.eat();
  dog.sleep();
  dog.bark();
}