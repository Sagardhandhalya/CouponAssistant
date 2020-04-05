import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import './drawer.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

String userId = '';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

const spinkit = SpinKitRotatingCircle(
  color: Colors.redAccent,
  size: 50.0,
);

class _HomeState extends State<Home> {
  bool isloggedin = false;

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
              color: (int.parse(doc['id']) % 2 == 0)
                  ? Colors.blue[400]
                  : Colors.yellow[400],
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
                      doc['discount'] + '%OFF',
                      style: TextStyle(
                          fontSize: 40,
                          color: (int.parse(doc['id']) % 2 == 0)
                              ? Colors.yellow[400]
                              : Colors.blue[400],
                          fontWeight: FontWeight.w300),
                    ),
                    Column(children: <Widget>[
                      Text(
                        'Expiry date',
                        style: TextStyle(
                            fontSize: 15,
                            color: (int.parse(doc['id']) % 2 == 0)
                                ? Colors.yellow[400]
                                : Colors.blue[400],
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 5),
                      Text(
                        doc['exp_date'],
                        style: TextStyle(
                            fontSize: 18,
                            color: (int.parse(doc['id']) % 2 == 0)
                                ? Colors.yellow[400]
                                : Colors.blue[400],
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

  void _loaduser() async {
    final storage = FlutterSecureStorage();
    userId = await storage.read(key: 'user_id');

    if (userId != null) {
      setState(() {
        isloggedin = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _loaduser();
    return Scaffold(
      appBar: AppBar(
        title: Text('Genral Coupon'),
      ),
      drawer: isloggedin ? UserDrawer() : NormalDrawer(),
      body: StreamBuilder(
        stream: Firestore.instance.collection('general coupons').snapshots(),
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
    );
  }
}
