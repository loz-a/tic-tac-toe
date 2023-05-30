import '../../../observer/observable.dart';
import '../../../observer/observer.dart';
import '../grid.dart';

class Render implements Observer {
  final GridRenderer _gridRenderer;
  Render(this._gridRenderer);

  @override
  void update(Observable observable, Object? args) {
    print(_gridRenderer.render());
  }
}