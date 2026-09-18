import 'dart:io';

class Vehicle {
  String _brand;
  double _speed;

  Vehicle(this._brand, this._speed);

  void start() {
    stdout.write("Vehicle is Starting.\n");
  }

  void setBrand(String brand) {
    _brand = brand;
  }

  void setSpeed(double speed) {
    _speed = speed;
  }

  String getBrand() => _brand;
  double getSpeed() => _speed;
}

class Car extends Vehicle {
  Car(String brand, double speed) : super(brand, speed);

  void drive() {
    stdout.write("${getBrand()} is driving.\n");
  }
}

void main() {
  Car c = Car("Toyota", 120.0);
  c.start();
  c.drive();
}