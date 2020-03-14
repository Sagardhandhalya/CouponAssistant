import 'package:flutter/material.dart';
import './utils/theme.dart';
import './home.dart';
import './onecoupon.dart';
import './login.dart';
import './feedback.dart';
import './settings.dart';
import './addcoupon.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        // '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/login': (context) => Login(),
        '/onecoupon': (context) => OneCoupon(),
        '/feed': (context) => Feed(),
        '/set': (context) => Settings(),
        '/add': (context) => AddCoupon()
      },
      theme: basicTheme(),
    ));
