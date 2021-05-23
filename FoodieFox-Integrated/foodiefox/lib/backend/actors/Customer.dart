import 'package:foodiefox/backend/database/CustomerDB.dart';

class Customer {
  String _name;
  String _email;
  String _cellNo;
  CustomerDB customerDB;

  Customer() {
    _name = '';
    _email = '';
    _cellNo = '';
    customerDB = new CustomerDB();
  }

  Customer.parameterized(String name, String email, String cellNo) {
    _name = name;
    _email = email;
    _cellNo = cellNo;
    customerDB = new CustomerDB();
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

  String toString() {
    return _name + ' ' + _email + ' ' + _cellNo + '\n';
  }
}
