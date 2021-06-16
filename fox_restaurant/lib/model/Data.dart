import 'package:flutter/material.dart';

class FurtherDetail {
  final String detailName;
  final String isrequired;
  String name;
  String price;
  FurtherDetail(
      {this.detailName, this.isrequired = "Required", this.name, this.price});
}

class Product {
  final int id;
  final String nameOfProduct, description;
  final String images;
  final double rating, price;
  final List<FurtherDetail> further_details;

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

class Fox_Order {
  final String order_id;
  final String res_image;
  final String totalCost;
  List<Product> order_items;
  Fox_Order(
      {this.order_id,
      this.res_image,
      this.totalCost = "1500",
      this.order_items});
}

List<Fox_Order> demoorder = [
  Fox_Order(
    order_id: "FFHAROHGTVNG",
    res_image: "assets/images/pizzahut.png",
    order_items: [
      Product(
        id: 1,
        images: "assets/images/roasters.png",
        nameOfProduct: "Cheese Burger",
        price: 650,
        description: description,
        rating: 4.8,
        further_details: [
          FurtherDetail(
              detailName: "Choose Your Patty",
              name: "Beef",
              price: "+ R.s 0.00"),
          FurtherDetail(
              detailName: "Drinks", name: "Coke", price: "+ R.s 0.00"),
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
            FurtherDetail(
                detailName: "Choose Your Pizza",
                name: "Fajita Sicillian",
                price: "+ R.s 0.00"),
          ]),
    ],
  ),
  Fox_Order(
    order_id: "JJQAROQGZVNG",
    res_image: "assets/images/howdy_sq.png",
    totalCost: "2000",
    order_items: [
      Product(
        id: 3,
        images: "assets/images/chickachino.png",
        nameOfProduct: "Chicka Deal",
        price: 365,
        description: description,
        rating: 4.1,
        further_details: [
          FurtherDetail(
              detailName: "Samosa Filling", name: "Aloo", price: "+ R.s 0.00"),
          FurtherDetail(
              detailName: "Chai",
              name: "Golden Malai Chai",
              price: "+ R.s 0.00"),
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
          FurtherDetail(
              detailName: "Choose Your Pizza",
              name: "BBQ Buzz",
              price: "+ R.s 0.00"),
          FurtherDetail(
              detailName: "Drinks", name: "Fanta", price: "+ R.s 0.00"),
        ],
      ),
    ],
  ),
  Fox_Order(
    order_id: "MMHQQXHGTOOG",
    res_image: "assets/images/roasters.png",
    totalCost: "1000",
    order_items: [
      Product(
        id: 1,
        images: "assets/images/roasters.png",
        nameOfProduct: "Cheese Burger",
        price: 650,
        description: description,
        rating: 4.8,
        further_details: [
          FurtherDetail(
              detailName: "Choose Your Patty",
              name: "Beef",
              price: "+ R.s 0.00"),
          FurtherDetail(
              detailName: "Drinks", name: "Coke", price: "+ R.s 0.00"),
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
            FurtherDetail(
                detailName: "Choose Your Pizza",
                name: "Fajita Sicillian",
                price: "+ R.s 0.00"),
          ]),
    ],
  ),
  Fox_Order(
    order_id: "UIJJROHGTKOS",
    res_image: "assets/images/chickachino.png",
    order_items: [
      Product(
        id: 3,
        images: "assets/images/chickachino.png",
        nameOfProduct: "Chicka Deal",
        price: 365,
        description: description,
        rating: 4.1,
        further_details: [
          FurtherDetail(
              detailName: "Samosa Filling", name: "Aloo", price: "+ R.s 0.00"),
          FurtherDetail(
              detailName: "Chai",
              name: "Golden Malai Chai",
              price: "+ R.s 0.00"),
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
          FurtherDetail(
              detailName: "Choose Your Pizza",
              name: "BBQ Buzz",
              price: "+ R.s 0.00"),
          FurtherDetail(
              detailName: "Drinks", name: "Fanta", price: "+ R.s 0.00"),
        ],
      ),
    ],
  ),
];

const String description = "Lorem ipsum dolor sit \namet consectetur";
