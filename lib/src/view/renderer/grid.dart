import '../../model/config.dart';
import '../../model/grid/cell.dart';
import '../../model/grid/grid.dart';
import 'observer/render.dart';

class GridRenderer {
  final Grid grid;
  final Config config;

  GridRenderer({ required this.grid, required this.config }) {
    grid.addObserver(Render(this));
  }

  StringBuffer render() {
    var result = StringBuffer();

    _writeLetters(result);

    for (int idxVer = 0; idxVer < config.cellQtyInLine; idxVer++) {
      int idxHor = 0;
      int lineCount = 0;

      while (idxHor < config.cellQtyInLine) {

        var cell = _getCellByCoords(idxVer + 1, idxHor + 1);

        bool isLastLine = lineCount == config.sideWidth - 1;
        bool isLastRowOfCells = idxVer == config.cellQtyInLine - 1;
        bool isMiddleLine = lineCount == (config.sideWidth / 2).floor();

        // it prints first letter of each cell
        if (idxHor == 0) {
          String firstSymbol = isMiddleLine ? cell.coords.x.toString() + ' ' : config.lineSymbol;
          result.write(firstSymbol);
        }

        if (isLastLine && !isLastRowOfCells) {
          result.write(config.horizontalBorder * config.sideWidth);
        } else {
          if (isMiddleLine) {
            int sidePad = (config.sideWidth / 2).floor();
            var mark = null == cell.value ? config.lineSymbol : cell.value!.SymbolToPrint;
            result.write(config.lineSymbol * sidePad + mark + config.lineSymbol * sidePad);
          } else {
            result.write(config.lineSymbol * config.sideWidth);
          }
        }

        bool isLastColumnOfCells = idxHor < config.cellQtyInLine - 1;
        if (isLastColumnOfCells) {
          result.write(config.verticalBorder);
        } else {
          result.writeln();
        }

        idxHor++;
        bool isEndColumnOfCells = idxHor == config.cellQtyInLine;
        if (isEndColumnOfCells) {
          idxHor = 0;
          lineCount++;
        }

        bool isLastLineInRowOfCells = lineCount == config.sideWidth;
        if (isLastLineInRowOfCells) {
          break;
        }
      }
    }

    return result;
  }

  Cell _getCellByCoords(int x, int y) {
    var cell = grid.cells['$x.$y'];
    if (cell == null) {
      throw 'Invalid cell state';
    }
    return cell;
  }

  void _writeLetters(StringBuffer sb) {
    var letter = 'a';
    for (int idxG = 1; idxG <= config.cellQtyInLine; idxG++) {
      if (idxG == 1) sb.write('    $letter');
      else {
        letter = String.fromCharCode(letter.codeUnitAt(0) + 1);
        sb.write(' ' * 6 + letter);
      }
    }
    sb.writeln();
  }
}