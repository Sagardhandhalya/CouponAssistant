

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:CouponAssistant/addoption.dart';



void main(){
testWidgets('select option has two button click and upload', (WidgetTester tester) async {

    await tester.pumpWidget( MaterialApp(
      home :Options(),
    ) );
    var image = find.text('Add Coupon With Image');
    var gal = find.text('Add Coupon Manually');
    expect(image, findsOneWidget );
    expect(gal, findsOneWidget );
    
});

}