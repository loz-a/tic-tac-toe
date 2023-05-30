import '../observer/abstract_observable.dart';
import '../observer/observable.dart';
import 'grid/grid.dart';
import 'move/move.dart';
import 'player/current_player.dart';

class State with Observable
    implements AbstractObservable
{
  late final CurrentPlayer currentPlayer;
  late final Grid grid;

  State(this.currentPlayer, this.grid);

  void setMove(Move move) {
    notifyObservers(move);
  }
}