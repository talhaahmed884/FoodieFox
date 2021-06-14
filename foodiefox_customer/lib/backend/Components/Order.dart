import 'dart:math';

import 'OrderItem.dart';

class Order {
  String _id = '';
  String _date = '';
  String _time = '';
  String _type = '';
  List<OrderItem> item = [];

  Order() {
    _id = '';
    _date = '';
    _time = '';
    _type = '';
  }

  Order.parameterized(String date, String time, String type) {
    _id = '';
    _date = date;
    _time = time;
    _type = type;
  }

  void setId(String id) {
    _id = id;
  }

  String getId() {
    return _id;
  }

  void setDate(String date) {
    _date = date;
  }

  String getDate() {
    return _date;
  }

  void setTime(String time) {
    _time = time;
  }

  String getTime() {
    return _time;
  }

  void setType(String type) {
    _type = type;
  }

  String getType() {
    return _type;
  }

  void generateOrderId() {
    String orderId = '';
    String dateTime = _date + _time;

    for (int a = 0; a < dateTime.length; a++) {
      try {
        int dist = 65 - int.parse(dateTime[a]);
        dist += Random().nextInt(26) + int.parse(dateTime[a]);
        orderId += String.fromCharCode(dist);
      } catch (e) {}
    }

    _id = orderId;
  }

  String toString() {
    return _id + ' ' + _date + ' ' + _time + ' ' + _type + '\n';
  }
}
