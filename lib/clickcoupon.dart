import 'package:flutter/material.dart';

class ClickCoupon extends StatefulWidget {
  @override
  _ClickCouponState createState() => _ClickCouponState();
}

class _ClickCouponState extends State<ClickCoupon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ClickCoupon'),
      ),
      body: Center(
        child: Text('ClickCoupon will go here'),
      ),
    );
  }
}
