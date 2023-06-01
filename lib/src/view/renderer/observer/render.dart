import 'package:tic_tac_toe.dart/src/view/helper/clear_screen.dart';
import '../../../observer/observable.dart';
import '../../../observer/observer.dart';
import '../grid.dart';

class Render implements Observer {
  final GridRenderer _gridRenderer;
  Render(this._gridRenderer);

  @override
  void update(Observable observable, Object? args) {
    clearScreen();
    print(_gridRenderer.render());
  }
}