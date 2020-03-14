import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OneCoupon extends StatefulWidget {
  @override
  _OneCouponState createState() => _OneCouponState();
}

class _OneCouponState extends State<OneCoupon> {
  Map data = {};
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Coupon details'),
      ),
      body: Container(
          child: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                data['company'],
                style: TextStyle(fontSize: 25, color: Colors.redAccent),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                data['coupon_code'],
                style: TextStyle(fontSize: 25, color: Colors.redAccent),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                data['exp_date'],
                style: TextStyle(fontSize: 25, color: Colors.redAccent),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                data['discount'],
                style: TextStyle(fontSize: 25, color: Colors.redAccent),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                data['t_c'],
                style: TextStyle(fontSize: 25, color: Colors.redAccent),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                data['other_details'],
                style: TextStyle(fontSize: 25, color: Colors.redAccent),
              ),
              SizedBox(
                height: 10,
              ),
            ]),
      )),
    );
  }
}
