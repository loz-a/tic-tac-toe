class Container {
  static final _self = Container._internal();
  final _instances = <String, Object>{};

  Container._internal();

  factory Container.getInstance() {
    return _self;
  }

  Object get(String name) {
    var instance = _instances[name];
    if (instance == null) {
      throw Exception('Could not retrieve instance of object $name');
    }
    return instance;
  }

  void set(String name, Object object) {
    _instances[name] = object;
  }
}