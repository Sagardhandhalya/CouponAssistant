import 'package:flutter/material.dart';
import './services/sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddCoupon extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _AddCouponState();
}

class _CouponData {
  String company = '';
  String discount = '';
  String exp_date = '';
  String coupon_code = '';
  String t_c = '';
  String other_details = '';

  _CouponData(
      {this.company,
      this.coupon_code,
      this.exp_date,
      this.discount,
      this.other_details,
      this.t_c});
}

class _AddCouponState extends State<AddCoupon> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  _CouponData _data = new _CouponData();

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Add New Coupon'),
      ),
      body: new Container(
          padding: new EdgeInsets.all(20.0),
          child: new Form(
            key: this._formKey,
            child: new ListView(
              children: <Widget>[
                new TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (String value) {
                      this._data.company = value;
                    }, // Use email input type for emails.
                    decoration: new InputDecoration(
                        hintText: 'Zomato',
                        labelText: 'Enter company or Brand name')),
                new TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (String value) {
                      this._data.coupon_code = value;
                    }, // Use email input type for emails.
                    decoration: new InputDecoration(
                        hintText: 'Zomato45', labelText: 'Enter Coupon code')),
                new TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (String value) {
                      this._data.exp_date = value;
                    }, // Use email input type for emails.
                    decoration: new InputDecoration(
                        hintText: '3 june, 2020',
                        labelText: 'Enter Expiry dformate of the coupon')),
                new TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (String value) {
                      this._data.discount = value;
                    }, // Use email input type for emails.
                    decoration: new InputDecoration(
                        hintText: '55 % OFF',
                        labelText: 'Enter discount here')),
                new TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (String value) {
                      this._data.t_c = value;
                    }, // Use email input type for emails.
                    decoration: new InputDecoration(
                        hintText: 'should only use on on site.',
                        labelText: 'Enter terms and conditions ')),
                new TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (String value) {
                      this._data.other_details = value;
                    }, // Use email input type for emails.
                    decoration: new InputDecoration(
                        hintText:
                            'have to go there first, you can use only for two people...',
                        labelText: 'Enter other details here ')),
                new Container(
                  width: screenSize.width,
                  child: new RaisedButton(
                    child: new Text(
                      'ADD',
                      style: new TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      this._formKey.currentState.save();
                      print(_data);
                      Firestore.instance
                          .collection('users')
                          .document(current_user_id)
                          .collection('personal_coupon')
                          .document()
                          .setData({
                        'company': _data.company,
                        'coupon_code': _data.coupon_code,
                        'exp_date': _data.exp_date,
                        'discount': _data.discount,
                        'other_details': _data.other_details,
                        't_c': _data.t_c
                      });
                      Navigator.pop(context);
                    },
                    color: Colors.redAccent,
                  ),
                  margin: new EdgeInsets.only(top: 20.0),
                )
              ],
            ),
          )),
    );
  }
}
