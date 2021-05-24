import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodiefox_customer/backend/components/DetailOptions.dart';
import 'package:foodiefox_customer/backend/components/BusinessHour.dart';
import 'package:foodiefox_customer/backend/components/Category.dart';
import 'package:foodiefox_customer/backend/components/DetailTitle.dart';
import 'package:foodiefox_customer/backend/components/Item.dart';
import 'package:foodiefox_customer/backend/actors/Restaurant.dart';

class RestaurantDB {
  static var _db = FirebaseFirestore.instance.collection('Restaurant');

  static Future<List<Restaurant>> getResturant() async {
    List<Restaurant> restaurantList = [];

    var restaurantSnapshot = await _db.get();

    for (int a = 0; a < restaurantSnapshot.size; a++) {
      Restaurant restaurant = new Restaurant();
      var restaurantDoc = restaurantSnapshot.docs[a].data();

      restaurant.setName(restaurantDoc['Name']);
      restaurant.setAddress(restaurantDoc['Address']);
      restaurant.setType(restaurantDoc['Type']);
      restaurant.setPlaceHolder(restaurantDoc['PlaceHolder']);
      restaurant.setRating(restaurantDoc['Rating']);

      restaurant.hours = await _getRestaurantBuisnessHours(
          await restaurantSnapshot.docs[a].reference.get());

      restaurant.categories = await _getRestaurantCategories(
          await restaurantSnapshot.docs[a].reference.get());

      restaurantList.add(restaurant);
    }

    return restaurantList;
  }

  static Future<bool> restaurantExist(String id) async {
    var restaurantSnapshot = await _db.doc(id).get();
    return restaurantSnapshot.exists;
  }

  static Future<BusinessHour> _getRestaurantBuisnessHours(
      DocumentSnapshot restaurantSnapshot) async {
    var businessHourSnapshot =
        await restaurantSnapshot.reference.collection('Business Hours').get();
    var businessHourDoc = businessHourSnapshot.docs[0].data();

    return new BusinessHour.parameterized(
        businessHourDoc['Open'], businessHourDoc['Close']);
  }

  static Future<List<Category>> _getRestaurantCategories(
      DocumentSnapshot restaurantSnapshot) async {
    var categorySnapshot =
        await restaurantSnapshot.reference.collection('Category').get();

    List<Category> categoryList = [];
    for (int a = 0; a < categorySnapshot.size; a++) {
      Category category = new Category();
      category.setName(categorySnapshot.docs[a].data()['Name']);
      category.items = await _getCategoryItems(
          await categorySnapshot.docs[a].reference.get());

      categoryList.add(category);
    }

    return categoryList;
  }

  static Future<List<Item>> _getCategoryItems(
      DocumentSnapshot categorySnapshot) async {
    var itemSnapshot =
        await categorySnapshot.reference.collection('Item').get();

    List<Item> items = [];
    for (int a = 0; a < itemSnapshot.size; a++) {
      Item item = new Item();
      item.setName(itemSnapshot.docs[a].data()['Name']);
      item.setDetail(itemSnapshot.docs[a].data()['Description']);
      item.setsize(itemSnapshot.docs[a].data()['Size']);
      item.setCost(int.parse(itemSnapshot.docs[a].data()['Cost']));
      item.setRating(itemSnapshot.docs[a].data()['Rating']);
      item.setPlaceHolder(itemSnapshot.docs[a].data()['PlaceHolder']);

      item.detailTitle =
          await _getDetailTitle(await itemSnapshot.docs[a].reference.get());

      items.add(item);
    }

    return items;
  }

  static Future<List<DetailTitle>> _getDetailTitle(
      DocumentSnapshot itemSnapshot) async {
    var detailTitleSnapshot =
        await itemSnapshot.reference.collection('DetailTitle').get();

    List<DetailTitle> detailTitles = [];
    for (int a = 0; a < detailTitleSnapshot.size; a++) {
      var detailTitleDoc = detailTitleSnapshot.docs[a].data();

      DetailTitle detailTitle = new DetailTitle();
      detailTitle.setName(detailTitleDoc['Name']);
      detailTitle.detailOptions = await _getDetailOptions(
          await detailTitleSnapshot.docs[a].reference.get());

      detailTitles.add(detailTitle);
    }

    return detailTitles;
  }

  static Future<List<DetailOptions>> _getDetailOptions(
      DocumentSnapshot detailTitleSnapshot) async {
    var detailOptionsSnapshot =
        await detailTitleSnapshot.reference.collection('DetailOptions').get();

    List<DetailOptions> detailOptions = [];
    for (int a = 0; a < detailOptionsSnapshot.size; a++) {
      detailOptions.add(new DetailOptions.parameterized(
          detailOptionsSnapshot.docs[a].data()['Name'],
          int.parse(detailOptionsSnapshot.docs[a].data()['Cost'])));
    }

    return detailOptions;
  }
}
