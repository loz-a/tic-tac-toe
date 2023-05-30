import 'container.dart';
import 'model/config.dart';
import 'model/grid/grid.dart';
import 'model/grid/observer/update_cell_value.dart';
import 'model/player/current_player.dart';
import 'model/player/mark.dart';
import 'model/state.dart';
import 'view/renderer/grid.dart';

void init() {

  var container = Container.getInstance();

  var config = Config(
      cellQtyInLine: 3,
      sideWidth: 3
  );
  container.set((Config).toString(), config);

  var grid = Grid(config: config);
  var gridRenderer = GridRenderer(grid: grid, config: config);

  container.set((Grid).toString(), grid);
  container.set((GridRenderer).toString(), gridRenderer);

  var currentPlayer = CurrentPlayer(Mark.Xs);
  var state = State(currentPlayer, grid);

  state.addObserver(UpdateCellValue(grid));
  container.set((State).toString(), state);
}