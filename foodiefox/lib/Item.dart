class Item {
  String _name = '';
  String _quantity = '';
  String _description = '';
  int _cost = 0;

  Item() {
    _name = '';
    _quantity = '';
    _cost = 0;
    _description = '';
  }

  Item.parameterized(
      String name, String quantity, String description, int cost) {
    _name = name;
    _quantity = quantity;
    _description = description;
    _cost = cost;
  }

  void setName(String name) {
    _name = name;
  }

  void setQuantity(String quantity) {
    _quantity = quantity;
  }

  void setDescription(String description) {
    _description = description;
  }

  void setCost(int cost) {
    _cost = cost;
  }

  String getName() {
    return _name;
  }

  String getQuantity() {
    return _quantity;
  }

  String getDescription() {
    return _description;
  }

  int getCost() {
    return _cost;
  }

  String toString() {
    return _name +
        ' ' +
        _quantity +
        ' ' +
        _description +
        ' ' +
        _cost.toString() +
        '\n';
  }
}
