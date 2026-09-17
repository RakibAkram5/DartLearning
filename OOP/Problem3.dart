class Rectangle{
  double length;
  double width;
  Rectangle(this.length,this.width);
  double area(){
    return length*width;
  }
  double perimeter(){
    return (2*(length+width));
  }
  void display(){
    print("Length: $length");
    print("Width: $width");
    print("Area: ${area()}");
    print("Perimeter: ${perimeter()}");
  }
}
void main(){
  Rectangle r1=Rectangle(5.0,3.0);
  Rectangle r2=Rectangle(10.0,4.0);
  r1.display();
  r2.display();
}