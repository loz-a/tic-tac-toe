import 'dart:math';

class Bicycle {
  int cadence = 0;
  int _speed = 0;
  int get speed => _speed;
  int gear = 0;

  Bicycle(this.cadence, this.gear);

  void applyBrake(int decrement) {
    _speed -= decrement;
  }

  void speedUp(int decrement) {
    _speed += decrement;
  }

  @override
  String toString() => 'Bicycle: $_speed mph';
}

class Rectangle {
  int width = 0;
  int height = 0;
  Point origin;

  Rectangle ({this.origin = const Point(0, 0), this.width = 0,  this.height = 0});

  @override
  String toString() => 'Origin: (${origin.x}, ${origin.y}), width: $width, height: $height';
}

enum ShapeType { circle, square }

abstract class Shape {
  factory Shape(ShapeType type) {
    if (type == ShapeType.circle) return Circle(2);
    if (type == ShapeType.square) return Square(2);
    throw 'Can\'t create $type.';
  }
  num get area;
}

class Circle implements Shape {
  final num radius;
  Circle(this.radius);
  num get area => pi * pow(radius, 2);
}

class Square implements Shape {
  final num side;
  Square(this.side);
  num get area => pow(side, 2);
}

void main() {
  // final bike = Bicycle(2, 1);
  // print(bike);
  //
  // print(Rectangle(origin: const Point(10, 20), width: 100, height: 200));
  // print(Rectangle(origin: const Point(10, 10)));
  // print(Rectangle(width: 200));
  // print(Rectangle());

  try {
    final circle = Shape(ShapeType.circle);
    final square = Shape(ShapeType.square);
    print(circle.area);
    print(square.area);
  }
  catch (err) {
    print(err);
  }

}