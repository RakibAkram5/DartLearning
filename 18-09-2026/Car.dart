class Vehicle {
  String brand;
  double speed;

  // Parent class constructor
  Vehicle(this.brand, this.speed);

  // Display vehicle information
  void display() {
    print("Brand: $brand");
    print("Speed: $speed km/h");
  }

  // Move method
  void move() {
    print("$brand is moving at $speed km/h");
  }
}

class Car extends Vehicle {
  int numberOfDoors;

  // Child class constructor
  Car(String brand, double speed, this.numberOfDoors) : super(brand, speed);

  // Override display method
  @override
  void display() {
    super.display();
    print("Number of Doors: $numberOfDoors");
  }

  // New method for Car
  void honk() {
    print("$brand car is honking: Beep Beep!");
  }
}

void main() {
  // Vehicle object
  Vehicle vehicle = Vehicle("Generic", 80.0);

  vehicle.display();

  print("");

  vehicle.move();

  print("");

  // Car object
  Car car = Car("Toyota", 120.0, 4);

  car.display();

  print("");

  car.move();

  print("");

  car.honk();
}
