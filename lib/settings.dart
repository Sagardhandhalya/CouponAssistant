import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  String userId = '';
  String name = 'User';
  String email='';

  void _loadurl() async {
    final storage = FlutterSecureStorage();
    String userid = await storage.read(key: 'user_id');
    String nam = await storage.read(key: 'name');
    String emil = await storage.read(key: 'email');

    if (userid != null) {
      setState(() {
        userId = userid;
        name = nam;
        email=emil;
      });
    }
  }

  Widget _body()
  {
    return Padding(
      padding: EdgeInsets.fromLTRB(10.0, 30.0,10.0,30.0),
      child: Center(
        child: Card(
          color: Colors.black,
          elevation: 1.0,
          clipBehavior: Clip.antiAlias,
          borderOnForeground: true,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 20.0,),
              new CircleAvatar(
                backgroundColor: Colors.white,
                
                radius: 40.0,
                child: new Text(
                  name[0],
                  style: new TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              new SizedBox(height: 10.0,),
              new Text(
                "@"+"Avi_Patel",
                style: new TextStyle(color:Colors.white),
              ),
              new SizedBox(height: 10.0,),
              new Text(
                "patelavi8995@gmail.com",
                style: new TextStyle(color:Colors.white),
              ),

              SizedBox(height:40.0,),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  new InkWell(  
                    onTap: (){},          
                    child: Container(
                      padding: EdgeInsets.all(5.0),
                      width: 150.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: new BorderRadius.circular(10.0), 
                        color: Colors.white24,
                      ),
                      child: new Column(
                        children: <Widget>[
                          new Text(
                            "Personal Coupons",
                            style: new TextStyle(fontWeight: FontWeight.w600,color: Colors.white),
                          ),
                          SizedBox(height: 10.0,),
                          new Text(
                            "10",
                            style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0,color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                  new InkWell(          
                    onTap: (){},      
                    child: Container(
                      padding: EdgeInsets.all(5.0),
                      width: 150.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: new BorderRadius.circular(10.0), 
                        color: Colors.white24,
                      ),
                      child: new Column(
                        
                        children: <Widget>[
                          new Text(
                            "General Coupons",
                            style: new TextStyle(fontWeight: FontWeight.w600,color: Colors.white),
                          ),
                          SizedBox(height: 10.0,),
                          new Text(
                            "20",
                            style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0,color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
              
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // _loadurl();
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: _body(),
    );
  }
}
