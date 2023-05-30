import 'observer.dart';

abstract class AbstractObservable {
  void addObserver(Observer observer);
  void notifyObservers(Object args);
}