import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodiefox_customer/backend/actors/Restaurant.dart';
import 'package:foodiefox_customer/backend/actors/RestaurantOwner.dart';
import 'RestaurantDB.dart';

class RestaurantOwnerDB extends RestaurantDB {
  static var _db = FirebaseFirestore.instance.collection('Restaurant Owner');

  static Future<void> addOwner(RestaurantOwner owner) async {
    await _db.add({'Email': owner.getEmail()});
  }

  static Future<RestaurantOwner> getOwner(String email) async {
    var restaurantOwnerSnapshot =
        await _db.where("Email", isEqualTo: email).get();

    RestaurantOwner restaurantOwner = new RestaurantOwner();
    restaurantOwner.setEmail(restaurantOwnerSnapshot.docs[0].data()['Email']);

    List<dynamic> restaurantsID =
        restaurantOwnerSnapshot.docs[0].data()['Restaurants'];

    for (int a = 0; a < restaurantsID.length; a++) {
      restaurantOwner.restaurantID.add(restaurantsID[a]);
    }

    return restaurantOwner;
  }

  static Future<bool> ownerExists(String email) async {
    var restaurantOwnerSnapshot =
        await _db.where("Email", isEqualTo: email).get();
    return restaurantOwnerSnapshot.docs.isNotEmpty;
  }

  static Future<void> deleteOwner(String email) async {
    var restaurantOwnerSnapshot =
        await _db.where("Email", isEqualTo: email).get();
    restaurantOwnerSnapshot.docs[0].reference.delete();
  }

  static void addNewResturant(Restaurant restaurant, String email) async {
    var restaurantDb = FirebaseFirestore.instance.collection('Restaurant');
    var newRestaurantId;

    await restaurantDb.add({
      'Name': restaurant.getName(),
      'Address': restaurant.getAddress(),
      'Type': restaurant.getType(),
      'PlaceHolder': restaurant.getPlaceHolder()
    }).then((value) => newRestaurantId = value.id);

    var restaurantOwnerSnapshot =
        await _db.where("Email", isEqualTo: email).get();
    var restaurantOwnerDoc = restaurantOwnerSnapshot.docs[0];

    _db.doc(restaurantOwnerDoc.id).update({
      'Restaurants': FieldValue.arrayUnion([newRestaurantId])
    });

    var businessHourDb =
        restaurantDb.doc(newRestaurantId).collection('Business Hours');
    await businessHourDb.add({
      'Open': restaurant.hours.getOpen(),
      'Close': restaurant.hours.getClose()
    });

    var categoryDb = restaurantDb.doc(newRestaurantId).collection('Category');

    for (int a = 0; a < restaurant.categories.length; a++) {
      var categoryId;

      await categoryDb.add({'Name': restaurant.categories[a].getName()}).then(
          (value) => categoryId = value.id);

      var currentCategoryDoc = categoryDb.doc(categoryId).collection('Item');

      for (int b = 0; b < restaurant.categories[a].items.length; b++) {
        var itemId;

        await currentCategoryDoc.add({
          'Cost': restaurant.categories[a].items[b].getCost().toString(),
          'Description': restaurant.categories[a].items[b].getDetail(),
          'Name': restaurant.categories[a].items[b].getName(),
          'Size': restaurant.categories[a].items[b].getsize()
        }).then((value) => itemId = value.id);

        var detailItemDb =
            currentCategoryDoc.doc(itemId).collection('DetailTitle');

        for (int c = 0;
            c < restaurant.categories[a].items[b].detailTitle.length;
            c++) {
          var detailItemId;

          await detailItemDb.add({
            'Name': restaurant.categories[a].items[b].detailTitle[c].getName()
          }).then((value) => detailItemId = value.id);

          var detailOptionsDb =
              detailItemDb.doc(detailItemId).collection('DetailOptions');

          for (int d = 0;
              d <
                  restaurant.categories[a].items[b].detailTitle[c].detailOptions
                      .length;
              d++) {
            detailOptionsDb.add({
              'Cost': restaurant
                  .categories[a].items[b].detailTitle[c].detailOptions[d]
                  .getCost()
                  .toString(),
              'Name': restaurant
                  .categories[a].items[b].detailTitle[c].detailOptions[d]
                  .getName()
            });
          }
        }
      }
    }
  }

  static void deleteRestaurant(String id) async {
    var restaurantSnapshot = await _db.doc(id).get();
    await restaurantSnapshot.reference.delete();
  }
}
