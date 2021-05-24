import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodiefox_customer/ui/components/constants.dart';
import 'package:foodiefox_customer/ui/models/Data.dart';
import 'package:foodiefox_customer/ui/reviews/review.dart';
import 'package:foodiefox_customer/ui/reviews/review_form.dart';

class ReviewsPage extends StatelessWidget {
  final Fox_Restaurant restaurant;
  final dynamic currentRestaurantReference;

  ReviewsPage({this.restaurant, this.currentRestaurantReference});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${restaurant.restaurant_name}'),
        elevation: 0.0,
        backgroundColor: primary_Yellow,
      ),
      body: _body(context),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ReviewForm(
                      restaurant: this.restaurant,
                      currentRestaurantReference: currentRestaurantReference,
                    )),
          );
        },
      ),
    );
  }

  Widget _body(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('reviews')
          .where('restaurant_reference', isEqualTo: currentRestaurantReference)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return _buildReviewsList(context, snapshot.data.docs);
      },
    );
  }

  Widget _buildReviewsList(
      BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      children: snapshot.map((data) => _buildReview(context, data)).toList(),
    );
  }

  Widget _buildReview(BuildContext context, DocumentSnapshot data) {
    Review review = Review.fromSnapshot(data);
    return ListTile(
      leading: CircleAvatar(
        child: Text(review.reviewer.substring(0, 1).toUpperCase()),
      ),
      title: Text(review.reviewer),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _reviewsStarWidget(review.rating),
          Text(review.comment),
        ],
      ),
    );
  }

  Widget _reviewsStarWidget(int rating) {
    var stars = <Widget>[];
    for (int i = 0; i < 5; i++) {
      Icon star = i < rating
          ? Icon(Icons.star, color: primary_Yellow, size: 12)
          : Icon(Icons.star_border, color: primary_Yellow, size: 12);
      stars.add(star);
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: stars,
    );
  }
}
