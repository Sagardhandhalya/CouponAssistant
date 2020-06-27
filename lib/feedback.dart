import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import './home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}
final snackBar = SnackBar(content: Text('your feedback is recorded.'),
           
            );

// Find the Scaffold in the widget tree and use it to show a SnackBar.


class _FeedState extends State<Feed> {
  final storage = FlutterSecureStorage();
  var rating = 0.0;
  String comment = 'ok';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feeback'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(children: <Widget>[
          SizedBox(height: 100),
          SizedBox(height: 20),
          Center(
            child: SmoothStarRating(
              rating: rating,
              size: 40,
              filledIconData: Icons.star,
              halfFilledIconData: Icons.star_half,
              defaultIconData: Icons.star_border,
              starCount: 5,
              allowHalfRating: false,
              spacing: 2.0,
              onRatingChanged: (value) {
                setState(() {
                  rating = value;
                });
              },
            ),
          ),
          SizedBox(height: 50),
          TextFormField(
            decoration: InputDecoration(labelText: 'Feedback'),
            onChanged: (value) {
              setState(() {
                comment = value;
              });
            },
          ),
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child:Builder(
  builder: (context) => RaisedButton(
              color: Theme.of(context).indicatorColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                'Submit',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              onPressed: () {
                print(comment);
                Firestore.instance
                    .collection('users')
                    .document(userId)
                    .collection('feedback')
                    .document()
                    .setData({
                  'rating': rating,
                  'feedback': comment,
                });
                


                Scaffold.of(context).showSnackBar(snackBar);
                
               
              },
            ),
           ), ),
        ]),
      ),
    );
  }
}
