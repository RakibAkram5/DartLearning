class Car {
  String brand;
  String model;
  double price;

  Car(this.brand, this.model, this.price);

  void displayCar() {
    print("Brand: $brand");
    print("Model: $model");
    print("Price: $price");
  }
}

void main() {
  Car car1 = Car("Toyota", "Corolla", 7500000);

  car1.displayCar();
}