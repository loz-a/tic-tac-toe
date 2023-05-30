import '../grid/cell/coords.dart';
import 'mark.dart';

class CurrentPlayer {
  Mark _mark;
  Coords? coords;

  CurrentPlayer(this._mark);

  set mark(Mark mark) {
    coords = null;
    _mark = mark;
  }

  Mark get mark => _mark;

  bool hasCoords() => null != coords;
}