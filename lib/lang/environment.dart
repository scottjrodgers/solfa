import './language_objects.dart';

class Environment {
  final Map<String, SFBase> _scope = {};
  Environment? parent;

  Environment({this.parent});

  /// finds and returns the value associated with the given key (name)
  dynamic get(String key) {
    if (_scope.containsKey(key)) {
      return _scope[key];
    } else if (parent != null) {
      return parent!.get(key);
    } else {
      return null;
    }
  }

  /// assigns a value to a name (key) in the local scope (this environment)
  void def(String key, SFBase value) {
    _scope[key] = value;
  }

  /// setBang
  /// - Sets the value of a key in the first environment it's found in.
  /// - If not found, it's created in the global scope
  /// key: String - the name of the value to set
  /// value: The value to be stored
  void set(String key, dynamic value) {
    Environment e = this;
    while (e.parent != null) {
      if (e._scope.containsKey(key)) {
        e.def(key, value);
        return;
      }
      e = e.parent!;
    }
    def(key, value);
  }

  /// setBang
  /// - Sets the value of a key in the first environment it's found in.
  /// - If not found, it's created in the global scope
  /// key: String - the name of the value to set
  /// value: The value to be stored
  void setBang(String key, dynamic value) {
    Environment e = this;
    while (e.parent != null) {
      if (e._scope.containsKey(key)) {
        e.def(key, value);
        return;
      }
      e = e.parent!;
    }
    e.def(key, value);
  }
}
