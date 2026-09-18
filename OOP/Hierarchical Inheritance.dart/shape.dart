class Shape {
  void display() {
    print("This is a shape.");
  }
}

class Circle extends Shape {
  double radius;
  Circle(this.radius);

  double area() => 3.14 * radius * radius;
}

class Rectangle extends Shape {
  double length, width;
  Rectangle(this.length, this.width);

  double area() => length * width;
}

void main() {
  Circle c = Circle(5);
  c.display();
  print("Circle Area: ${c.area()}");

  Rectangle r = Rectangle(4, 6);
  r.display();
  print("Rectangle Area: ${r.area()}");
}