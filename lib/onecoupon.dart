import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './services/sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OneCoupon extends StatefulWidget {
  @override
  _OneCouponState createState() => _OneCouponState();
}

class _OneCouponState extends State<OneCoupon> {
  bool isOpen = false;
  Map data = {};
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text('Coupon details'),
        ),
        body: ListView(children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              color: Colors.yellow[200],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/senlogo.png'),
                    backgroundColor: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      data['company'],
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.blue,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      data['discount'] + '% OFF',
                      style: TextStyle(
                          fontSize: 45,
                          color: Colors.red,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['coupon_code'],
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    Material(
                        color: Colors.transparent,
                        shape: CircleBorder(),
                        child: IconButton(
                          icon: Icon(
                            Icons.content_copy,
                            color: Colors.blue,
                          ),
                          onPressed: () {
                            Clipboard.setData(
                                ClipboardData(text: data['coupon_code']));
                          },
                        ))
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          'Exp date: ',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          data['exp_date'],
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.event_available,
                        color: Colors.blue,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  'T & C',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                onPressed: () {
                  setState(() {
                    isOpen = !isOpen;
                  });
                },
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  'Delete coupon',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                onPressed: () {},
              ),
            ],
          ),
          isOpen
              ? Container(
                  margin: EdgeInsets.all(10),
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    color: Colors.yellow[200],
                  ),
                  child: Center(
                    child: Text(data['t_c'],
                        style: TextStyle(fontSize: 15, color: Colors.black)),
                  ))
              : Container()
        ]));
  }
}
