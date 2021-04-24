import 'BusinessHour.dart';
import 'Category.dart';

class Restaurant {
  String _name = '';
  String _address = '';
  String _type = '';
  BusinessHour hours = BusinessHour();
  List<Category> categories = [];

  Restaurant() {
    _name = '';
    _address = '';
    _type = '';
  }

  Restaurant.parameterized(String name, String address, String type) {
    _name = name;
    _address = address;
    _type = type;
  }

  void setName(String name) {
    _name = name;
  }

  void setAddress(String address) {
    _address = address;
  }

  void setType(String type) {
    _type = type;
  }

  String getName() {
    return _name;
  }

  String getAddress() {
    return _address;
  }

  String getType() {
    return _type;
  }

  String toString() {
    return this._name + ' ' + this._address + ' ' + this._type + '\n';
  }
}
