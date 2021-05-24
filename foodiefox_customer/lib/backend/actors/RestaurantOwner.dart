class RestaurantOwner {
  String _email = '';
  List<String> restaurantID = [];

  RestaurantOwner() {
    _email = '';
  }

  RestaurantOwner.parameterized(String email) {
    _email = email;
  }

  void setEmail(String email) {
    _email = email;
  }

  String getEmail() {
    return _email;
  }

  String toString() {
    return _email + '\n';
  }
}
