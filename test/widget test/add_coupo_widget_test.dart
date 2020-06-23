

import 'package:CouponAssistant/addcoupon.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart'; 


void main(){
testWidgets('add coupon form', (WidgetTester tester) async {

    await tester.pumpWidget( MaterialApp(
      home :AddCoupon(),
    ) );
    expect(find.byType(Form) , findsOneWidget);
    expect(find.byType(DropDownFormField) , findsOneWidget);
    expect(find.text('Ebay') , findsOneWidget);
    expect(find.byType(TextFormField) , findsNWidgets(5));

    var code = find.byKey(Key('Enter coupon code'));
    expect(code, findsOneWidget );
    await tester.enterText( code, 'Free100');
    expect(find.text('Free100'), findsOneWidget);
  // here i select 30 dateto test

    var code1 = find.byKey(Key('Choose the Expiry date'));
    expect(code1, findsOneWidget );
    await tester.tap(code1);
    await tester.pump();
    expect(find.text('30'), findsOneWidget);
    expect(find.text('OK'), findsOneWidget); 
    await tester.tap( find.text('30'));
    await tester.tap( find.text('OK'));
    expect(find.text('2020-06-30'), findsOneWidget);

    var code2 = find.byKey(Key('Enter discount here'));
    expect(code2, findsOneWidget );
    await tester.enterText( code2, '23');
    expect(find.text('23'), findsOneWidget);

    var code3 = find.byKey(Key('Enter terms and conditions'));
    expect(code3, findsOneWidget );
    await tester.enterText( code3, 'this are terms');
    expect(find.text('this are terms'), findsOneWidget);

    var code4 = find.byKey(Key('Enter other details here'));
    expect(code4, findsOneWidget );
    await tester.enterText( code4, 'this are other details');
    expect(find.text('this are other details'), findsOneWidget);

    var code5 = find.text('Add Coupon');
    expect(code5, findsOneWidget );
    
   

});

}