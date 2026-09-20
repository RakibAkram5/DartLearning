class Shape {
  double area() {
    return 0;
  }
}

class Circle extends Shape {
  double radius;
  Circle(this.radius);

  @override
  double area() {
    return 3.14 * radius * radius;
  }
}

class Rectangle extends Shape {
  double length, width;
  Rectangle(this.length, this.width);

  @override
  double area() {
    return length * width;
  }
}

class Triangle extends Shape {
  double base, height;
  Triangle(this.base, this.height);

  @override
  double area() {
    return 0.5 * base * height;
  }
}

void main() {
  List<Shape> shapes = [
    Circle(5),
    Rectangle(6, 4),
    Triangle(5, 4),
  ];

  for (var shape in shapes) {
    print("Area: ${shape.area()}");
  }
}