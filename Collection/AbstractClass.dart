// ============================================
// ABSTRACT CLASS - Complete Example
// ============================================

// 'abstract' keyword class se pehle likha.
// Iska matlab: is class ka object NAHI ban sakta.
abstract class Vehicle {

  // Field (variable) - abstract class mein bhi ho sakti hai
  String brand;

  // Constructor - abstract class mein constructor ho sakta hai
  Vehicle(this.brand);

  // ABSTRACT METHOD - sirf declare, body nahi, semicolon pe khatam
  // Child class ko yeh MUST implement karna hoga
  void start();

  // ABSTRACT METHOD - doosra abstract method
  void stop();

  // NORMAL METHOD - body ke saath
  // Child class isay inherit kar legi, override karna optional hai
  void displayInfo() {
    print("Brand: $brand");
  }
}

// ============================================
// CHILD CLASS 1 - Car
// ============================================

// 'extends' se Vehicle ko inherit kiya
class Car extends Vehicle {

  // Child class ka apna field
  int numberOfDoors;

  // Constructor
  // 'super(brand)' se parent (Vehicle) ka constructor call kiya
  Car(String brand, this.numberOfDoors) : super(brand);

  // '@override' batata hai ke hum parent ka abstract method implement kar rahe hain
  @override
  void start() {
    print("Car starts with key: Vroom Vroom");
  }

  @override
  void stop() {
    print("Car stops with brake pedal");
  }
}

// ============================================
// CHILD CLASS 2 - Bike
// ============================================

class Bike extends Vehicle {

  bool hasKickStart;

  Bike(String brand, this.hasKickStart) : super(brand);

  @override
  void start() {
    // Child apne hisaab se implement kar raha hai
    if (hasKickStart) {
      print("Bike starts with kick: Dhak Dhak");
    } else {
      print("Bike starts with self button");
    }
  }

  @override
  void stop() {
    print("Bike stops with hand brake");
  }
}

// ============================================
// MAIN FUNCTION
// ============================================

void main() {

  // ❌ YEH GALAT HAI - abstract class ka object nahi ban sakta
  // Vehicle v = Vehicle("Toyota"); // ERROR!

  // ✅ YEH SAHI HAI - child class ka object banaya
  Car car = Car("Toyota", 4);
  car.displayInfo();   // Normal method inherit hua
  car.start();         // Car ka apna start
  car.stop();          // Car ka apna stop

  print("---");

  Bike bike = Bike("Honda", true);
  bike.displayInfo();
  bike.start();
  bike.stop();

  print("---");

  // ✅ POLYMORPHISM - parent reference, child object
  // Abstract class ka reference variable ban sakta hai
  Vehicle v1 = Car("Suzuki", 4);
  Vehicle v2 = Bike("Yamaha", false);

  v1.start(); // Car ka start chalega
  v2.start(); // Bike ka start chalega

  // Yeh list bhi ban sakti hai - sab Vehicle type ki
  List<Vehicle> vehicles = [car, bike, v1, v2];
  print("\nTotal vehicles: ${vehicles.length}");
}