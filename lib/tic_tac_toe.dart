import 'src/container.dart';
import 'src/game.dart';
import 'src/init.dart';
import 'src/model/state.dart';
import 'src/view/renderer/grid.dart';
import 'src/view/renderer/observer/render.dart';

void main() {

  init();
  var container = Container.getInstance();

  var state = container.get((State).toString()) as State;
  var gridRenderer = container.get((GridRenderer).toString()) as GridRenderer;

  Game(state)
    ..addObserver(Render(gridRenderer))
    ..render()
    ..start();
}
