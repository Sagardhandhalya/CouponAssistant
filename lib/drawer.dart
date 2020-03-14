import 'package:flutter/material.dart';
import './services/sign_in.dart';

class UserDrawer extends StatelessWidget {
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
            child: CircleAvatar(
              backgroundImage: NetworkImage(imageUrl),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.account_circle,
              size: 40,
              color: Colors.blueAccent,
            ),
            title: Text('Sign Out'),
            onTap: () {
              signOutGoogle();
            },
          ),
          ListTile(
            leading: Icon(
              Icons.feedback,
              size: 40,
              color: Colors.blueAccent,
            ),
            title: Text(
              'Feedback',
            ),
            onTap: () {
              Navigator.pushNamed(context, '/feed');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              size: 40,
              color: Colors.blueAccent,
            ),
            title: Text('Settings'),
            onTap: () {
              Navigator.pushNamed(context, '/set');
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
            child: Text('Coupon Assistent',
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                )),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.account_circle,
              size: 40,
              color: Colors.blueAccent,
            ),
            title: Text('Login'),
            onTap: () {
              Navigator.pushNamed(context, '/login');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.feedback,
              size: 40,
              color: Colors.blueAccent,
            ),
            title: Text(
              'Feedback',
            ),
            onTap: () {
              Navigator.pushNamed(context, '/feed');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              size: 40,
              color: Colors.blueAccent,
            ),
            title: Text('Settings'),
            onTap: () {
              Navigator.pushNamed(context, '/set');
            },
          ),
        ],
      ),
    );
  }
}
