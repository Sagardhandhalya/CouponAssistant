import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import './drawer.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

String userId = 'user';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

const spinkit = SpinKitRotatingCircle(
  color: Colors.green,
  size: 50.0,
);

class _HomeState extends State<Home> {
  bool isloggedin = false;
  String sortby = "discount";

  Widget _buildcoupon(BuildContext context, DocumentSnapshot doc) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/onecoupon', arguments: {
          'company': doc['company'],
          'exp_date': doc['exp_date'],
          'discount': doc['discount'],
          'coupon_code': doc['coupon_code'],
          't_c': doc['t_c'],
          'other_details': doc['other_details'],
          'personal': false
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Container(
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.orange[50],

              spreadRadius: 5.0, // has the effect of extending the shadow
            ),
          ], borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue[200],
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
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      )
                    ]),
              ),
              SizedBox(height: 30),
              Column(children: <Widget>[
                Text(
                  doc['discount'] + '%OFF',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w300,
                      color: Theme.of(context).accentColor),
                ),
                SizedBox(height: 10),
                Text(
                  'Expiry date',
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).accentColor),
                ),
                SizedBox(height: 5),
                Text(
                  doc['exp_date'],
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).accentColor),
                ),
              ]),
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
    } else {
      setState(() {
        isloggedin = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _loaduser();
    return Scaffold(
      appBar: AppBar(
        title: Text('General Coupon'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.sort),
              onPressed: () {
                setState(() {
                  if (sortby == "exp_date") {
                    sortby = "discount";
                  } else {
                    sortby = "exp_date";
                  }
                });
              })
        ],
      ),
      drawer: isloggedin ? UserDrawer() : NormalDrawer(),
      body: StreamBuilder(
        stream: Firestore.instance
            .collection("general coupons")
            .orderBy(sortby, descending: false)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: spinkit,
            );
          }
          return GridView.count(
            // Create a grid with 2 columns. If you change the scrollDirection to
            // horizontal, this produces 2 rows.
            crossAxisCount: 2,
            // Generate 100 widgets that display their index in the List.
            children: List.generate(snapshot.data.documents.length, (index) {
              return _buildcoupon(context, snapshot.data.documents[index]);
            }),
          );
        },
      ),
    );
  }
}

/*
 Widget build(BuildContext context) {
    _loaduser();
    return Scaffold(
      appBar: AppBar(
        title: Text('General Coupon'),
      ),
      drawer: isloggedin ? UserDrawer() : NormalDrawer(),
      body: StreamBuilder(
        stream: Firestore.instance
            .collection("general coupons")
            .orderBy("exp_date", descending: false)
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
    );
  }
*/
