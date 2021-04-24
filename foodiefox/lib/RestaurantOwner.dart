class RestaurantOwner {
  String _name = '';
  String _email = '';
  String _cellNo = '';
  List<String> _restaurantID = [];

  RestaurantOwner() {
    _name = '';
    _email = '';
    _cellNo = '';
  }

  RestaurantOwner.parameterized(String name, String email, String cellNo) {
    _name = name;
    _email = email;
    _cellNo = cellNo;
  }

  void setName(String name) {
    _name = name;
  }

  String getName() {
    return _name;
  }

  void setEmail(String email) {
    _email = email;
  }

  String getEmail() {
    return _email;
  }

  void setCellNo(String cellNo) {
    _cellNo = cellNo;
  }

  String getCellNo() {
    return _cellNo;
  }

  void addRestaurant(String id) {
    _restaurantID.add(id);
  }

  List<String> getRestaurant() {
    return _restaurantID;
  }

  String toString() {
    return _name + ' ' + _email + ' ' + _cellNo + '\n';
  }
}
