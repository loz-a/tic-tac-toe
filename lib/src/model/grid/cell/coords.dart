import '../line_coord.dart';

class Coords {
  final  int x;
  final int y;

  const Coords({required this.x, required this.y});

  Coords.fromString(String input):
    this(
      x: int.parse(input[0]),
      y: input[1].codeUnitAt(0) - 'a'.codeUnitAt(0) + 1
    );

  Map<String, int> toJson() => {
    LineCoord.x.name: x,
    LineCoord.y.name: y
  };

  int by(LineCoord lineCoord) {
    var json = toJson();
    if (!json.keys.contains(lineCoord.name)) {
      throw 'An invalid coordinate has been provided: ${lineCoord.name}';
    }
    return json[lineCoord.name]!;
  }
}