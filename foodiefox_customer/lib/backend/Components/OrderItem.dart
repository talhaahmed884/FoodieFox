import 'DetailTitle.dart';

class OrderItem {
  String _name = '';
  int _quantity = 0;
  int _cost = 0;
  List<DetailTitle> detailTitle = [];

  OrderItem() {
    _name = '';
    _quantity = 0;
    _cost = 0;
  }

  OrderItem.parameterized(String name, int quantity, int cost) {
    _name = name;
    _quantity = quantity;
    _cost = cost;
  }

  void setName(String name) {
    _name = name;
  }

  String getName() {
    return _name;
  }

  void setQuantity(int quantity) {
    _quantity = quantity;
  }

  int getQuantity() {
    return _quantity;
  }

  void setCost(int cost) {
    _cost = cost;
  }

  int getCost() {
    return _cost;
  }

  String toString() {
    return _name + ' ' + _quantity.toString() + ' ' + _cost.toString() + '\n';
  }
}
