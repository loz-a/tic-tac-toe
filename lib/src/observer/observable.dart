import 'observer.dart';

mixin Observable {
  final List<Observer> _observers = [];

  void addObserver(Observer observer) {
    if (!_observers.contains(observer)) _observers.add(observer);
  }

  void notifyObservers(Object? args) {
    for (var observer in _observers) observer.update(this, args);
  }
}