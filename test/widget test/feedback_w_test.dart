import 'package:CouponAssistant/feedback.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
void main(){

  testWidgets('personal coupon widgate all test', (WidgetTester tester) async{
    await tester.pumpWidget( MaterialApp(
      home :Feed(),
    ) );

    expect(find.byType(ListView),findsNWidgets(1) );
     expect(find.byType(SmoothStarRating),findsNWidgets(1) );
     expect(find.byType(TextFormField),findsNWidgets(1) );
     await tester.enterText(find.byType(TextFormField), "Good to see you again");
     expect(find.text("Good to see you again"), findsOneWidget);
     expect(find.text('Submit'), findsOneWidget);
     

  });
}