import 'package:pharmassist/Animation/FadeAnimation.dart';
import 'package:pharmassist/Pills.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController mobile = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        //resizeToAvoidBottomPadding: false,
        body: 
        Container(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                FadeAnimation(
                  2.0,
                Container(
                  height: 475,
                  width: 400,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/1.png'),
                          fit: BoxFit.fill)),
                  child: Stack(
                    children: <Widget>[
                      
                    ],
                  ),
                ),),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: 
                  Column(
                    children: <Widget>[
                      FadeAnimation(
                          1.8,
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(143, 148, 251, .2),
                                      blurRadius: 20.0,
                                      offset: Offset(0, 10))
                                ]),
                            child: Column(
                              children: <Widget>[
                                FadeAnimation(
                                  1.8,
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey[100]))),
                                  child: TextField(
                                    controller: mobile,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Email or Phone number",
                                        hintStyle:
                                            TextStyle(color: Colors.blue[400])),
                                  ),
                                ),),
                                FadeAnimation(
                                  1.8,
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  child: TextField(
                                    controller: password,
                                    decoration: InputDecoration(
                                      //labelText: "Password",
                                        border: InputBorder.none,
                                        hintText: "Password",
                                        hintStyle:
                                            TextStyle(color: Colors.blue[400])),
                                            obscureText: true,
                                  ),
                                )),
                              ],
                            ),
                          )),
                      SizedBox(
                        height: 40,
                      ),
                      FadeAnimation(
                          1.8,
                          Container(
                              height: 45,
                              width: 400,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  gradient: LinearGradient(colors: [
                                    Colors.blue[600],
                                    Colors.blue[600],
                                  ])),
                              child: RaisedButton(
                                child: Center(
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(18.0),
                                  //side: BorderSide(color: Colors.red)
                                ),
                                color: Colors.blue[600],
                                onPressed: () async{
                                  DocumentSnapshot ds =
                                  await Firestore.instance.collection('user').document(mobile.text).get();
                                  if(password.text == ds['password'])
                                  {
                                    Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                    builder: (context) => MyHomePage1(value : mobile.text,name : ds['name'])),
                                  );
                                  }
                                  else
                                  {
                                    print("Login Failed!!!");
                                  }
                                },
                              ))
                          //)
                          ),
                      SizedBox(
                        height: 25,
                      ),
                      FadeAnimation(
                        1.8,
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: FadeAnimation(
                            1.5,
                            Text("Forgot Password?",
                                style: TextStyle(
                                  color: Colors.blue[600],
                                ))),
                      ),),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
