import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ClickCoupon(),
    );
  }
}

class ClickCoupon extends StatefulWidget {
  @override
  _ClickCouponState createState() => _ClickCouponState();
}

class _ClickCouponState extends State<ClickCoupon> {
  File pickedImage;

  bool isImageLoaded = false;
  bool isReaded = false;
  String output = "";

  Future pickImage() async {
    var tempStore = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      pickedImage = tempStore;
      isImageLoaded = true;
    });
  }

  Future clickImage() async {
    var tempStore = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      pickedImage = tempStore;
      isImageLoaded = true;
    });
  }

  Future readText() async {
    FirebaseVisionImage ourImage = FirebaseVisionImage.fromFile(pickedImage);
    TextRecognizer recognizeText = FirebaseVision.instance.textRecognizer();
    VisionText readText = await recognizeText.processImage(ourImage);

    for (TextBlock block in readText.blocks) {
      for (TextLine line in block.lines) {
        for (TextElement word in line.elements) {
          output = output + word.text;
        }
      }
    }
    setState(() {
      isReaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Click Coupon'),
      ),
      body: ListView(children: <Widget>[
        Column(
          children: <Widget>[
            SizedBox(height: 100.0),
            isReaded ? Text(output) : Container(),
            isImageLoaded
                ? Center(
                    child: Container(
                        height: 300.0,
                        width: 300.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: FileImage(pickedImage),
                                fit: BoxFit.cover))),
                  )
                : Container(),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  color: Colors.red,
                  child: Text('Pick an image'),
                  onPressed: pickImage,
                ),
                RaisedButton(
                  color: Colors.red,
                  child: Text('click an image'),
                  onPressed: clickImage,
                ),
              ],
            ),
            SizedBox(height: 10.0),
            RaisedButton(
              child: Text('Read Text'),
              onPressed: readText,
            ),
          ],
        ),
      ]),
    );
  }
}
