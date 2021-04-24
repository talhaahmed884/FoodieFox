import 'Restaurant.dart';
import 'RestaurantOwner.dart';
import 'ResturantDB.dart';

class RestaurantOwnerDB implements ResturantDB {
  void addOwner(RestaurantOwner owner) {}

  bool ownerExists() {
    return false;
  }

  void deleteOwner(String cellNo) {}

  void addNewResturant(Restaurant restaurant) {}

  void deleteRestaurant(String id) {}

  @override
  Restaurant getResturant(String id) {
    throw UnimplementedError();
  }

  @override
  bool restaurantExist(String id) {
    throw UnimplementedError();
  }
}
