import 'observable.dart';

abstract class Observer {
  void update(Observable observable, Object? args);
}