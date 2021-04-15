import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodiefox/CustomerDB.dart';

import 'Customer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  CustomerDB customerDB = new CustomerDB();
  bool d = await customerDB.customerExists('talhaahmed@gmail.com');
  if(d){
    print('Exists');
  }else{
    print("Doesn't Exists");
  }

  // Customer customer = new Customer.parameterized(
  //     'Talha', 'Ahmed', 'talhaahmed884@gamil.com', '03222222990');
  //
  // Customer cus = await customerDB.getCustomer('talhaahmed884@gamil.com');
  // print(cus);
  // String password =
  //     await customerDB.getCustomerPassword('talhaahmed884@gamil.com');
  // print(password + '\n');
  //
  // customerDB.deleteCustomer('talhaahmed884@gamil.com');
}
