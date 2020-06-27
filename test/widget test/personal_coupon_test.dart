import 'package:CouponAssistant/personalcoupon.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
void main(){

  testWidgets('personal coupon widgate all test', (WidgetTester tester) async{
    await tester.pumpWidget( MaterialApp(
      home :Pcoupon(),
    ) );

    expect(find.byType(ToggleButtons),findsNWidgets(1) );
     expect(find.byType(FloatingActionButton),findsNWidgets(1) );
     expect(find.byType(IconButton),findsNWidgets(1) );
  
   expect(find.byType(BottomAppBar),findsOneWidget );
   
   
     expect(find.byType(Hero),findsNWidgets(1) );
     

  });
}