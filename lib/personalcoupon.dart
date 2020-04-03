import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import './services/sign_in.dart';

class Pcoupon extends StatefulWidget {
  @override
  _PcouponState createState() => _PcouponState();
}

const spinkit = SpinKitRotatingCircle(
  color: Colors.redAccent,
  size: 50.0,
);

class _PcouponState extends State<Pcoupon> {
  Widget _buildcoupon(BuildContext context, DocumentSnapshot doc) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/onecoupon', arguments: {
          'company': doc['company'],
          'exp_date': doc['exp_date'],
          'discount': doc['discount'],
          'coupon_code': doc['coupon_code'],
          't_c': doc['t_c'],
          'other_details': doc['other_details']
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.yellow[400],
              //blurRadius: 1.0, // has the effect of softening the shadow
              spreadRadius: 10.0, // has the effect of extending the shadow
            )
          ], borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: Colors.red[400],
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.red[400],
                        //blurRadius: 1.0, // has the effect of softening the shadow
                        spreadRadius:
                            10.0, // has the effect of extending the shadow
                      )
                    ]),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        doc['company'],
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      )
                    ]),
              ),
              SizedBox(height: 30),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      doc['discount'],
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.blue[400],
                          fontWeight: FontWeight.w300),
                    ),
                    Column(children: <Widget>[
                      Text(
                        'Expiry date',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.blue[400],
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 5),
                      Text(
                        doc['exp_date'],
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.blue[400],
                            fontWeight: FontWeight.w500),
                      ),
                    ])
                  ]),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Coupons'),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.camera_alt,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/click');
              })
        ],
      ),
      body: StreamBuilder(
        stream: Firestore.instance
            .collection('users')
            .document(current_user_id)
            .collection('personal_coupon')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: spinkit,
            );
          }
          return ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) {
              return _buildcoupon(context, snapshot.data.documents[index]);
            },
          );
        },
      ),
      bottomNavigationBar: new BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.menu, color: Colors.white),
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        child: Icon(Icons.add, size: 30),
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
