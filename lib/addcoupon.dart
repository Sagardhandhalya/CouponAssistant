import 'package:flutter/material.dart';

class AddCoupon extends StatefulWidget {
  @override
  _AddCouponState createState() => _AddCouponState();
}

class _AddCouponState extends State<AddCoupon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AddCoupon'),
      ),
      body: Center(
        child: Text('AddCoupon will go here'),
      ),
    );
  }
}
