import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:share/share.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:async';

class OneCoupon extends StatefulWidget {
  @override
  _OneCouponState createState() => _OneCouponState();
}


class _OneCouponState extends State<OneCoupon> {

@override
void initState() { 
  super.initState();
   var initializationSettingsAndroid =
        new AndroidInitializationSettings('@mipmap/launcher_icon'); 
    var initializationSettingsIOS = new IOSInitializationSettings();
    var initializationSettings = new InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.initialize(initializationSettings, onSelectNotification: onSelectNotification);
  
}
Future onSelectNotification(String payload) async {
    showDialog(
      context: context,
      builder: (_) {
        return new AlertDialog(
          title: Text("PayLoad"),
          content: Text("Payload : $payload"),
        );
      },
    );
  }

  bool isOpen = false;
  Map data = {};

  
  //   Future<void> _scheduleNotification() async {
    
  //   var androidPlatformChannelSpecifics = AndroidNotificationDetails(
  //       'your other channel id',
  //       'your other channel name',
  //       'your other channel description',
  //       enableLights: true,
  //       color: const Color.fromARGB(255, 255, 0, 0),
  //       ledColor: const Color.fromARGB(255, 255, 0, 0),
  //       ledOnMs: 1000,
  //       ledOffMs: 500);
  //   var iOSPlatformChannelSpecifics =
  //       IOSNotificationDetails(sound: 'slow_spring_board.aiff');
  //   var platformChannelSpecifics = NotificationDetails(
  //       androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
  //   await flutterLocalNotificationsPlugin.show(
  //          0,
  //   'Coupon expire',
  //   'your coupon will expire .............. plese use them..',
    
  //   platformChannelSpecifics,
  //       );


  //       var pendingNotificationRequests =
  //        await flutterLocalNotificationsPlugin.pendingNotificationRequests();
        
  //    print(pendingNotificationRequests.length);
  // }
  
    Future<void> _scheduleNotification() async {
      var pendingNotificationRequests =
         await flutterLocalNotificationsPlugin.pendingNotificationRequests();
        
     print(pendingNotificationRequests.length);
     int id = pendingNotificationRequests.length +1;
     String title = 'coupon Expiry Update';
     String description  = "your coupon from"+ data['company'] +"will expire on" + data['exp_date']; 
       DateTime dt ;
  dt = await showDatePicker(
            context: context,
            initialDate: DateTime.now().add(Duration(days:1)),
            firstDate: DateTime(2020),
            lastDate: DateTime(2101),
            );
    var scheduledNotificationDateTime = dt;
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'your other channel id',
        'your other channel name',
        'your other channel description',
        enableLights: true,
        color: const Color.fromARGB(255, 255, 0, 0),
        ledColor: const Color.fromARGB(255, 255, 0, 0),
        ledOnMs: 1000,
        ledOffMs: 500);
    var iOSPlatformChannelSpecifics =
        IOSNotificationDetails(sound: 'slow_spring_board.aiff');
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.schedule(
         id,
    title,
    description,
    scheduledNotificationDateTime,
    platformChannelSpecifics,);
      
      //  flutterLocalNotificationsPlugin.cancelAll();
      print(scheduledNotificationDateTime);
        
  }
  
 // Future _showNotificationWithDefaultSound() async {
  
  //           print(dt);
    //         TimeOfDay t = await showTimePicker(
    //   context: context,
    //   initialTime: TimeOfDay.now()
    // );
    // Time t = Time(10,40,30);
    
  //   var scheduledNotificationDateTime = DateTime.now().add( 
  //  Duration(minutes: 1)

  //    );
      //  print(scheduledNotificationDateTime);
  // var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
  //     'your channel id', 'your channel name', 'your channel description',
  //     importance: Importance.Max, priority: Priority.High);
  // var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
  // var platformChannelSpecifics = new NotificationDetails(
  //     androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
// await flutterLocalNotificationsPlugin.showDailyAtTime(
//     0,
//     'Coupon expire',
//     'your coupon will expire .............. plese use them..',
//     t,
//     platformChannelSpecifics,
// );
  //var pendingNotificationRequests =
        // await flutterLocalNotificationsPlugin.pendingNotificationRequests();
        
   //  print(pendingNotificationRequests.length );
       //print( pendingNotificationRequests[1].id);
// flutterLocalNotificationsPlugin.cancelAll() ;
  
//}
  Widget build(BuildContext context) {
    
    data = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text('Coupon details'),
        ),
        body: ListView(children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
        child: Container(
          margin: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              color: Colors.orange[50], shape: BoxShape.circle),
          child: Padding(
            padding: const EdgeInsets.all(60.0),
            child: Column(
              children: <Widget>[
                Image.asset(
                  'assets/gold.png',
                  height: 150,
                  width: 100,
                ),
                Text(
                  data['discount'].indexOf('%') == -1
                      ? '${data['discount']}% OFF'
                      : '${data['discount']} OFF',
                  style: TextStyle(
                      fontSize: 40,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ),
                ),
                SizedBox(
        height: 10,
                ),
                Container(
        margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
        decoration: BoxDecoration(
            borderRadius: new BorderRadius.circular(20),
            border: Border.all(color: Colors.red[300], width: 1)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              data['coupon_code'],
              style: TextStyle(fontSize: 25, color: Colors.black),
            ),
            Material(
                color: Colors.transparent,
                shape: CircleBorder(),
                child: IconButton(
                  icon: Icon(
                    Icons.content_copy,
                    color: Colors.cyan[900],
                  ),
                  onPressed: () {
                    Clipboard.setData(
                        ClipboardData(text: data['coupon_code']));
                  },
                ))
          ],
        ),
                ),
                SizedBox(height: 25),
                Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                'Exp date: ',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w200,
                ),
              ),
              Text(
                data['exp_date'],
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w300),
              ),
            ],
          ),
          IconButton(
            icon: Icon(
              Icons.event_available,
              color: Colors.cyan[900],
            ),
            onPressed:_scheduleNotification,
        
          ),
        ],
                ),
                SizedBox(height: 35),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                // RaisedButton(
                //   color: Colors.white,
                //   shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(10)),
                //   child: Text(
                //     'T & C',
                //     style: TextStyle(fontSize: 20, color: Colors.black),
                //   ),
                IconButton(
        icon: Icon(
          Icons.comment,
          color: Colors.cyan[900],
        ),
        onPressed: () {
          setState(() {
            isOpen = !isOpen;
          });
        },
                ),
                IconButton(
        icon: Icon(
          Icons.share,
          color: Colors.cyan[900],
        ),
        onPressed: () {
          // final RenderBox box = context.findRenderObject();

          Share.share(
              'Hi I have something for you \n' +
                  data['company'] +
                  ' is giving ' +
                  data['discount'] +
                  '% OFF coupon code is *' +
                  data['coupon_code'] +
                  '* expirey data is ' +
                  data['exp_date'] +
                  ' \n \n If you need more coupon then download Coupon Assistant App \n',
              subject: 'Share a coupon from coupon Assistant app');
        },
                ),
                data['personal'] == true
          ? IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              ),
              onPressed: () {
                Firestore.instance
                    .collection('users')
                    .document(userId)
                    .collection('personal_coupon')
                    .document(data['id'])
                    .delete();

                Navigator.pop(context);
              },
            )
          : Container(),
              ],
            ),
            isOpen
                ? Container(
          margin: EdgeInsets.all(10),
          height: 700,
          decoration: BoxDecoration(
              borderRadius: new BorderRadius.circular(5),
              border: Border.all(color: Colors.grey, width: 1)),
          child: Column(
            children: <Widget>[
              Text('Terms & conditions',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 10,
              ),
              Text(data['t_c'],
                  style: TextStyle(fontSize: 15, color: Colors.black))
            ],
          ),
        )
                : Container()
          ]));
  }
}
