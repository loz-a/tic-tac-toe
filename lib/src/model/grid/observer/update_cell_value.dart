import '../../../observer/observable.dart';
import '../../../observer/observer.dart';
import '../../move/move.dart';
import '../grid.dart';

class UpdateCellValue implements Observer {
  final Grid _grid;

  UpdateCellValue(this._grid);

  @override
  void update(Observable observable, Object? args) {
    if (args is! Move) return;
    _grid.setCellValue(args.coords, args.mark);
  }
}