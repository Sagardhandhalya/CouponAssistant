import 'package:flutter/material.dart';
import './services/sign_in.dart';
import 'home.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:url_launcher/url_launcher.dart';


void _launchURL() async {
  const url = 'https://www.websitepolicies.com/policies/view/eicF0v14';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class UserDrawer extends StatefulWidget {
  @override
  _UserDrawerState createState() => _UserDrawerState();
}

class _UserDrawerState extends State<UserDrawer> {
  String imageUrl = 'https://image.shutterstock.com/image-vector/user-icon-trendy-flat-style-260nw-418179856.jpg';
  String name = 'User';

@override
void initState() { 
  super.initState();
    _loadurl(); 
}

  

  void _loadurl() async {
    final storage = FlutterSecureStorage();
    String url = await storage.read(key: 'imageUrl');
    String nam = await storage.read(key: 'name');

    if (url != null) {
      setState(() {
        imageUrl = url;
        name = nam;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    

    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Center(
              child: Column(children: <Widget>[
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(imageUrl),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Hello..!! $name',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic,
                  ),
                )
              ]),
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.monetization_on,
              size: 40,
              color: Theme.of(context).primaryColor,
            ),
            title: Text(
              'My Coupon',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w300,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/yourcoupon');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.account_circle,
              size: 40,
              color: Theme.of(context).primaryColor,
            ),
            title: Text(
              'Sign Out',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w300,
              ),
            ),
            onTap: () {
              signOutGoogle();

              Navigator.pushNamed(context, '/feed');
              //Navigator.pushNamed(context, '/home');
              Navigator.of(context)
                  .push(new MaterialPageRoute(builder: (BuildContext context) {
                return Home();
              }));
            },
          ),
          ListTile(
            leading: Icon(Icons.feedback,
                size: 40, color: Theme.of(context).primaryColor),
            title: Text(
              'Feedback',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w300,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/feed');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.bookmark,
              size: 40,
              color: Theme.of(context).primaryColor,
            ),
            title: Text(
              'Terms & Conditions',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w300,
              ),
            ),
            onTap: () {
              _launchURL();
            },
          ),
        ],
      ),
    );
  }
}

class NormalDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Center(
              child: Text('Coupon Assistant',
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                  )),
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
          ),
          ListTile(
            key: ValueKey("login"),
            leading: Icon(
              Icons.account_circle,
              size: 40,
              color: Theme.of(context).primaryColor,
            ),
            title: Text(
              'Login',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w300,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/login');
            },
          ),
          ListTile(
            key: ValueKey("feedback"),
            leading: Icon(
              Icons.feedback,
              size: 40,
              color: Theme.of(context).primaryColor,
            ),
            title: Text(
              'Feedback',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w300,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/login');
            },
          ),
          ListTile(
            key: ValueKey("terms"),
            leading: Icon(
              Icons.bookmark,
              size: 40,
              color: Theme.of(context).primaryColor,
            ),
            title: Text(
              'Terms & Conditions',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w300,
              ),
            ),
            onTap: () {
              _launchURL();
            },
          ),
        ],
      ),
    );
  }
}
