import 'package:flutter/material.dart';

ThemeData basicTheme() {
  TextTheme _basicTextTheme(TextTheme base) {
    return base.copyWith(
        headline: base.headline.copyWith(
          fontFamily: 'Roboto',
          fontSize: 22.0,
          color: Colors.tealAccent,
        ),
        title: base.title.copyWith(
            fontFamily: 'Merriweather', fontSize: 15.0, color: Colors.green),
        display1: base.headline.copyWith(
          fontFamily: 'Roboto',
          fontSize: 24.0,
          color: Colors.white,
        ),
        display2: base.headline.copyWith(
          fontFamily: 'Merriweather',
          fontSize: 22.0,
          color: Colors.grey,
        ),
        caption: base.caption.copyWith(
          color: Color(0xFFCCC5AF),
        ),
        body1: base.body1.copyWith(
          color: Colors.blue, //Color(0xFF807A6B),
        ));
  }

  final ThemeData base = ThemeData.light();
  return base.copyWith(
      textTheme: _basicTextTheme(base.textTheme),
      //textTheme: Typography().white,
      // primaryColor: Color(0xffce107c),
      primaryColor: Colors.green[700],
      indicatorColor: Colors.teal[700],
      scaffoldBackgroundColor: Color(0xFFF5F5F5),
      accentColor: Colors.black,
      iconTheme: IconThemeData(color: Colors.green, size: 100.0),
      buttonColor: Colors.blue[300],
      backgroundColor: Colors.white,
      tabBarTheme: base.tabBarTheme.copyWith(
        labelColor: Color(0xffce107c),
        unselectedLabelColor: Colors.grey,
      ),
      buttonTheme: ButtonThemeData(
        focusColor: Colors.transparent,
      ));
}
