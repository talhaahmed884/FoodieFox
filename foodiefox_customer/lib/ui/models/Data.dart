import 'package:flutter/material.dart';
import 'package:foodiefox_customer/backend/actors/Restaurant.dart';
import 'package:foodiefox_customer/backend/database/RestaurantDB.dart';

class SubOption {
  int itemId;
  String name;
  String price;
  SubOption({this.itemId, this.name, this.price});
}

class FurtherDetail {
  final String detailName;
  final String isrequired;
  List<SubOption> suboptions;
  FurtherDetail({
    this.detailName,
    this.isrequired = "Required",
    this.suboptions,
  });
}

class Product {
  final int id;
  final String nameOfProduct, description;
  final String images;
  final double rating, price;
  List<FurtherDetail> further_details;

  Product({
    @required this.id,
    @required this.images,
    this.rating = 0.0,
    @required this.nameOfProduct,
    @required this.price,
    @required this.description,
    this.further_details,
  });
}
// Our demo Products

class Fox_Restaurant {
  final String restaurant_name;
  final String res_image;
  final String location;
  final String timings;
  final String status;
  final double res_ratings;
  List<Product> menu_items;
  Fox_Restaurant(
      {this.restaurant_name,
      this.res_image,
      this.location,
      this.timings,
      this.status,
      this.res_ratings,
      this.menu_items});
}

// List<Fox_Restaurant> demoRestaurants = [];

// Future<void> getRestaurants() async {
//   List<Restaurant> restaurantList = await RestaurantDB.getResturant();

//   for (int a = 0; a < restaurantList.length; a++) {
//     Fox_Restaurant fox_restaurant = new Fox_Restaurant(
//         restaurant_name: restaurantList[a].getName(),
//         res_image: restaurantList[a].getPlaceHolder(),
//         location: restaurantList[a].getAddress(),
//         timings: restaurantList[a].hours.getOpen() +
//             ' - ' +
//             restaurantList[a].hours.getClose(),
//         res_ratings: double.parse(restaurantList[a].getRating()));

//     List<Product> productList = [];

//     for (int b = 0; b < restaurantList[a].categories[0].items.length; b++) {
//       Product product = new Product(
//           id: b + 1,
//           images: restaurantList[a].categories[0].items[b].getPlaceHolder(),
//           nameOfProduct: restaurantList[a].categories[0].items[b].getName(),
//           price: restaurantList[a].categories[0].items[b].getCost().toDouble(),
//           description: restaurantList[a].categories[0].items[b].getDetail(),
//           rating: double.parse(
//               restaurantList[a].categories[0].items[b].getRating()));

//       List<FurtherDetail> furtherDetailList = [];

//       for (int c = 0;
//           c < restaurantList[a].categories[0].items[b].detailTitle.length;
//           c++) {
//         FurtherDetail furtherDetail = new FurtherDetail(
//             detailName: restaurantList[a]
//                 .categories[0]
//                 .items[b]
//                 .detailTitle[c]
//                 .getName());

//         List<SubOption> subOptionList = [];

//         for (int d = 0;
//             d <
//                 restaurantList[a]
//                     .categories[0]
//                     .items[b]
//                     .detailTitle[c]
//                     .detailOptions
//                     .length;
//             d++) {
//           subOptionList.add(new SubOption(
//               itemId: a + 1,
//               name: restaurantList[a]
//                   .categories[0]
//                   .items[b]
//                   .detailTitle[c]
//                   .detailOptions[d]
//                   .getName(),
//               price: '+ R.s ' +
//                   restaurantList[a]
//                       .categories[0]
//                       .items[b]
//                       .detailTitle[c]
//                       .detailOptions[d]
//                       .getCost()
//                       .toString() +
//                   '.00'));
//         } //Adding Suboptions

//         furtherDetail.suboptions = subOptionList;

//         furtherDetailList.add(furtherDetail);
//       } //Adding Further details
//       product.further_details = furtherDetailList;

//       productList.add(product);
//     } //Adding products

//     fox_restaurant.menu_items = productList;

//     demoRestaurants.add(fox_restaurant);
//   }

//   for (int a = 0; a < demoRestaurants.length; a++) {
//     debugPrint(demoRestaurants[a].restaurant_name);
//   }
// }

List<Product> demoProducts = [
  Product(
    id: 1,
    images: "assets/images/roasters.png",
    nameOfProduct: "Cheese Burger",
    price: 650,
    description: description,
    rating: 4.8,
    further_details: [
      FurtherDetail(detailName: "Choose Your Patty", suboptions: [
        SubOption(itemId: 1, name: "Beef", price: "+ R.s 0.00"),
        SubOption(itemId: 2, name: "Chicken", price: "+ R.s 0.00"),
      ]),
      FurtherDetail(detailName: "Drinks", suboptions: [
        SubOption(itemId: 1, name: "Coke", price: "+ R.s 0.00"),
        SubOption(itemId: 2, name: "Dew", price: "+ R.s 0.00"),
        SubOption(itemId: 3, name: "Fanta", price: "+ R.s 0.00"),
        SubOption(itemId: 4, name: "7up", price: "+ R.s 0.00"),
        SubOption(itemId: 5, name: "Sprite", price: "+ R.s 0.00"),
      ]),
    ],
  ),
  Product(
    id: 2,
    images: "assets/images/pizzahut.png",
    nameOfProduct: "Wow Deal 1",
    price: 500,
    description: description,
    rating: 4.1,
    further_details: [
      FurtherDetail(detailName: "Choose Your Pizza", suboptions: [
        SubOption(itemId: 1, name: "Fajita Sicillian", price: "+ R.s 0.00"),
        SubOption(itemId: 2, name: "Afghan Tikka", price: "+ R.s 0.00"),
        SubOption(itemId: 3, name: "BBQ Buzz", price: "+ R.s 0.00"),
        SubOption(itemId: 4, name: "Spicy Ranch", price: "+ R.s 0.00"),
        SubOption(itemId: 5, name: "Super Sicilian", price: "+ R.s 0.00"),
      ]),
      FurtherDetail(detailName: "Drinks", suboptions: [
        SubOption(itemId: 1, name: "Coke", price: "+ R.s 0.00"),
        SubOption(itemId: 2, name: "Dew", price: "+ R.s 0.00"),
        SubOption(itemId: 3, name: "Fanta", price: "+ R.s 0.00"),
        SubOption(itemId: 4, name: "7up", price: "+ R.s 0.00"),
        SubOption(itemId: 5, name: "Sprite", price: "+ R.s 0.00"),
      ]),
    ],
  ),
  Product(
    id: 3,
    images: "assets/images/chickachino.png",
    nameOfProduct: "Chicka Deal",
    price: 365,
    description: description,
    rating: 4.1,
    further_details: [
      FurtherDetail(detailName: "Samosa Filling", suboptions: [
        SubOption(itemId: 1, name: "Aloo", price: "+ R.s 0.00"),
        SubOption(itemId: 2, name: "Chicken", price: "+ R.s 0.00"),
      ]),
      FurtherDetail(detailName: "Chai", suboptions: [
        SubOption(itemId: 1, name: "Golden Malai Chai", price: "+ R.s 0.00"),
        SubOption(itemId: 2, name: "Karak Chai", price: "+ R.s 0.00"),
        SubOption(itemId: 3, name: "Kashmiri Chai", price: "+ R.s 0.00"),
      ]),
    ],
  ),
  Product(
    id: 4,
    images: "assets/images/howdy_sq.png",
    nameOfProduct: "Howdy Festive Deal",
    price: 2000,
    description: description,
    rating: 4.1,
    further_details: [
      FurtherDetail(detailName: "Choose Your Patty For Burger 1", suboptions: [
        SubOption(itemId: 1, name: "Beef", price: "+ R.s 0.00"),
        SubOption(itemId: 2, name: "Chicken", price: "+ R.s 0.00"),
      ]),
      FurtherDetail(detailName: "Choose Your Patty For Burger 2", suboptions: [
        SubOption(itemId: 1, name: "Beef", price: "+ R.s 0.00"),
        SubOption(itemId: 2, name: "Chicken", price: "+ R.s 0.00"),
      ]),
      FurtherDetail(detailName: "Choose Your Patty For Burger 3", suboptions: [
        SubOption(itemId: 1, name: "Beef", price: "+ R.s 0.00"),
        SubOption(itemId: 2, name: "Chicken", price: "+ R.s 0.00"),
      ]),
      FurtherDetail(detailName: "Drinks", suboptions: [
        SubOption(itemId: 1, name: "Coke", price: "+ R.s 0.00"),
        SubOption(itemId: 2, name: "Dew", price: "+ R.s 0.00"),
        SubOption(itemId: 3, name: "Fanta", price: "+ R.s 0.00"),
        SubOption(itemId: 4, name: "7up", price: "+ R.s 0.00"),
        SubOption(itemId: 5, name: "Sprite", price: "+ R.s 0.00"),
      ]),
    ],
  ),
];

List<Fox_Restaurant> demoRestaurants = [
  Fox_Restaurant(
    restaurant_name: "Burning Brownie",
    res_image: "assets/images/burningbrownie.png",
    location: "Shop#2, Beverly Centre, Blue Area, Islamabad",
    timings: "9:00 am - 10 pm",
    res_ratings: 3.8,
    menu_items: [
      Product(
        id: 1,
        images: "assets/images/roasters.png",
        nameOfProduct: "Cheese Burger",
        price: 650,
        description: description,
        rating: 4.8,
        further_details: [
          FurtherDetail(detailName: "Choose Your Patty", suboptions: [
            SubOption(itemId: 1, name: "Beef", price: "+ R.s 0.00"),
            SubOption(itemId: 2, name: "Chicken", price: "+ R.s 0.00"),
          ]),
          FurtherDetail(detailName: "Drinks", suboptions: [
            SubOption(itemId: 1, name: "Coke", price: "+ R.s 0.00"),
            SubOption(itemId: 2, name: "Dew", price: "+ R.s 0.00"),
            SubOption(itemId: 3, name: "Fanta", price: "+ R.s 0.00"),
            SubOption(itemId: 4, name: "7up", price: "+ R.s 0.00"),
            SubOption(itemId: 5, name: "Sprite", price: "+ R.s 0.00"),
          ]),
        ],
      ),
      Product(
        id: 2,
        images: "assets/images/pizzahut.png",
        nameOfProduct: "Wow Deal 1",
        price: 500,
        description: description,
        rating: 4.1,
        further_details: [
          FurtherDetail(detailName: "Choose Your Pizza", suboptions: [
            SubOption(itemId: 1, name: "Fajita Sicillian", price: "+ R.s 0.00"),
            SubOption(itemId: 2, name: "Afghan Tikka", price: "+ R.s 0.00"),
            SubOption(itemId: 3, name: "BBQ Buzz", price: "+ R.s 0.00"),
            SubOption(itemId: 4, name: "Spicy Ranch", price: "+ R.s 0.00"),
            SubOption(itemId: 5, name: "Super Sicilian", price: "+ R.s 0.00"),
          ]),
          FurtherDetail(detailName: "Drinks", suboptions: [
            SubOption(itemId: 1, name: "Coke", price: "+ R.s 0.00"),
            SubOption(itemId: 2, name: "Dew", price: "+ R.s 0.00"),
            SubOption(itemId: 3, name: "Fanta", price: "+ R.s 0.00"),
            SubOption(itemId: 4, name: "7up", price: "+ R.s 0.00"),
            SubOption(itemId: 5, name: "Sprite", price: "+ R.s 0.00"),
          ]),
        ],
      ),
      Product(
        id: 3,
        images: "assets/images/chickachino.png",
        nameOfProduct: "Chicka Deal",
        price: 365,
        description: description,
        rating: 4.1,
        further_details: [
          FurtherDetail(detailName: "Samosa Filling", suboptions: [
            SubOption(itemId: 1, name: "Aloo", price: "+ R.s 0.00"),
            SubOption(itemId: 2, name: "Chicken", price: "+ R.s 0.00"),
          ]),
          FurtherDetail(detailName: "Chai", suboptions: [
            SubOption(
                itemId: 1, name: "Golden Malai Chai", price: "+ R.s 0.00"),
            SubOption(itemId: 2, name: "Karak Chai", price: "+ R.s 0.00"),
            SubOption(itemId: 3, name: "Kashmiri Chai", price: "+ R.s 0.00"),
          ]),
        ],
      ),
      Product(
        id: 1,
        images: "assets/images/roasters.png",
        nameOfProduct: "Cheese Burger",
        price: 650,
        description: description,
        rating: 4.8,
        further_details: [
          FurtherDetail(detailName: "Choose Your Patty", suboptions: [
            SubOption(itemId: 1, name: "Beef", price: "+ R.s 0.00"),
            SubOption(itemId: 2, name: "Chicken", price: "+ R.s 0.00"),
          ]),
          FurtherDetail(detailName: "Drinks", suboptions: [
            SubOption(itemId: 1, name: "Coke", price: "+ R.s 0.00"),
            SubOption(itemId: 2, name: "Dew", price: "+ R.s 0.00"),
            SubOption(itemId: 3, name: "Fanta", price: "+ R.s 0.00"),
            SubOption(itemId: 4, name: "7up", price: "+ R.s 0.00"),
            SubOption(itemId: 5, name: "Sprite", price: "+ R.s 0.00"),
          ]),
        ],
      ),
      Product(
        id: 2,
        images: "assets/images/pizzahut.png",
        nameOfProduct: "Wow Deal 1",
        price: 500,
        description: description,
        rating: 4.1,
        further_details: [
          FurtherDetail(detailName: "Choose Your Pizza", suboptions: [
            SubOption(itemId: 1, name: "Fajita Sicillian", price: "+ R.s 0.00"),
            SubOption(itemId: 2, name: "Afghan Tikka", price: "+ R.s 0.00"),
            SubOption(itemId: 3, name: "BBQ Buzz", price: "+ R.s 0.00"),
            SubOption(itemId: 4, name: "Spicy Ranch", price: "+ R.s 0.00"),
            SubOption(itemId: 5, name: "Super Sicilian", price: "+ R.s 0.00"),
          ]),
          FurtherDetail(detailName: "Drinks", suboptions: [
            SubOption(itemId: 1, name: "Coke", price: "+ R.s 0.00"),
            SubOption(itemId: 2, name: "Dew", price: "+ R.s 0.00"),
            SubOption(itemId: 3, name: "Fanta", price: "+ R.s 0.00"),
            SubOption(itemId: 4, name: "7up", price: "+ R.s 0.00"),
            SubOption(itemId: 5, name: "Sprite", price: "+ R.s 0.00"),
          ]),
        ],
      ),
      Product(
        id: 3,
        images: "assets/images/chickachino.png",
        nameOfProduct: "Chicka Deal",
        price: 365,
        description: description,
        rating: 4.1,
        further_details: [
          FurtherDetail(detailName: "Samosa Filling", suboptions: [
            SubOption(itemId: 1, name: "Aloo", price: "+ R.s 0.00"),
            SubOption(itemId: 2, name: "Chicken", price: "+ R.s 0.00"),
          ]),
          FurtherDetail(detailName: "Chai", suboptions: [
            SubOption(
                itemId: 1, name: "Golden Malai Chai", price: "+ R.s 0.00"),
            SubOption(itemId: 2, name: "Karak Chai", price: "+ R.s 0.00"),
            SubOption(itemId: 3, name: "Kashmiri Chai", price: "+ R.s 0.00"),
          ]),
        ],
      ),
    ],
  ),
  Fox_Restaurant(
    restaurant_name: "Asian Wok",
    res_image: "assets/images/asianwok.png",
    location: "Building 9, Clock Tower Road, Phase 8, Bahria Town",
    timings: "2:00 pm - 10 pm",
    res_ratings: 3.8,
    menu_items: [
      Product(
        id: 1,
        images: "assets/images/roasters.png",
        nameOfProduct: "Cheese Burger",
        price: 650,
        description: description,
        rating: 4.8,
        further_details: [
          FurtherDetail(detailName: "Choose Your Patty", suboptions: [
            SubOption(itemId: 1, name: "Beef", price: "+ R.s 0.00"),
            SubOption(itemId: 2, name: "Chicken", price: "+ R.s 0.00"),
          ]),
          FurtherDetail(detailName: "Drinks", suboptions: [
            SubOption(itemId: 1, name: "Coke", price: "+ R.s 0.00"),
            SubOption(itemId: 2, name: "Dew", price: "+ R.s 0.00"),
            SubOption(itemId: 3, name: "Fanta", price: "+ R.s 0.00"),
            SubOption(itemId: 4, name: "7up", price: "+ R.s 0.00"),
            SubOption(itemId: 5, name: "Sprite", price: "+ R.s 0.00"),
          ]),
        ],
      ),
      Product(
        id: 2,
        images: "assets/images/pizzahut.png",
        nameOfProduct: "Wow Deal 1",
        price: 500,
        description: description,
        rating: 4.1,
        further_details: [
          FurtherDetail(detailName: "Choose Your Pizza", suboptions: [
            SubOption(itemId: 1, name: "Fajita Sicillian", price: "+ R.s 0.00"),
            SubOption(itemId: 2, name: "Afghan Tikka", price: "+ R.s 0.00"),
            SubOption(itemId: 3, name: "BBQ Buzz", price: "+ R.s 0.00"),
            SubOption(itemId: 4, name: "Spicy Ranch", price: "+ R.s 0.00"),
            SubOption(itemId: 5, name: "Super Sicilian", price: "+ R.s 0.00"),
          ]),
          FurtherDetail(detailName: "Drinks", suboptions: [
            SubOption(itemId: 1, name: "Coke", price: "+ R.s 0.00"),
            SubOption(itemId: 2, name: "Dew", price: "+ R.s 0.00"),
            SubOption(itemId: 3, name: "Fanta", price: "+ R.s 0.00"),
            SubOption(itemId: 4, name: "7up", price: "+ R.s 0.00"),
            SubOption(itemId: 5, name: "Sprite", price: "+ R.s 0.00"),
          ]),
        ],
      ),
      Product(
        id: 3,
        images: "assets/images/chickachino.png",
        nameOfProduct: "Chicka Deal",
        price: 365,
        description: description,
        rating: 4.1,
        further_details: [
          FurtherDetail(detailName: "Samosa Filling", suboptions: [
            SubOption(itemId: 1, name: "Aloo", price: "+ R.s 0.00"),
            SubOption(itemId: 2, name: "Chicken", price: "+ R.s 0.00"),
          ]),
          FurtherDetail(detailName: "Chai", suboptions: [
            SubOption(
                itemId: 1, name: "Golden Malai Chai", price: "+ R.s 0.00"),
            SubOption(itemId: 2, name: "Karak Chai", price: "+ R.s 0.00"),
            SubOption(itemId: 3, name: "Kashmiri Chai", price: "+ R.s 0.00"),
          ]),
        ],
      ),
      Product(
        id: 1,
        images: "assets/images/roasters.png",
        nameOfProduct: "Cheese Burger",
        price: 650,
        description: description,
        rating: 4.8,
        further_details: [
          FurtherDetail(detailName: "Choose Your Patty", suboptions: [
            SubOption(itemId: 1, name: "Beef", price: "+ R.s 0.00"),
            SubOption(itemId: 2, name: "Chicken", price: "+ R.s 0.00"),
          ]),
          FurtherDetail(detailName: "Drinks", suboptions: [
            SubOption(itemId: 1, name: "Coke", price: "+ R.s 0.00"),
            SubOption(itemId: 2, name: "Dew", price: "+ R.s 0.00"),
            SubOption(itemId: 3, name: "Fanta", price: "+ R.s 0.00"),
            SubOption(itemId: 4, name: "7up", price: "+ R.s 0.00"),
            SubOption(itemId: 5, name: "Sprite", price: "+ R.s 0.00"),
          ]),
        ],
      ),
      Product(
        id: 2,
        images: "assets/images/pizzahut.png",
        nameOfProduct: "Wow Deal 1",
        price: 500,
        description: description,
        rating: 4.1,
        further_details: [
          FurtherDetail(detailName: "Choose Your Pizza", suboptions: [
            SubOption(itemId: 1, name: "Fajita Sicillian", price: "+ R.s 0.00"),
            SubOption(itemId: 2, name: "Afghan Tikka", price: "+ R.s 0.00"),
            SubOption(itemId: 3, name: "BBQ Buzz", price: "+ R.s 0.00"),
            SubOption(itemId: 4, name: "Spicy Ranch", price: "+ R.s 0.00"),
            SubOption(itemId: 5, name: "Super Sicilian", price: "+ R.s 0.00"),
          ]),
          FurtherDetail(detailName: "Drinks", suboptions: [
            SubOption(itemId: 1, name: "Coke", price: "+ R.s 0.00"),
            SubOption(itemId: 2, name: "Dew", price: "+ R.s 0.00"),
            SubOption(itemId: 3, name: "Fanta", price: "+ R.s 0.00"),
            SubOption(itemId: 4, name: "7up", price: "+ R.s 0.00"),
            SubOption(itemId: 5, name: "Sprite", price: "+ R.s 0.00"),
          ]),
        ],
      ),
      Product(
        id: 3,
        images: "assets/images/chickachino.png",
        nameOfProduct: "Chicka Deal",
        price: 365,
        description: description,
        rating: 4.1,
        further_details: [
          FurtherDetail(detailName: "Samosa Filling", suboptions: [
            SubOption(itemId: 1, name: "Aloo", price: "+ R.s 0.00"),
            SubOption(itemId: 2, name: "Chicken", price: "+ R.s 0.00"),
          ]),
          FurtherDetail(detailName: "Chai", suboptions: [
            SubOption(
                itemId: 1, name: "Golden Malai Chai", price: "+ R.s 0.00"),
            SubOption(itemId: 2, name: "Karak Chai", price: "+ R.s 0.00"),
            SubOption(itemId: 3, name: "Kashmiri Chai", price: "+ R.s 0.00"),
          ]),
        ],
      ),
    ],
  ),
  Fox_Restaurant(
    restaurant_name: "Howdy",
    res_image: "assets/images/howdy.png",
    location: "Shop#7, Margalla Road, F-6, Islamabad",
    timings: "9:00 am - 12 pm",
    res_ratings: 3.8,
    menu_items: [
      Product(
        id: 1,
        images: "assets/images/roasters.png",
        nameOfProduct: "Cheese Burger",
        price: 650,
        description: description,
        rating: 4.8,
        further_details: [
          FurtherDetail(detailName: "Choose Your Patty", suboptions: [
            SubOption(itemId: 1, name: "Beef", price: "+ R.s 0.00"),
            SubOption(itemId: 2, name: "Chicken", price: "+ R.s 0.00"),
          ]),
          FurtherDetail(detailName: "Drinks", suboptions: [
            SubOption(itemId: 1, name: "Coke", price: "+ R.s 0.00"),
            SubOption(itemId: 2, name: "Dew", price: "+ R.s 0.00"),
            SubOption(itemId: 3, name: "Fanta", price: "+ R.s 0.00"),
            SubOption(itemId: 4, name: "7up", price: "+ R.s 0.00"),
            SubOption(itemId: 5, name: "Sprite", price: "+ R.s 0.00"),
          ]),
        ],
      ),
      Product(
        id: 2,
        images: "assets/images/pizzahut.png",
        nameOfProduct: "Wow Deal 1",
        price: 500,
        description: description,
        rating: 4.1,
        further_details: [
          FurtherDetail(detailName: "Choose Your Pizza", suboptions: [
            SubOption(itemId: 1, name: "Fajita Sicillian", price: "+ R.s 0.00"),
            SubOption(itemId: 2, name: "Afghan Tikka", price: "+ R.s 0.00"),
            SubOption(itemId: 3, name: "BBQ Buzz", price: "+ R.s 0.00"),
            SubOption(itemId: 4, name: "Spicy Ranch", price: "+ R.s 0.00"),
            SubOption(itemId: 5, name: "Super Sicilian", price: "+ R.s 0.00"),
          ]),
          FurtherDetail(detailName: "Drinks", suboptions: [
            SubOption(itemId: 1, name: "Coke", price: "+ R.s 0.00"),
            SubOption(itemId: 2, name: "Dew", price: "+ R.s 0.00"),
            SubOption(itemId: 3, name: "Fanta", price: "+ R.s 0.00"),
            SubOption(itemId: 4, name: "7up", price: "+ R.s 0.00"),
            SubOption(itemId: 5, name: "Sprite", price: "+ R.s 0.00"),
          ]),
        ],
      ),
      Product(
        id: 3,
        images: "assets/images/chickachino.png",
        nameOfProduct: "Chicka Deal",
        price: 365,
        description: description,
        rating: 4.1,
        further_details: [
          FurtherDetail(detailName: "Samosa Filling", suboptions: [
            SubOption(itemId: 1, name: "Aloo", price: "+ R.s 0.00"),
            SubOption(itemId: 2, name: "Chicken", price: "+ R.s 0.00"),
          ]),
          FurtherDetail(detailName: "Chai", suboptions: [
            SubOption(
                itemId: 1, name: "Golden Malai Chai", price: "+ R.s 0.00"),
            SubOption(itemId: 2, name: "Karak Chai", price: "+ R.s 0.00"),
            SubOption(itemId: 3, name: "Kashmiri Chai", price: "+ R.s 0.00"),
          ]),
        ],
      ),
      Product(
        id: 1,
        images: "assets/images/roasters.png",
        nameOfProduct: "Cheese Burger",
        price: 650,
        description: description,
        rating: 4.8,
        further_details: [
          FurtherDetail(detailName: "Choose Your Patty", suboptions: [
            SubOption(itemId: 1, name: "Beef", price: "+ R.s 0.00"),
            SubOption(itemId: 2, name: "Chicken", price: "+ R.s 0.00"),
          ]),
          FurtherDetail(detailName: "Drinks", suboptions: [
            SubOption(itemId: 1, name: "Coke", price: "+ R.s 0.00"),
            SubOption(itemId: 2, name: "Dew", price: "+ R.s 0.00"),
            SubOption(itemId: 3, name: "Fanta", price: "+ R.s 0.00"),
            SubOption(itemId: 4, name: "7up", price: "+ R.s 0.00"),
            SubOption(itemId: 5, name: "Sprite", price: "+ R.s 0.00"),
          ]),
        ],
      ),
      Product(
        id: 2,
        images: "assets/images/pizzahut.png",
        nameOfProduct: "Wow Deal 1",
        price: 500,
        description: description,
        rating: 4.1,
        further_details: [
          FurtherDetail(detailName: "Choose Your Pizza", suboptions: [
            SubOption(itemId: 1, name: "Fajita Sicillian", price: "+ R.s 0.00"),
            SubOption(itemId: 2, name: "Afghan Tikka", price: "+ R.s 0.00"),
            SubOption(itemId: 3, name: "BBQ Buzz", price: "+ R.s 0.00"),
            SubOption(itemId: 4, name: "Spicy Ranch", price: "+ R.s 0.00"),
            SubOption(itemId: 5, name: "Super Sicilian", price: "+ R.s 0.00"),
          ]),
          FurtherDetail(detailName: "Drinks", suboptions: [
            SubOption(itemId: 1, name: "Coke", price: "+ R.s 0.00"),
            SubOption(itemId: 2, name: "Dew", price: "+ R.s 0.00"),
            SubOption(itemId: 3, name: "Fanta", price: "+ R.s 0.00"),
            SubOption(itemId: 4, name: "7up", price: "+ R.s 0.00"),
            SubOption(itemId: 5, name: "Sprite", price: "+ R.s 0.00"),
          ]),
        ],
      ),
      Product(
        id: 3,
        images: "assets/images/chickachino.png",
        nameOfProduct: "Chicka Deal",
        price: 365,
        description: description,
        rating: 4.1,
        further_details: [
          FurtherDetail(detailName: "Samosa Filling", suboptions: [
            SubOption(itemId: 1, name: "Aloo", price: "+ R.s 0.00"),
            SubOption(itemId: 2, name: "Chicken", price: "+ R.s 0.00"),
          ]),
          FurtherDetail(detailName: "Chai", suboptions: [
            SubOption(
                itemId: 1, name: "Golden Malai Chai", price: "+ R.s 0.00"),
            SubOption(itemId: 2, name: "Karak Chai", price: "+ R.s 0.00"),
            SubOption(itemId: 3, name: "Kashmiri Chai", price: "+ R.s 0.00"),
          ]),
        ],
      ),
    ],
  ),
  Fox_Restaurant(
    restaurant_name: "Roasters",
    res_image: "assets/images/roasters.png",
    location: "Building 101, Road: Bella Road, Sector: F-11, Islamabad",
    timings: "9:00 am - 12 pm",
    res_ratings: 3.8,
    menu_items: [
      Product(
        id: 1,
        images: "assets/images/roasters.png",
        nameOfProduct: "Cheese Burger",
        price: 650,
        description: description,
        rating: 4.8,
        further_details: [
          FurtherDetail(detailName: "Choose Your Patty", suboptions: [
            SubOption(itemId: 1, name: "Beef", price: "+ R.s 0.00"),
            SubOption(itemId: 2, name: "Chicken", price: "+ R.s 0.00"),
          ]),
          FurtherDetail(detailName: "Drinks", suboptions: [
            SubOption(itemId: 1, name: "Coke", price: "+ R.s 0.00"),
            SubOption(itemId: 2, name: "Dew", price: "+ R.s 0.00"),
            SubOption(itemId: 3, name: "Fanta", price: "+ R.s 0.00"),
            SubOption(itemId: 4, name: "7up", price: "+ R.s 0.00"),
            SubOption(itemId: 5, name: "Sprite", price: "+ R.s 0.00"),
          ]),
        ],
      ),
      Product(
        id: 2,
        images: "assets/images/pizzahut.png",
        nameOfProduct: "Wow Deal 1",
        price: 500,
        description: description,
        rating: 4.1,
        further_details: [
          FurtherDetail(detailName: "Choose Your Pizza", suboptions: [
            SubOption(itemId: 1, name: "Fajita Sicillian", price: "+ R.s 0.00"),
            SubOption(itemId: 2, name: "Afghan Tikka", price: "+ R.s 0.00"),
            SubOption(itemId: 3, name: "BBQ Buzz", price: "+ R.s 0.00"),
            SubOption(itemId: 4, name: "Spicy Ranch", price: "+ R.s 0.00"),
            SubOption(itemId: 5, name: "Super Sicilian", price: "+ R.s 0.00"),
          ]),
          FurtherDetail(detailName: "Drinks", suboptions: [
            SubOption(itemId: 1, name: "Coke", price: "+ R.s 0.00"),
            SubOption(itemId: 2, name: "Dew", price: "+ R.s 0.00"),
            SubOption(itemId: 3, name: "Fanta", price: "+ R.s 0.00"),
            SubOption(itemId: 4, name: "7up", price: "+ R.s 0.00"),
            SubOption(itemId: 5, name: "Sprite", price: "+ R.s 0.00"),
          ]),
        ],
      ),
      Product(
        id: 3,
        images: "assets/images/chickachino.png",
        nameOfProduct: "Chicka Deal",
        price: 365,
        description: description,
        rating: 4.1,
        further_details: [
          FurtherDetail(detailName: "Samosa Filling", suboptions: [
            SubOption(itemId: 1, name: "Aloo", price: "+ R.s 0.00"),
            SubOption(itemId: 2, name: "Chicken", price: "+ R.s 0.00"),
          ]),
          FurtherDetail(detailName: "Chai", suboptions: [
            SubOption(
                itemId: 1, name: "Golden Malai Chai", price: "+ R.s 0.00"),
            SubOption(itemId: 2, name: "Karak Chai", price: "+ R.s 0.00"),
            SubOption(itemId: 3, name: "Kashmiri Chai", price: "+ R.s 0.00"),
          ]),
        ],
      ),
      Product(
        id: 1,
        images: "assets/images/roasters.png",
        nameOfProduct: "Cheese Burger",
        price: 650,
        description: description,
        rating: 4.8,
        further_details: [
          FurtherDetail(detailName: "Choose Your Patty", suboptions: [
            SubOption(itemId: 1, name: "Beef", price: "+ R.s 0.00"),
            SubOption(itemId: 2, name: "Chicken", price: "+ R.s 0.00"),
          ]),
          FurtherDetail(detailName: "Drinks", suboptions: [
            SubOption(itemId: 1, name: "Coke", price: "+ R.s 0.00"),
            SubOption(itemId: 2, name: "Dew", price: "+ R.s 0.00"),
            SubOption(itemId: 3, name: "Fanta", price: "+ R.s 0.00"),
            SubOption(itemId: 4, name: "7up", price: "+ R.s 0.00"),
            SubOption(itemId: 5, name: "Sprite", price: "+ R.s 0.00"),
          ]),
        ],
      ),
      Product(
        id: 2,
        images: "assets/images/pizzahut.png",
        nameOfProduct: "Wow Deal 1",
        price: 500,
        description: description,
        rating: 4.1,
        further_details: [
          FurtherDetail(detailName: "Choose Your Pizza", suboptions: [
            SubOption(itemId: 1, name: "Fajita Sicillian", price: "+ R.s 0.00"),
            SubOption(itemId: 2, name: "Afghan Tikka", price: "+ R.s 0.00"),
            SubOption(itemId: 3, name: "BBQ Buzz", price: "+ R.s 0.00"),
            SubOption(itemId: 4, name: "Spicy Ranch", price: "+ R.s 0.00"),
            SubOption(itemId: 5, name: "Super Sicilian", price: "+ R.s 0.00"),
          ]),
          FurtherDetail(detailName: "Drinks", suboptions: [
            SubOption(itemId: 1, name: "Coke", price: "+ R.s 0.00"),
            SubOption(itemId: 2, name: "Dew", price: "+ R.s 0.00"),
            SubOption(itemId: 3, name: "Fanta", price: "+ R.s 0.00"),
            SubOption(itemId: 4, name: "7up", price: "+ R.s 0.00"),
            SubOption(itemId: 5, name: "Sprite", price: "+ R.s 0.00"),
          ]),
        ],
      ),
      Product(
        id: 3,
        images: "assets/images/chickachino.png",
        nameOfProduct: "Chicka Deal",
        price: 365,
        description: description,
        rating: 4.1,
        further_details: [
          FurtherDetail(detailName: "Samosa Filling", suboptions: [
            SubOption(itemId: 1, name: "Aloo", price: "+ R.s 0.00"),
            SubOption(itemId: 2, name: "Chicken", price: "+ R.s 0.00"),
          ]),
          FurtherDetail(detailName: "Chai", suboptions: [
            SubOption(
                itemId: 1, name: "Golden Malai Chai", price: "+ R.s 0.00"),
            SubOption(itemId: 2, name: "Karak Chai", price: "+ R.s 0.00"),
            SubOption(itemId: 3, name: "Kashmiri Chai", price: "+ R.s 0.00"),
          ]),
        ],
      ),
    ],
  ),
  Fox_Restaurant(
    restaurant_name: "Chicka Chino",
    res_image: "assets/images/chickachino.png",
    location: "Building 101, Road: Bella Road, Sector: F-11, Islamabad",
    timings: "2:00 pm - 2 am",
    res_ratings: 3.8,
    menu_items: [
      Product(
        id: 1,
        images: "assets/images/roasters.png",
        nameOfProduct: "Cheese Burger",
        price: 650,
        description: description,
        rating: 4.8,
        further_details: [
          FurtherDetail(detailName: "Choose Your Patty", suboptions: [
            SubOption(itemId: 1, name: "Beef", price: "+ R.s 0.00"),
            SubOption(itemId: 2, name: "Chicken", price: "+ R.s 0.00"),
          ]),
          FurtherDetail(detailName: "Drinks", suboptions: [
            SubOption(itemId: 1, name: "Coke", price: "+ R.s 0.00"),
            SubOption(itemId: 2, name: "Dew", price: "+ R.s 0.00"),
            SubOption(itemId: 3, name: "Fanta", price: "+ R.s 0.00"),
            SubOption(itemId: 4, name: "7up", price: "+ R.s 0.00"),
            SubOption(itemId: 5, name: "Sprite", price: "+ R.s 0.00"),
          ]),
        ],
      ),
      Product(
        id: 2,
        images: "assets/images/pizzahut.png",
        nameOfProduct: "Wow Deal 1",
        price: 500,
        description: description,
        rating: 4.1,
        further_details: [
          FurtherDetail(detailName: "Choose Your Pizza", suboptions: [
            SubOption(itemId: 1, name: "Fajita Sicillian", price: "+ R.s 0.00"),
            SubOption(itemId: 2, name: "Afghan Tikka", price: "+ R.s 0.00"),
            SubOption(itemId: 3, name: "BBQ Buzz", price: "+ R.s 0.00"),
            SubOption(itemId: 4, name: "Spicy Ranch", price: "+ R.s 0.00"),
            SubOption(itemId: 5, name: "Super Sicilian", price: "+ R.s 0.00"),
          ]),
          FurtherDetail(detailName: "Drinks", suboptions: [
            SubOption(itemId: 1, name: "Coke", price: "+ R.s 0.00"),
            SubOption(itemId: 2, name: "Dew", price: "+ R.s 0.00"),
            SubOption(itemId: 3, name: "Fanta", price: "+ R.s 0.00"),
            SubOption(itemId: 4, name: "7up", price: "+ R.s 0.00"),
            SubOption(itemId: 5, name: "Sprite", price: "+ R.s 0.00"),
          ]),
        ],
      ),
      Product(
        id: 3,
        images: "assets/images/chickachino.png",
        nameOfProduct: "Chicka Deal",
        price: 365,
        description: description,
        rating: 4.1,
        further_details: [
          FurtherDetail(detailName: "Samosa Filling", suboptions: [
            SubOption(itemId: 1, name: "Aloo", price: "+ R.s 0.00"),
            SubOption(itemId: 2, name: "Chicken", price: "+ R.s 0.00"),
          ]),
          FurtherDetail(detailName: "Chai", suboptions: [
            SubOption(
                itemId: 1, name: "Golden Malai Chai", price: "+ R.s 0.00"),
            SubOption(itemId: 2, name: "Karak Chai", price: "+ R.s 0.00"),
            SubOption(itemId: 3, name: "Kashmiri Chai", price: "+ R.s 0.00"),
          ]),
        ],
      ),
      Product(
        id: 1,
        images: "assets/images/roasters.png",
        nameOfProduct: "Cheese Burger",
        price: 650,
        description: description,
        rating: 4.8,
        further_details: [
          FurtherDetail(detailName: "Choose Your Patty", suboptions: [
            SubOption(itemId: 1, name: "Beef", price: "+ R.s 0.00"),
            SubOption(itemId: 2, name: "Chicken", price: "+ R.s 0.00"),
          ]),
          FurtherDetail(detailName: "Drinks", suboptions: [
            SubOption(itemId: 1, name: "Coke", price: "+ R.s 0.00"),
            SubOption(itemId: 2, name: "Dew", price: "+ R.s 0.00"),
            SubOption(itemId: 3, name: "Fanta", price: "+ R.s 0.00"),
            SubOption(itemId: 4, name: "7up", price: "+ R.s 0.00"),
            SubOption(itemId: 5, name: "Sprite", price: "+ R.s 0.00"),
          ]),
        ],
      ),
      Product(
        id: 2,
        images: "assets/images/pizzahut.png",
        nameOfProduct: "Wow Deal 1",
        price: 500,
        description: description,
        rating: 4.1,
        further_details: [
          FurtherDetail(detailName: "Choose Your Pizza", suboptions: [
            SubOption(itemId: 1, name: "Fajita Sicillian", price: "+ R.s 0.00"),
            SubOption(itemId: 2, name: "Afghan Tikka", price: "+ R.s 0.00"),
            SubOption(itemId: 3, name: "BBQ Buzz", price: "+ R.s 0.00"),
            SubOption(itemId: 4, name: "Spicy Ranch", price: "+ R.s 0.00"),
            SubOption(itemId: 5, name: "Super Sicilian", price: "+ R.s 0.00"),
          ]),
          FurtherDetail(detailName: "Drinks", suboptions: [
            SubOption(itemId: 1, name: "Coke", price: "+ R.s 0.00"),
            SubOption(itemId: 2, name: "Dew", price: "+ R.s 0.00"),
            SubOption(itemId: 3, name: "Fanta", price: "+ R.s 0.00"),
            SubOption(itemId: 4, name: "7up", price: "+ R.s 0.00"),
            SubOption(itemId: 5, name: "Sprite", price: "+ R.s 0.00"),
          ]),
        ],
      ),
      Product(
        id: 3,
        images: "assets/images/chickachino.png",
        nameOfProduct: "Chicka Deal",
        price: 365,
        description: description,
        rating: 4.1,
        further_details: [
          FurtherDetail(detailName: "Samosa Filling", suboptions: [
            SubOption(itemId: 1, name: "Aloo", price: "+ R.s 0.00"),
            SubOption(itemId: 2, name: "Chicken", price: "+ R.s 0.00"),
          ]),
          FurtherDetail(detailName: "Chai", suboptions: [
            SubOption(
                itemId: 1, name: "Golden Malai Chai", price: "+ R.s 0.00"),
            SubOption(itemId: 2, name: "Karak Chai", price: "+ R.s 0.00"),
            SubOption(itemId: 3, name: "Kashmiri Chai", price: "+ R.s 0.00"),
          ]),
        ],
      ),
    ],
  ),
  Fox_Restaurant(
    restaurant_name: "Pizza Hut",
    res_image: "assets/images/pizzahut.png",
    location: "Shop# 7, I-8 Markaz, Islamabad",
    timings: "12:00 am - 2 am",
    res_ratings: 3.8,
    menu_items: [
      Product(
        id: 1,
        images: "assets/images/roasters.png",
        nameOfProduct: "Cheese Burger",
        price: 650,
        description: description,
        rating: 4.8,
        further_details: [
          FurtherDetail(detailName: "Choose Your Patty", suboptions: [
            SubOption(itemId: 1, name: "Beef", price: "+ R.s 0.00"),
            SubOption(itemId: 2, name: "Chicken", price: "+ R.s 0.00"),
          ]),
          FurtherDetail(detailName: "Drinks", suboptions: [
            SubOption(itemId: 1, name: "Coke", price: "+ R.s 0.00"),
            SubOption(itemId: 2, name: "Dew", price: "+ R.s 0.00"),
            SubOption(itemId: 3, name: "Fanta", price: "+ R.s 0.00"),
            SubOption(itemId: 4, name: "7up", price: "+ R.s 0.00"),
            SubOption(itemId: 5, name: "Sprite", price: "+ R.s 0.00"),
          ]),
        ],
      ),
      Product(
        id: 2,
        images: "assets/images/pizzahut.png",
        nameOfProduct: "Wow Deal 1",
        price: 500,
        description: description,
        rating: 4.1,
        further_details: [
          FurtherDetail(detailName: "Choose Your Pizza", suboptions: [
            SubOption(itemId: 1, name: "Fajita Sicillian", price: "+ R.s 0.00"),
            SubOption(itemId: 2, name: "Afghan Tikka", price: "+ R.s 0.00"),
            SubOption(itemId: 3, name: "BBQ Buzz", price: "+ R.s 0.00"),
            SubOption(itemId: 4, name: "Spicy Ranch", price: "+ R.s 0.00"),
            SubOption(itemId: 5, name: "Super Sicilian", price: "+ R.s 0.00"),
          ]),
          FurtherDetail(detailName: "Drinks", suboptions: [
            SubOption(itemId: 1, name: "Coke", price: "+ R.s 0.00"),
            SubOption(itemId: 2, name: "Dew", price: "+ R.s 0.00"),
            SubOption(itemId: 3, name: "Fanta", price: "+ R.s 0.00"),
            SubOption(itemId: 4, name: "7up", price: "+ R.s 0.00"),
            SubOption(itemId: 5, name: "Sprite", price: "+ R.s 0.00"),
          ]),
        ],
      ),
      Product(
        id: 3,
        images: "assets/images/chickachino.png",
        nameOfProduct: "Chicka Deal",
        price: 365,
        description: description,
        rating: 4.1,
        further_details: [
          FurtherDetail(detailName: "Samosa Filling", suboptions: [
            SubOption(itemId: 1, name: "Aloo", price: "+ R.s 0.00"),
            SubOption(itemId: 2, name: "Chicken", price: "+ R.s 0.00"),
          ]),
          FurtherDetail(detailName: "Chai", suboptions: [
            SubOption(
                itemId: 1, name: "Golden Malai Chai", price: "+ R.s 0.00"),
            SubOption(itemId: 2, name: "Karak Chai", price: "+ R.s 0.00"),
            SubOption(itemId: 3, name: "Kashmiri Chai", price: "+ R.s 0.00"),
          ]),
        ],
      ),
      Product(
        id: 1,
        images: "assets/images/roasters.png",
        nameOfProduct: "Cheese Burger",
        price: 650,
        description: description,
        rating: 4.8,
        further_details: [
          FurtherDetail(detailName: "Choose Your Patty", suboptions: [
            SubOption(itemId: 1, name: "Beef", price: "+ R.s 0.00"),
            SubOption(itemId: 2, name: "Chicken", price: "+ R.s 0.00"),
          ]),
          FurtherDetail(detailName: "Drinks", suboptions: [
            SubOption(itemId: 1, name: "Coke", price: "+ R.s 0.00"),
            SubOption(itemId: 2, name: "Dew", price: "+ R.s 0.00"),
            SubOption(itemId: 3, name: "Fanta", price: "+ R.s 0.00"),
            SubOption(itemId: 4, name: "7up", price: "+ R.s 0.00"),
            SubOption(itemId: 5, name: "Sprite", price: "+ R.s 0.00"),
          ]),
        ],
      ),
      Product(
        id: 2,
        images: "assets/images/pizzahut.png",
        nameOfProduct: "Wow Deal 1",
        price: 500,
        description: description,
        rating: 4.1,
        further_details: [
          FurtherDetail(detailName: "Choose Your Pizza", suboptions: [
            SubOption(itemId: 1, name: "Fajita Sicillian", price: "+ R.s 0.00"),
            SubOption(itemId: 2, name: "Afghan Tikka", price: "+ R.s 0.00"),
            SubOption(itemId: 3, name: "BBQ Buzz", price: "+ R.s 0.00"),
            SubOption(itemId: 4, name: "Spicy Ranch", price: "+ R.s 0.00"),
            SubOption(itemId: 5, name: "Super Sicilian", price: "+ R.s 0.00"),
          ]),
          FurtherDetail(detailName: "Drinks", suboptions: [
            SubOption(itemId: 1, name: "Coke", price: "+ R.s 0.00"),
            SubOption(itemId: 2, name: "Dew", price: "+ R.s 0.00"),
            SubOption(itemId: 3, name: "Fanta", price: "+ R.s 0.00"),
            SubOption(itemId: 4, name: "7up", price: "+ R.s 0.00"),
            SubOption(itemId: 5, name: "Sprite", price: "+ R.s 0.00"),
          ]),
        ],
      ),
      Product(
        id: 3,
        images: "assets/images/chickachino.png",
        nameOfProduct: "Chicka Deal",
        price: 365,
        description: description,
        rating: 4.1,
        further_details: [
          FurtherDetail(detailName: "Samosa Filling", suboptions: [
            SubOption(itemId: 1, name: "Aloo", price: "+ R.s 0.00"),
            SubOption(itemId: 2, name: "Chicken", price: "+ R.s 0.00"),
          ]),
          FurtherDetail(detailName: "Chai", suboptions: [
            SubOption(
                itemId: 1, name: "Golden Malai Chai", price: "+ R.s 0.00"),
            SubOption(itemId: 2, name: "Karak Chai", price: "+ R.s 0.00"),
            SubOption(itemId: 3, name: "Kashmiri Chai", price: "+ R.s 0.00"),
          ]),
        ],
      ),
    ],
  ),
];

const String description = "Lorem ipsum dolor sit \namet consectetur";
