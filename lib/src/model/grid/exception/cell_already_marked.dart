import 'package:tic_tac_toe.dart/src/model/grid/cell.dart';

class CellAlreadyMarkedException implements Exception {
  final Cell source;

  const CellAlreadyMarkedException(this.source);

  @override
  String toString() => 'Cell ${source.coords.x}${source.titleLetter} is already marked';
}