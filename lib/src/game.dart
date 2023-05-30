import 'dart:async';
import 'dart:io';
import 'model/grid/cell/coords.dart';
import 'model/move/move.dart';
import 'model/move/validate.dart';
import 'model/player/mark.dart';
import 'model/state.dart';
import 'observer/abstract_observable.dart';
import 'observer/observable.dart';

class Game with Observable
    implements AbstractObservable
{
  final _movesStream = StreamController<Move>();
  final State _state;

  Game(this._state) {
    _movesStream.stream.listen(onMove);
  }

  void onMove(Move move) {
    _state.setMove(move);

    if (_state.grid.isWinner(move.mark)) {
      print('Congrats! You won. The winner is ${move.mark.name} ;)');
      exit(0);
    }

    if (_state.grid.noMoveAvailable()) {
      print('There are no moves available. Unfortunate nobody won :(');
      exit(0);
    }

    _state.currentPlayer.mark = _state.currentPlayer.mark == Mark.Os ? Mark.Xs : Mark.Os;
    print('Input Number and Letter to make a move (${_state.currentPlayer.mark.name}): (For example: 1a)');
    _processInput();
  }

  void start() {
    print('Input Number and Letter to make a move (${Mark.Xs.name}): (For example: 1a)');
    _processInput();
  }

  void render() {
    notifyObservers(null);
  }

  void _processInput() {
    String? input = stdin.readLineSync();

    try {
      validateMove(input);

      var move = Move(
          coords: Coords.fromString(input!),
          mark: _state.currentPlayer.mark
      );
      _movesStream.sink.add(move);

    } catch (e) {
      print(e);
      print('Input Number and Letter to make a move (${_state.currentPlayer.mark.name}): (For example: 1a)');
      _processInput();
    }
  }
}