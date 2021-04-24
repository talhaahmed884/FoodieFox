import 'Restaurant.dart';

abstract class ResturantDB {
  Restaurant getResturant(String id);
  bool restaurantExist(String id);
}
