import 'DetailTitle.dart';

class Item {
  String _name = '';
  String _description = '';
  String _size = '';
  int _cost = 0;
  String _rating = '';
  String _placeHolder = '';
  List<DetailTitle> detailTitle = [];

  Item() {
    _name = '';
    _description = '';
    _size = '';
    _cost = 0;
    _rating = '';
    _placeHolder = '';
  }

  Item.parameterized(String name, String detail, String size, int cost,
      String rating, String placeHolder) {
    _name = name;
    _description = detail;
    _size = size;
    _cost = cost;
    _rating = rating;
    _placeHolder = placeHolder;
  }

  void setName(String name) {
    _name = name;
  }

  void setDetail(String detail) {
    _description = detail;
  }

  void setsize(String size) {
    _size = size;
  }

  void setCost(int cost) {
    _cost = cost;
  }

  void setRating(String rating) {
    _rating = rating;
  }

  void setPlaceHolder(String placeHolder) {
    _placeHolder = placeHolder;
  }

  String getsize() {
    return _size;
  }

  int getCost() {
    return _cost;
  }

  String getName() {
    return _name;
  }

  String getDetail() {
    return _description;
  }

  String getRating() {
    return _rating;
  }

  String getPlaceHolder() {
    return _placeHolder;
  }

  String toString() {
    return _name +
        ' ' +
        _description +
        ' ' +
        _size +
        ' ' +
        _cost.toString() +
        ' ' +
        this._rating +
        ' ' +
        this._placeHolder +
        '\n';
  }
}
