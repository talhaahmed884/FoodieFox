import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodiefox/Customer.dart';

class CustomerDB {
  var _db = FirebaseFirestore.instance.collection('Customer');

  Future<bool> customerExists(String email) async {
    var currentCustomerSnapshot =
        await _db.where("Email", isEqualTo: email).get();
    return currentCustomerSnapshot.docs.isNotEmpty;
  }

  void addNewCustomer(Customer customer, String password) async {
    await _db.add({
      'FirstName': customer.getFirstName(),
      'LastName': customer.getLastName(),
      'Email': customer.getEmail(),
      'CellNo': customer.getCellNo(),
      'Password': password
    });
  }

  Future<Customer> getCustomer(String email) async {
    var currentCustomerSnapshot =
        await _db.where("Email", isEqualTo: email).get();

    var currentCustomerDoc = currentCustomerSnapshot.docs[0].data();

    return new Customer.parameterized(
        currentCustomerDoc['FirstName'],
        currentCustomerDoc['LastName'],
        currentCustomerDoc['Email'],
        currentCustomerDoc['CellNo']);
  }

  Future<String> getCustomerPassword(String email) async {
    var currentCustomerSnapshot =
        await _db.where("Email", isEqualTo: email).get();

    return currentCustomerSnapshot.docs[0].data()['Password'];
  }

  void deleteCustomer(String email) async {
    var currentCustomerSnapshot =
        await _db.where("Email", isEqualTo: email).get();
    await currentCustomerSnapshot.docs[0].reference.delete();
  }
}
