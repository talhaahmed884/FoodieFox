import 'Item.dart';

class Category {
  String _name = '';
  List<Item> items = [];

  Category() {
    _name = '';
  }

  Category.parameterized(String name) {
    _name = name;
  }

  void setName(String name) {
    _name = name;
  }

  String getName() {
    return _name;
  }

  String toString() {
    return _name + '\n';
  }
}
