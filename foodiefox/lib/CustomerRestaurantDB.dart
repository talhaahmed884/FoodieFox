import 'BusinessHour.dart';
import 'Category.dart';
import 'Item.dart';
import 'Restaurant.dart';
import 'ResturantDB.dart';

class CustomerRestaurantDB implements ResturantDB {
  @override
  Restaurant getResturant(String name) {
    throw UnimplementedError();
  }

  BusinessHour _getRestaurantBuisnessHours(String id) {
    return new BusinessHour();
  }

  List<Category> _getRestaurantCategories(String name) {
    return List<Category>.empty();
  }

  List<Item> _getCategoryItems(String category) {
    return List<Item>.empty();
  }

  @override
  bool restaurantExist(String id) {
    throw UnimplementedError();
  }
}
