import 'package:CouponAssistant/home.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
void main(){

  testWidgets('general coupon widgate all test', (WidgetTester tester) async{
    await tester.pumpWidget( MaterialApp(
      home :Home(),
    ) );

    expect(find.byType(IconButton),findsNWidgets(2) );
     expect(find.byType(BottomAppBar),findsNWidgets(1) );
     expect(find.byType(Hero),findsNWidgets(0) );
     

  });
}