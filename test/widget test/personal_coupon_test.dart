import 'package:CouponAssistant/personalcoupon.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
void main(){

  testWidgets('personal coupon widgate all test', (WidgetTester tester) async{
    await tester.pumpWidget( MaterialApp(
      home :Pcoupon(),
    ) );

    //expect(find.byType(IconButton),findsNWidgets(3) );
     expect(find.byType(BottomAppBar),findsNWidgets(1) );
     expect(find.byType(Hero),findsNWidgets(1) );
     

  });
}