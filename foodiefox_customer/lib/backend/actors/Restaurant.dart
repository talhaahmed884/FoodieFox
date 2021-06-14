import 'package:foodiefox_customer/backend/components/BusinessHour.dart';
import 'package:foodiefox_customer/backend/components/Category.dart';

class Restaurant {
  String _name = '';
  String _address = '';
  String _type = '';
  String _placeHolder = '';
  String _rating = '';
  BusinessHour hours = BusinessHour();
  List<Category> categories = [];

  Restaurant() {
    _name = '';
    _address = '';
    _type = '';
    _placeHolder = '';
    _rating = '';
  }

  Restaurant.parameterized(String name, String address, String type,
      String placeHolder, String rating) {
    _name = name;
    _address = address;
    _type = type;
    _placeHolder = placeHolder;
    _rating = rating;
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

  void setPlaceHolder(String placeHolder) {
    _placeHolder = placeHolder;
  }

  void setRating(String rating) {
    _rating = rating;
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

  String getPlaceHolder() {
    return _placeHolder;
  }

  String getRating() {
    return _rating;
  }

  String toString() {
    return this._name +
        ' ' +
        this._address +
        ' ' +
        this._type +
        ' ' +
        this._placeHolder +
        ' ' +
        this._rating +
        '\n';
  }
}
