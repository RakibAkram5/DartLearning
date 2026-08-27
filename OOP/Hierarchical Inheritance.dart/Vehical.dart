class Vehicle {
  void start() {
    print("Vehicle is starting...");
  }
}

class Car extends Vehicle {
  void drive() {
    print("Car is driving on the road.");
  }
}

class Bike extends Vehicle {
  void ride() {
    print("Bike is being ridden.");
  }
}

void main() {
  Car car = Car();
  car.start();
  car.drive();

  Bike bike = Bike();
  bike.start();
  bike.ride();
}