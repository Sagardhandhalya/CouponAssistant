

import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';

import 'package:test/test.dart';
void main() {
  group('Coupon Assistant app', () {
   

    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });
    Future<void> delay([int milliseconds = 250]) async {
  await Future<void>.delayed(Duration(milliseconds: milliseconds));
}
    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });
  
    final scaf = find.byValueKey("onecouponscaf");
    final back = find.byValueKey("back_button");
    final onecoupon = find.byValueKey("lGhp2PqDenXRELXRVSDt");
    final onecoupon2 = find.byValueKey("oXiSVgpdXldozGGqFiHD");
     final copy = find.byValueKey("copy_code");
    final search = find.byValueKey("search_button");
      final comment = find.byValueKey("comment_button");
        final share = find.byValueKey("share_button");
         final tcbox = find.byValueKey("tcbox");
    final login = find.byValueKey("login");
    final feedback = find.byValueKey("feedback");
    final terms = find.byValueKey("terms");
    final SerializableFinder drawerOpenButton = find.byTooltip('Open navigation menu');
    final SerializableFinder sysback = find.byTooltip('Back'); 
      test('Checking health od driver', () async {
         Health h = await driver.checkHealth();
  print(h.status);

      }
      );


    test('home paged general coupon and functionality test', () async {
      
  
   await driver.tap(search);
   await driver.waitForAbsent(search);
   await driver.enterText("f");
    await driver.tap(back);
    await driver.waitForAbsent(find.text("f"));
    await driver.tap(onecoupon);
    await driver.waitForAbsent(onecoupon);

    await driver.tap(copy);
  
    await driver.tap(comment);
    await driver.waitFor(tcbox);
  await driver.tap(comment);
//   await driver.tap(share);
//      print("tepped a search");
//   // await driver.waitForAbsent(share);
//     await Process.run(
//   'adb', 
//   <String>['shell', 'input', 'keyevent', 'KEYCODE_BACK'], 
//   runInShell: true,
// );

  await driver.waitFor(sysback);
  await driver.tap(sysback);

// print("tepped a back");
await driver.tap(onecoupon2);
    await driver.waitForAbsent(onecoupon2);
    await driver.tap(copy);
  
    await driver.tap(comment);
    await driver.waitFor(tcbox);

   await driver.waitFor(sysback);
  await driver.tap(sysback);
    await delay(2000);

    print("home paged general coupon and functionality test paseed !!!!!!");
});
  
  test('drawer befor login test..', () async{
    final timeline = await driver.traceAction(() async {
    // open drawer...
    await driver.waitFor(drawerOpenButton);
    await driver.tap(drawerOpenButton);
    // tap login ..
    await driver.waitFor(login);
    await driver.tap(login);
         await driver.waitFor(sysback);
  await driver.tap(sysback);


   print( "tap on feedback");
    await driver.waitFor(feedback);
    await driver.tap(feedback);

    await driver.waitFor(sysback);
  await driver.tap(sysback);
    });

  final summary = new TimelineSummary.summarize(timeline);

      // Then, save the summary to disk.
      summary.writeSummaryToFile('scrolling_summary', pretty: true);

      // Optionally, write the entire timeline to disk in a json format.
      // This file can be opened in the Chrome browser's tracing tools
      // found by navigating to chrome://tracing.
      summary.writeTimelineToFile('scrolling_timeline', pretty: true);


print("drawer befor login test passed..!!!");

}
  );

  final signinbtn = find.byValueKey("signinbtn");
  final guestbtn = find.byValueKey("guestbtn");

  test('login test..',() async {
  
  await driver.waitFor(login);
    await driver.tap(login);
        
    await driver.tap(guestbtn);

     await driver.waitFor(drawerOpenButton);
    await driver.tap(drawerOpenButton);
    // tap login ..
    await driver.waitFor(login);
    await driver.tap(login);

    await driver.tap(signinbtn);
    delay(2000);


  });

  });
  
}


// flutter drive --target=test_driver/app.dart