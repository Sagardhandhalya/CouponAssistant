// import 'package:flutter/material.dart';

// class Login extends StatefulWidget {
//   @override
//   _LoginState createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Login'),
//       ),
//       body: Center(
//           child: OutlineButton(
//         splashColor: Colors.red[700],
//         onPressed: () {},
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
//         highlightElevation: 0,
//         borderSide: BorderSide(color: Colors.grey),
//         child: Padding(
//           padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
//           child: Row(
//             mainAxisSize: MainAxisSize.min,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Image(image: AssetImage("assets/google_logo.png"), height: 35.0),
//               Padding(
//                 padding: const EdgeInsets.only(left: 10),
//                 child: Text(
//                   'Sign in with Google',
//                   style: TextStyle(
//                     fontSize: 20,
//                     color: Colors.grey,
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       )),
//     );
//   }
// }

import 'package:flutter/material.dart';
import './services/sign_in.dart';
import 'home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: ListView(
        children: <Widget>[
          Container(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Container(
                    margin: EdgeInsets.all(40.0),
                    decoration: BoxDecoration(
                        color: Colors.lightBlue[50], shape: BoxShape.circle),
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        children: <Widget>[
                          RotationTransition(
                            turns: new AlwaysStoppedAnimation(50 / 360),
                            child: Image.asset(
                              'assets/senlogo.png',
                              height: 200,
                              width: 200,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                _signInButton(),
                SizedBox(height: 50),
                Row(children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      height: 1.0,
                      width: 130.0,
                      color: Colors.black,
                    ),
                  ),
                  Text('OR'),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      height: 1.0,
                      width: 130.0,
                      color: Colors.black,
                    ),
                  ),
                ]),
                SizedBox(height: 20),
                _guest(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _signInButton() {
    return OutlineButton(
      splashColor: Colors.blue[50],
      onPressed: () {
        signInWithGoogle().whenComplete(() {
          Navigator.of(context)
              .push(new MaterialPageRoute(builder: (BuildContext context) {
            return Home();
          }));
        });
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("assets/google_logo.png"), height: 20.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _guest() {
    return OutlineButton(
      splashColor: Colors.blue[50],
      onPressed: () {
        Navigator.of(context)
            .push(new MaterialPageRoute(builder: (BuildContext context) {
          return Home();
        }));
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Continue as Guest',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
