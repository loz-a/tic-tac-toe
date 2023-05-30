import 'package:test/test.dart';

import '../../model/config.dart';
import '../../observer/abstract_observable.dart';
import '../../observer/observable.dart';
import '../player/mark.dart';
import 'cell.dart';
import 'cell/coords.dart';
import 'line_coord.dart';

class Grid with Observable
  implements AbstractObservable
{
  late final Config config;
  final Map<String, Cell> cells = {};
  Mark? winner;

  Grid({
    required this.config
  }) {
    init();
  }

  void init() {
    var codeUnitStart = 'a'.codeUnitAt(0);

    for (int idxVer = 0; idxVer < config.cellQtyInLine; idxVer++) {
      for (int idxHor = 0; idxHor < config.cellQtyInLine; idxHor++) {
        int x = idxHor + 1, y = idxVer + 1;
        var cell = Cell(
            coords: Coords(x: x, y: y),
            titleLetter: String.fromCharCode(codeUnitStart + idxHor)
        );
        cells['$x.$y'] = cell;
      }
    }
  }

  void setCellValue(Coords coords, Mark mark) {
    cells['${coords.x}.${coords.y}']?.value = mark;
    notifyObservers(null);

    var selectedCells = getCellsForMark(mark);
    var isWon = isFullDiagonal(selectedCells)
        || isFullVertical(selectedCells, coords.x)
        || isFullHorizontal(selectedCells, coords.y);

    if (isWon) winner = mark;
  }

  bool noMoveAvailable() {
    var cells = this.cells.values.where((cell) => cell.value != null);
    return cells.length == config.sideWidth * config.sideWidth;
  }

  bool isWinner(Mark mark) => winner == mark;

  Iterable<Cell> getCellsForMark(Mark mark) => this.cells.values.where((cell) => cell.value == mark);

  bool isFullDiagonal(Iterable<Cell> cells) {
    var isDiagonal = cells.where((cell) => cell.coords.x == cell.coords.y).length == config.sideWidth;
    if (!isDiagonal) {
      var xList = [ for (var i = config.sideWidth; i >= 1; i--) i ];
      for (var i = 1; i <= config.sideWidth; i++) {
        var isCellExists = cells.any(
                (cell) => cell.coords.x == xList[i - 1] && cell.coords.y == i);

        if (!isCellExists) return false;
        else isDiagonal = true;
      }
    }
    return isDiagonal;
  }

  bool isFullVertical(Iterable<Cell> cells, int lineNum) {
    return cells.where((cell) => cell.coords.x == lineNum).length == config.sideWidth;
  }

  bool isFullHorizontal(Iterable<Cell> cells, int lineNum) {
    return cells.where((cell) => cell.coords.y == lineNum).length == config.sideWidth;
  }
}