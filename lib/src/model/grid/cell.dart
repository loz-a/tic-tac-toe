import '../player/mark.dart';
import 'cell/coords.dart';

class Cell {
  late final Coords coords;
  late final String titleLetter;
  Mark? value;

  Cell({
    required this.coords,
    required this.titleLetter,
    this.value = null
  });

  bool isMarked() {
    return value != null;
  }
}