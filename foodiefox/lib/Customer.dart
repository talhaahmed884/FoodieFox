import 'package:foodiefox/CustomerDB.dart';

class Customer {
  String _firstName;
  String _lastName;
  String _email;
  String _cellNo;
  CustomerDB customerDB;

  Customer() {
    _firstName = '';
    _lastName = '';
    _email = '';
    _cellNo = '';
    customerDB = new CustomerDB();
  }

  Customer.parameterized(
      String firstName, String lastName, String email, String cellNo) {
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _cellNo = cellNo;
    customerDB = new CustomerDB();
  }

  void setFirstName(String firstName) {
    _firstName = firstName;
  }

  String getFirstName() {
    return _firstName;
  }

  void setLastName(String lastName) {
    _lastName = lastName;
  }

  String getLastName() {
    return _lastName;
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
    return _firstName + ' ' + _lastName + ' ' + _email + ' ' + _cellNo + '\n';
  }
}
