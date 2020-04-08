import 'package:flutter/material.dart';
import './home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

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
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    }, // Use email input type for emails.
                    decoration: new InputDecoration(
                        hintText: 'Zomato',
                        labelText: 'Enter company or Brand name')),
                new TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      this._data.coupon_code = value;
                    }, // Use email input type for emails.
                    decoration: new InputDecoration(
                        hintText: 'Zomato45', labelText: 'Enter Coupon code')),
                // DateTimeField(
                //   format: format,
                //   decoration: new InputDecoration(
                //       hintText: '2020-01-25',
                //       labelText: 'Enter Expiry date of the coupon'),
                //   onShowPicker: (context, currentValue) {
                //     return showDatePicker(
                //         context: context,
                //         firstDate: DateTime.now(),
                //         initialDate: currentValue ?? DateTime.now(),
                //         lastDate: DateTime(2100));
                //   },

                //   onSaved : (formatDate(value, [yyyy, '-', mm, '-', dd])) {
                //     this._data.exp_date =
                //         formatDate(value, [yyyy, '-', mm, '-', dd]);
                //   },
                // ),
                new TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      this._data.exp_date = value;
                    }, // Use email input type for emails.
                    decoration: new InputDecoration(
                        hintText: '2020-04-15',
                        labelText: 'Enter Expiry date of the coupon')),
                new TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    inputFormatters: [
                      WhitelistingTextInputFormatter.digitsOnly
                    ],
                    onSaved: (value) {
                      this._data.discount = value;
                    },
                    // onSaved: (int value) {
                    //   this._data.discount = value;
                    // }, // Use email input type for emails.
                    decoration: new InputDecoration(
                        hintText: '55 ( * in %)',
                        labelText: 'Enter discount here')),
                new TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (String value) {
                      this._data.t_c = value;
                    }, // Use email input type for emails.
                    decoration: new InputDecoration(
                        hintText: 'terms and conditions...',
                        labelText: 'Enter terms and conditions ')),
                new TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (String value) {
                      this._data.other_details = value;
                    },
                    // Use email input type for emails.
                    decoration: new InputDecoration(
                        hintText: 'other details...',
                        labelText: 'Enter other details here ')),
                new Container(
                  width: screenSize.width,
                  child: new RaisedButton(
                    child: new Text(
                      'ADD',
                      style: new TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      if (this._formKey.currentState.validate()) {
                        this._formKey.currentState.save();

                        //print(_data.discount);
                        Firestore.instance
                            .collection('users')
                            .document(userId)
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
                        Navigator.pop(context);
                      }
                    },
                    color: Theme.of(context).indicatorColor,
                  ),
                  margin: new EdgeInsets.only(top: 20.0),
                )
              ],
            ),
          )),
    );
  }
}
