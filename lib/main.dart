import 'package:flutter/material.dart';
import './utils/theme.dart';
import './home.dart';
import './onecoupon.dart';
import './login.dart';
import './feedback.dart';
import './settings.dart';
import './addcoupon.dart';
import './clickcoupon.dart';
import './personalcoupon.dart';
import './addoption.dart';

void main() => {
      runApp(MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/home',
        routes: {
          '/home': (context) => Home(),
          '/login': (context) => Login(),
          '/onecoupon': (context) => OneCoupon(),
          '/feed': (context) => Feed(),
          '/set': (context) => Settings(),
          '/add': (context) => AddCoupon(),
          '/click': (context) => ClickCoupon(),
          '/yourcoupon': (context) => Pcoupon(),
          '/option': (context) => Options()
        },
        theme: basicTheme(),
      ))
    };
