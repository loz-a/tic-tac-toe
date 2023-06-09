import 'package:test/test.dart';
import 'package:tic_tac_toe.dart/src/model/config.dart';
import 'package:tic_tac_toe.dart/src/model/grid/cell/coords.dart';
import 'package:tic_tac_toe.dart/src/model/grid/exception/cell_already_marked.dart';
import 'package:tic_tac_toe.dart/src/model/grid/grid.dart';
import 'package:tic_tac_toe.dart/src/model/player/mark.dart';

void main() {
  late Grid grid;
  void initGrid() {
    grid = Grid(
        config: Config(
            cellQtyInLine: 3,
            sideWidth: 3
        )
    );
  }

  group('grid initialization:', () {
    setUp(() => initGrid());

    test('test cell length', () {
      grid.cells.length;
      expect(grid.cells.length, grid.config.cellQtyInLine * grid.config.cellQtyInLine);
    });

    test('test get3 cells for Xs', () {
      grid
          ..setCellValue(Coords(x: 1, y: 1), Mark.Xs)
          ..setCellValue(Coords(x: 2, y: 2), Mark.Xs)
          ..setCellValue(Coords(x: 3, y: 3), Mark.Xs);

      var cells = grid.getCellsForMark(Mark.Xs);
      expect(cells.length, 3);
    });
  });

  group('test win process:', () {
    setUp(() => initGrid());

    test('test full 1a-3c diagonal', () {
      grid
        ..setCellValue(Coords(x: 1, y: 1), Mark.Xs)
        ..setCellValue(Coords(x: 2, y: 2), Mark.Xs)
        ..setCellValue(Coords(x: 3, y: 3), Mark.Xs);

      var result = grid.isWinner(Mark.Xs);
      expect(result, true);
    });

    test('test full 1c-3a diagonal', () {
      grid
        ..setCellValue(Coords(x: 3, y: 1), Mark.Xs)
        ..setCellValue(Coords(x: 2, y: 2), Mark.Xs)
        ..setCellValue(Coords(x: 1, y: 3), Mark.Xs);

      var result = grid.isWinner(Mark.Xs);
      expect(result, true);
    });

    test('Test full horizontal', () {
      grid
        ..setCellValue(Coords(x: 1, y: 1), Mark.Xs)
        ..setCellValue(Coords(x: 2, y: 1), Mark.Xs)
        ..setCellValue(Coords(x: 3, y: 1), Mark.Xs);

      var result = grid.isWinner(Mark.Xs);
      expect(result, true);
    });

    test('Test full vertical', () {
      grid
        ..setCellValue(Coords(x: 1, y: 1), Mark.Xs)
        ..setCellValue(Coords(x: 1, y: 2), Mark.Xs)
        ..setCellValue(Coords(x: 1, y: 3), Mark.Xs);

      var result = grid.isWinner(Mark.Xs);
      expect(result, true);
    });

    test('test three moves', () {
      grid
        ..setCellValue(Coords(x: 2, y: 1), Mark.Xs)
        ..setCellValue(Coords(x: 3, y: 1), Mark.Xs)
        ..setCellValue(Coords(x: 3, y: 2), Mark.Xs);

      var result = grid.isWinner(Mark.Xs);
      expect(result, false);
    });

    test('test no more moves', () {
      grid
        ..setCellValue(Coords(x: 1, y: 1), Mark.Xs)
        ..setCellValue(Coords(x: 1, y: 2), Mark.Os)
        ..setCellValue(Coords(x: 1, y: 3), Mark.Xs)
        ..setCellValue(Coords(x: 2, y: 1), Mark.Os)
        ..setCellValue(Coords(x: 2, y: 2), Mark.Xs)
        ..setCellValue(Coords(x: 2, y: 3), Mark.Os)
        ..setCellValue(Coords(x: 3, y: 1), Mark.Os)
        ..setCellValue(Coords(x: 3, y: 2), Mark.Xs)
        ..setCellValue(Coords(x: 3, y: 3), Mark.Os);

      expect(grid.noMoveAvailable(), true);
      expect(grid.isWinner(Mark.Xs), false);
      expect(grid.isWinner(Mark.Os), false);
    });

    test('test double move in the same cell', () {
      var coords = Coords(x: 2, y: 1);
      grid.setCellValue(coords, Mark.Xs);
      var source = grid
          .cells
          .values
          .firstWhere((cell) => cell.coords.x == coords.x && cell.coords.y == coords.y);

      expect(
        () => grid.setCellValue(coords, Mark.Os),
        throwsA(
          predicate(
            (x) => x is CellAlreadyMarkedException && x.source == source
          )
        )
        // throwsA(isA<CellAlreadyMarkedException>())
      );

    });

  });
}