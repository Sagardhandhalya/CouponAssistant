import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import './home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

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
          Text(
            'Rate our App :',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: SmoothStarRating(
              rating: rating,
              size: 30,
              filledIconData: Icons.star,
              halfFilledIconData: Icons.star_half,
              defaultIconData: Icons.star_border,
              starCount: 5,
              allowHalfRating: false,
              spacing: 1.0,
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
          RaisedButton(
            focusColor: Colors.blue,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
              Navigator.pop(context);
            },
          ),
        ]),
      ),
    );
  }
}
