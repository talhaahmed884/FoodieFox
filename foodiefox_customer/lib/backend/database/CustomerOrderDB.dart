import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodiefox_customer/backend/components/Order.dart';

class CustomerOrderDB {
  static Future<void> addOrder(
      String customerEmail, String restaurantName, Order order) async {
    var customerDb = FirebaseFirestore.instance.collection('Customer');
    await _addOrder(customerDb, customerEmail, 'Email', order);

    var restaurantDb = FirebaseFirestore.instance.collection('Restaurant');
    await _addOrder(restaurantDb, restaurantName, 'Name', order);
  }

  static Future<void> _addOrder(CollectionReference db, String name,
      String actorConstraint, Order order) async {
    var actorDoc = await db.where(actorConstraint, isEqualTo: name).get();
    var orderSnapshot = db.doc(actorDoc.docs[0].id).collection('Order');

    var orderId;

    await orderSnapshot.add({
      'Date': order.getDate(),
      'ID': order.getId(),
      'Time': order.getTime(),
      'Type': order.getType()
    }).then((value) => orderId = value.id);

    var currentorderDoc = orderSnapshot.doc(orderId).collection('OrderItem');

    for (int a = 0; a < order.item.length; a++) {
      var orderItemId;

      await currentorderDoc.add({
        'Cost': order.item[a].getCost().toString(),
        'Name': order.item[a].getName(),
        'Quantity': order.item[a].getQuantity().toString()
      }).then((value) => orderItemId = value.id);

      var currentOrderItem =
          currentorderDoc.doc(orderItemId).collection('DetailTitle');

      for (int b = 0; b < order.item[a].detailTitle.length; b++) {
        var detailTitleId;

        await currentOrderItem
            .add({'Name': order.item[a].detailTitle[b].getName()}).then(
                (value) => detailTitleId = value.id);

        var currentDetailTitle =
            currentOrderItem.doc(detailTitleId).collection('DetailOptions');

        for (int c = 0;
            c < order.item[a].detailTitle[b].detailOptions.length;
            c++) {
          await currentDetailTitle.add({
            'Name': order.item[a].detailTitle[b].detailOptions[c].getName(),
            'Cost': order.item[a].detailTitle[b].detailOptions[c]
                .getCost()
                .toString()
          });
        }
      }
    }
  }

  Order getOrder(String id) {
    return new Order();
  }
}
