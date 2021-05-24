class DetailOptions {
  String _name = '';
  int _cost = 0;

  DetailOptions() {
    _name = '';
    _cost = 0;
  }

  DetailOptions.parameterized(String name, int cost) {
    _name = name;
    _cost = cost;
  }

  void setName(String name) {
    _name = name;
  }

  String getName() {
    return _name;
  }

  void setCost(int cost) {
    _cost = cost;
  }

  int getCost() {
    return _cost;
  }

  String toString() {
    return _name + ' ' + _cost.toString() + '\n';
  }
}
