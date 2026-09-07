import 'dart:io';

class Vehicle {
  void start() {
    print("Vehicle is starting");
  }
}

class Car extends Vehicle {
  @override
  void start() {
    print("Car starts with button.");
  }
}

class Bike extends Vehicle {
  @override
  void start() {
    print("Bike Starts with kick");
  }
}

void main() {
  Vehicle v1 = Car();
  Vehicle v2 = Bike();
  v1.start();
  v2.start();
}
