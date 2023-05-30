import '../grid/cell/coords.dart';
import '../player/mark.dart';

class Move {
  final Mark mark;
  final Coords coords;

  Move({
    required this.mark,
    required this.coords
  });

  @override
  String toString() {
    return 'Coords: x:${coords.x}, y:${coords.y}. Player: ${mark.name}';
  }
}