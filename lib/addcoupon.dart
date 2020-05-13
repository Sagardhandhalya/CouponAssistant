import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import './home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(new MaterialApp(
  home: AddCoupon(),
  theme: ThemeData(
    primarySwatch: Colors.green,
  ),
));

class AddCoupon extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _AddCouponState();
}

class _CouponData {
  String company = '';
  String discount = '';
  String exp_date = '';
  String coupon_code = '';
  String t_c = '';
  String other_details = '';

  _CouponData(
      {this.company,
      this.coupon_code,
      this.exp_date,
      this.discount,
      this.other_details,
      this.t_c});
}

class _AddCouponState extends State<AddCoupon> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  TextEditingController _datecontroller=new TextEditingController();

  Map data = {};
  var companies=[
    'Flipkart',
    'Snapdeal',
    'Amazon',
    'Myntra',
    'PayTM',
    'Infibeam',
    'Nykaa',
    'Limeroad',
    'Shopclues',
    'Naaptol',
    'TATACliq',
    'MakeMyTrip',
    'ClearTrip',
    'TravelYaari',
    'Yatra',
    'EaseMyTrip',
    'PharmEasy',
    'BookMyShow',
    'OLA',
    'Uber',
    'Swiggy',
    'BigBasket',
    'Lenskart',
    'Grofers',
    'OYO Rooms',
    'Pepperfry',
    'Urban ladder',
    'UrbanClap',
    'Redbus',
    'Byjus',
    'UpGrad',
    'IndiaMart',
    'Ebay',
    'Rediff',
    'FutureBazaar',
    'Homeshop18',
    '1mg',
    'FirstCry',
  ];
  String _currentSelectedValue="";
  _CouponData _data = new _CouponData();
  DateTime selectedDate = DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        var month=selectedDate.month.toString();
        if(month.length==1)
        {
          month="0"+month;
        }
        var day=selectedDate.day.toString();
        if(day.length==1)
        {
          day="0"+day;
        }
        _datecontroller.text= selectedDate.year.toString()+"-"+ month+"-"+day;
      });
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    print(data);
    final Size screenSize = MediaQuery.of(context).size;

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Add New Coupon'),
      ),
      body: new Container(
          padding: new EdgeInsets.all(20.0),
          child: new Form(
            key: this._formKey,
            child: new ListView(
              children: <Widget>[
                Container(
                  // padding: EdgeInsets.all(16),
                  decoration: new BoxDecoration(
                    borderRadius: new BorderRadius.circular(0.0),
                    border: Border.all(color:Colors.black,width: 2.0),
                    color: Colors.white,
                  ),
                  child: DropDownFormField(
                    titleText: "Company",
                    hintText: 'Please choose company name',
                    
                    value: _currentSelectedValue,
                    onSaved: (value) {
                      setState(() {
                        _currentSelectedValue = value;
                        _data.company=value;
                      });
                    },
                    onChanged: (value) {
                      setState(() {
                        _currentSelectedValue = value;
                      });
                    },
                    dataSource: companies.map((String v){
                      return {
                        "display": v,
                      "value": v,
                      };
                    }).toList(),
                    textField: 'display',
                    valueField: 'value',
                  ),
                ),
                new TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      this._data.coupon_code = value;
                    },
                    decoration: new InputDecoration(
                        hintText: 'Zomato45', labelText: 'Enter Coupon code')),
                
                new Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width-100.0,
                      child: new TextFormField(
                        keyboardType: TextInputType.number,
                        controller: _datecontroller,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        onSaved: (String value) {
                          this._data.exp_date = value;
                        }, 
                        decoration: new InputDecoration(
                          hintText: '2020-04-15',
                          labelText: 'Choose the Expiry date'
                        ),
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                          _selectDate(context);
                      },
                      child: Container(
                        color: Colors.black,
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: new Icon(
                            Icons.date_range,
                            color: Colors.white,
                          ),
                        ),
                      ), 
                    ),
                  ],
                ),

                new TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      if(int.parse(value)>100 || int.parse(value)<1)
                      {
                        return 'please enter valid discount';
                      }
                      return null;
                    },
                    inputFormatters: [
                      WhitelistingTextInputFormatter.digitsOnly
                    ],
                    onSaved: (value) {
                      this._data.discount = value;
                    },
                    decoration: new InputDecoration(
                        hintText: '55 ( * in %)',
                        labelText: 'Enter discount here')),
                new TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (String value) {
                      this._data.t_c = value;
                    },
                    decoration: new InputDecoration(
                        hintText: 'terms and conditions...',
                        labelText: 'Enter terms and conditions ')),
                new TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (String value) {
                      this._data.other_details = value;
                    },
                    // Use email input type for emails.
                    decoration: new InputDecoration(
                        hintText: 'other details...',
                        labelText: 'Enter other details here ')),
                new Container(
                  width: screenSize.width,
                  child: new RaisedButton(
                    child: new Text(
                      'ADD',
                      style: new TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      if (this._formKey.currentState.validate()) {
                        this._formKey.currentState.save();

                        print(_data.company);
                        print(_data.coupon_code);
                        print(_data.discount);
                        print(_data.exp_date);
                        print(_data.t_c);
                        
                        Firestore.instance
                            .collection('users')
                            .document(userId)
                            .collection('personal_coupon')
                            .document()
                            .setData({
                          'company': _data.company,
                          'coupon_code': _data.coupon_code,
                          'exp_date': _data.exp_date,
                          'discount': _data.discount,
                          'other_details': _data.other_details,
                          't_c': _data.t_c
                        });
                        Navigator.pop(context);
                        Navigator.pop(context);
                      }
                    },
                    color: Theme.of(context).indicatorColor,
                  ),
                  margin: new EdgeInsets.only(top: 20.0),
                )
              ],
            ),
          )),
    );
  }
}
