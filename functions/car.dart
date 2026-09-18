class Car {
  String brand;
  String model;
  int year;
  Car(this.brand, this.model, this.year);
  void display() {
    print("$brand, $model, $year");
  }
}

void main() {
  String brand = "Toyota";
  String model = "Corolla";
  int year = 2023;
  Car c1 = Car(brand, model, year);
  c1.display();
}
