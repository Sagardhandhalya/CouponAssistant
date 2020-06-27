

import 'package:CouponAssistant/addcoupon.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart'; 


void main(){
  group('add coupon cases', (){
var code = find.byKey(Key('Enter coupon code'));
var code1 = find.byKey(Key('Choose the Expiry date'));
 var code2 = find.byKey(Key('Enter discount here'));
var code3 = find.byKey(Key('Enter terms and conditions'));
var code4 = find.byKey(Key('Enter other details here'));

 var code5 = find.text('Add Coupon');
    testWidgets('check all widget are present and functioning currectly', (WidgetTester tester) async {

    await tester.pumpWidget( MaterialApp(
      home :AddCoupon(),
    ) );
    
    expect(find.byType(TextFormField) , findsNWidgets(5));
    expect(code, findsOneWidget );
    await tester.enterText( code, 'Free100');
    expect(find.text('Free100'), findsOneWidget);
    expect(code1, findsOneWidget );
    await tester.tap(code1);
    await tester.pump();
    expect(find.text('30'), findsOneWidget);
    expect(find.text('OK'), findsOneWidget); 
    await tester.tap( find.text('30'));
    await tester.tap( find.text('OK'));
    expect(find.text('2020-06-30'), findsOneWidget);
    expect(code3, findsOneWidget );
    await tester.enterText( code3, 'this are terms');
    expect(find.text('this are terms'), findsOneWidget);
     expect(code4, findsOneWidget );
    await tester.enterText( code4, 'this are other details');
    expect(find.text('this are other details'), findsOneWidget);
    expect(code2, findsOneWidget );
    await tester.enterText( code2, '205');
    expect(find.text('205'), findsOneWidget);

    var code5 = find.text('Add Coupon');
    expect(code5, findsOneWidget );
   

});


testWidgets('give error is discount is > 100', (WidgetTester tester) async {

    await tester.pumpWidget( MaterialApp(
      home :AddCoupon(),
    ) );
 

   
    await tester.enterText( code, 'Free100');
    expect(find.text('Free100'), findsOneWidget);

 
    await tester.tap(code1);
    await tester.pump();
    expect(find.text('30'), findsOneWidget);
    expect(find.text('OK'), findsOneWidget); 
    await tester.tap( find.text('30'));
    await tester.tap( find.text('OK'));
    expect(find.text('2020-06-30'), findsOneWidget);

     // test discout < 100
    var code2 = find.byKey(Key('Enter discount here'));
    expect(code2, findsOneWidget );
    await tester.enterText( code2, '205');
    expect(find.text('205'), findsOneWidget);

    var code5 = find.text('Add Coupon');
    expect(code5, findsOneWidget );
    await tester.tap(code5);
    await tester.pump();

    var error = find.text('please enter valid discount');
    expect(error, findsOneWidget);

});



testWidgets('give error if coupon code is null', (WidgetTester tester) async {

    await tester.pumpWidget( MaterialApp(
      home :AddCoupon(),
    ) );
   
  
  
 
  
    await tester.enterText( code, 'Free100');
    expect(find.text('Free100'), findsOneWidget);

    var code2 = find.byKey(Key('Enter discount here'));
    expect(code2, findsOneWidget );
    await tester.enterText( code2, '25');
    expect(find.text('25'), findsOneWidget);

    var code5 = find.text('Add Coupon');
    expect(code5, findsOneWidget );
    await tester.tap(code5);
    await tester.pump();

    await tester.tap(code5);
    await tester.pump();

    var error1 = find.text('Please enter some text');
    expect(error1, findsOneWidget);
   

});


testWidgets('give error if date is null', (WidgetTester tester) async {

    await tester.pumpWidget( MaterialApp(
      home :AddCoupon(),
    ) );
   
   
   
    await tester.enterText( code, 'Free100');
    expect(find.text('Free100'), findsOneWidget);
  
  
    await tester.enterText( code2, '25');
    expect(find.text('25'), findsOneWidget);

    await tester.tap(code5);
    await tester.pump();

    var error1 = find.text('Please enter some text');
    expect(error1, findsOneWidget);
   

});

  });


}