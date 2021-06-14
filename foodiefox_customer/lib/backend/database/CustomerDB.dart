import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodiefox_customer/backend/actors/Customer.dart';

class CustomerDB {
  var _db = FirebaseFirestore.instance.collection('Customer');

  Future<bool> customerExists(String cellNo) async {
    var currentCustomerSnapshot =
        await _db.where("CellNo", isEqualTo: cellNo).get();
    return currentCustomerSnapshot.docs.isNotEmpty;
  }

  void addNewCustomer(Customer customer) async {
    await _db.add({
      'Name': customer.getName(),
      'Email': customer.getEmail(),
      'CellNo': customer.getCellNo()
    });
  }

  Future<Customer> getCustomer(String cellNo) async {
    var currentCustomerSnapshot =
        await _db.where("CellNo", isEqualTo: cellNo).get();

    var currentCustomerDoc = currentCustomerSnapshot.docs[0].data();

    return new Customer.parameterized(currentCustomerDoc['Name'],
        currentCustomerDoc['Email'], currentCustomerDoc['CellNo']);
  }

  void deleteCustomer(String cellNo) async {
    var currentCustomerSnapshot =
        await _db.where("CellNo", isEqualTo: cellNo).get();
    await currentCustomerSnapshot.docs[0].reference.delete();
  }
}
