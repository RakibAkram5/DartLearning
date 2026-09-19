class Animal {
  String name;
  int age;

  // Parent class constructor
  Animal(this.name, this.age);

  // Display animal information
  void display() {
    print("Name: $name");
    print("Age: $age");
  }

  // Generic sound
  void makeSound() {
    print("Some generic animal sound");
  }
}

class Dog extends Animal {
  String breed;

  // Dog constructor
  Dog(String name, int age, this.breed)
      : super(name, age);

  // Override display()
  @override
  void display() {
    super.display();
    print("Breed: $breed");
  }

  // Override makeSound()
  @override
  void makeSound() {
    super.makeSound();
    print("Woof! Woof!");
  }
}

class Cat extends Animal {
  String color;

  // Cat constructor
  Cat(String name, int age, this.color)
      : super(name, age);

  // Override display()
  @override
  void display() {
    super.display();
    print("Color: $color");
  }

  // Override makeSound()
  @override
  void makeSound() {
    print("Meow! Meow!");
  }
}

void main() {
  // Animal object
  Animal animal = Animal("Generic Animal", 5);

  animal.display();

  print("");

  animal.makeSound();

  print("");

  // Dog object
  Dog dog = Dog("Tommy", 3, "Labrador");

  dog.display();

  print("");

  dog.makeSound();

  print("");

  // Cat object
  Cat cat = Cat("Kitty", 2, "White");

  cat.display();

  print("");

  cat.makeSound();
}