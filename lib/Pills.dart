//import 'dart:core' as prefix0;
//import 'package:pharmassist/Animation/FadeAnimation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:pharmassist/Animation/FadeAnimation.dart';
import 'package:pharmassist/personal.dart';
import './second.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

import 'MedicinalRecord.dart';
// void main() => runApp(MyApp());

// class MyApp1 extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }
class MyHomePage1 extends StatefulWidget {
  final String value;
  final String name;
  MyHomePage1({Key key, this.value, this.name}) : super(key: key);
  @override
  _MyHomePage1State createState() => _MyHomePage1State();
}

class _MyHomePage1State extends State<MyHomePage1> {
  final FlutterTts flutterTts = FlutterTts();
  final b = " Please,,Place ,,the,, Bottle";
  @override
  Widget build(BuildContext context) {
    //final FlutterTts flutterTts = FlutterTts();
    Future _speak1() async {
      print(widget.value);
      await flutterTts.speak(b);
    }

    Timer(Duration(seconds: 2), () {
      _speak1();
    });
    return MyHomePage2(value: widget.value, name: widget.name);
  }
}

class MyHomePage2 extends StatefulWidget {
  final String value;
  final String name;
  MyHomePage2({Key key, this.value, this.name}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage2> {
  String a;
  String n,city,address;
  var n1,n2,n3,mo1,mo2,mo3,md1,md2,md3,ng1,ng2,ng3,c1,c2,c3;
  int mobi;
  int count = 0;
  int c = 0, med, tabcount;
  int dayTime, midTime, nightTime, medCount;
  String q = "", medicineName, medicineN;
  String f = "";

  //String b="Place, the ,Bottle";
  var now = new DateTime.now();
  var v1 = 0;
  var v2 = 0;
  var v3 = 0;
  final FlutterTts flutterTts = FlutterTts();

  Future function(String f) async {
    DocumentSnapshot ds = await Firestore.instance
        .collection('user')
        .document(widget.value)
        .collection('medicine')
        .document(f)
        .get();
    int time = now.hour.toInt();
    if (time >= 0 && time <= 11) {
      med = ds['Morning'];
    } else if (time > 11 && time <= 19) {
      med = ds['MidDay'];
    } else if (time > 19 && time <= 24) {
      med = ds['Night'];
    } else {
      print("error");
    }

    tabcount = ds['Count'];
    medicineName = ds['name'];
    // dayTime = ds['Morning'];
    // midTime = ds['MidDay'];
    // nightTime = ds['Night'];
    setState(() {
      medicineN = medicineName;
      //medCount = dayTime;
      if((medicineN == "paracetamol" && v1 == 0))
      {
        v1 = 1;
        q = medicineN + ", take " + med.toString() + " pills";
      } 
      else if((medicineN == "paracetamol" && v1 == 1))
      {
        q = "Paracetamol is already taken !";
      }
      else if((medicineN == "Crocin" && v2 == 0))
      {
        v2 = 1;
         q = medicineN + ", take " + med.toString() + " pills";
      }
      else if((medicineN == "Crocin" && v2 == 1))
      {
        q = "Crocin is already taken !";
      }
      else if((medicineN == "asprin" && v3 == 0))
      {
        v3 = 1;
         q = medicineN + ", take " + med.toString() + " pills";
      }
      else if((medicineN == "asprin" && v3 == 1))
      {
        q = "Asprin is already taken !";
      }
    });

    //print(q);
    //print(medicineName);
    await flutterTts.speak(q);
    Future.delayed(const Duration(milliseconds: 5000), () {
      q = "";
    });
  }
  @override
  Widget build(BuildContext context) {
// Future _speak1() async {
//       await flutterTts.speak(b);}

// Timer(Duration(seconds: 2), () {
//       _speak1();
//           });

    Future _speak() async {
      if (c == count) {
        f = count.toString();

        function(f);
        //print(count.toString() + "2");
        setState(() {
          count = 0;
          c = 0;
        });

        Future.delayed(const Duration(milliseconds: 5000), () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    Second(this.med, this.tabcount, this.f, this.widget.value)),
          );
        });
      }
    }

    return Scaffold(
        resizeToAvoidBottomPadding: false,
        drawer: Drawer(
            elevation: 10.0,
            child: Container(
              color: Colors.lightBlue[300],
              child: ListView(children: <Widget>[
          DrawerHeader(child: Row(
              children: <Widget>[
                Icon(Icons.menu,size: 30,color: Colors.black,),
                Text(" Menu",style: TextStyle(fontSize: 40,color: Colors.black,),),
              ],
          )),
          Padding(
              padding: const EdgeInsets.only(top:30.0),
              child: ListTile(
                title: Row(
                  children: <Widget>[
                    Icon(Icons.person,color: Colors.black,),
                    Text("  Personal details",style: TextStyle(fontSize: 25,color: Colors.black),),
                  ],
                ),
                onTap: () async{
                  DocumentSnapshot ds = await Firestore.instance.collection('user').document(widget.value).get();
                  n = ds['name'];
                  mobi = ds['mobile'];
                  city = ds['city'];
                  address = ds['address'];
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Personal(n: n,city : city, mobi : mobi, address : address)),
                  );
                },
              ),
          ),
          Padding(
              padding: const EdgeInsets.only(top:50.0),
              child: ListTile(
                title: Row(
                  children: <Widget>[
                    Icon(Icons.book,color: Colors.black,),
                    Text("  Medical details",style: TextStyle(fontSize: 25,color: Colors.black),),
                  ],
                ),
                onTap: () async{
                  DocumentSnapshot gs = await Firestore.instance.collection('user').document(widget.value).collection('medicine').document('1').get();
                  DocumentSnapshot fs = await Firestore.instance.collection('user').document(widget.value).collection('medicine').document('2').get();
                  DocumentSnapshot hs = await Firestore.instance.collection('user').document(widget.value).collection('medicine').document('3').get();
                  n1 = gs['name'];
                  c1 = gs['Count'];
                  mo1 = gs['Morning'];
                  md1 = gs['MidDay'];
                  ng1 = gs['Night'];
                   n2 = fs['name'];
                  c2 = fs['Count'];
                  mo2 = fs['Morning'];
                  md2 = fs['MidDay'];
                  ng2 = fs['Night'];
                   n3 = hs['name'];
                  c3 = hs['Count'];
                  mo3 = hs['Morning'];
                  md3 = hs['MidDay'];
                  ng3 = hs['Night'];
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            MedicinalRecord(n1 : n1,mo1 : mo1,md1 :md1,ng1 :ng1, c1 : c1,n2 : n2,mo2 : mo2,md2 :md2,ng2 :ng2, c2 : c2,n3 : n3,mo3 : mo3,md3 :md3,ng3 :ng3, c3 : c3,),
                    ),);
                },
              ),
          ),
        ]),
            )),
        body:
            /*StreamBuilder(
          stream: Firestore.instance.collection('pharmassist').snapshots(),
          builder: (context,snapshot){
            if(!snapshot.hasData) 
            return null;
          return*/
            Container(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                FadeAnimation(
                  2.0,
                  Container(
                    height: 250,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/2.png'),
                            fit: BoxFit.fill)),
                    child: Stack(
                      children: <Widget>[],
                    ),
                  ),
                ),
                Column(mainAxisAlignment: MainAxisAlignment.center, children: <
                    Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  FadeAnimation(
                    2.0,
                    Text(
                      "Please Place the Bottle",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  FadeAnimation(
                    2.0,
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      //padding: EdgeInsets.fromLTRB(20,100 ,20, 100),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                // height: 48.70,
                                // width: 48.70,
                                child: GestureDetector(
                                  onLongPress: () {
                                    print("1.0");
                                    setState(() {
                                      count++;
                                    });
                                  },
                                  onLongPressEnd: (int) {
                                    setState(() {
                                      c++;
                                      _speak();
                                    });
                                  },
                                  child: Container(
                                    // width: MediaQuery.of(context).size.width *
                                    //     0.12,
                                    // height: MediaQuery.of(context).size.height *
                                    //     0.12,
                                    height: 48.70,
                                    width: 48.70,
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0.0),
                                      color: Colors.white,
                                    ),
                                    child: Text(" "),
                                  ),
                                ),
                              ),
                              Container(
                                child: GestureDetector(
                                  onLongPress: () {
                                    print("1.1");
                                    setState(() {
                                      count++;
                                    });
                                  },
                                  onLongPressEnd: (int) {
                                    setState(() {
                                      c++;
                                      _speak();
                                    });
                                  },
                                  child: Container(
                                    height: 48.70,
                                    width: 48.70,
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0.0),
                                      color: Colors.white,
                                    ),
                                    child: Text(""),
                                  ),
                                ),
                              ),
                              Container(
                                child: GestureDetector(
                                  onLongPress: () {
                                    print("1.2");
                                    setState(() {
                                      count++;
                                    });
                                  },
                                  onLongPressEnd: (int) {
                                    setState(() {
                                      c++;
                                      _speak();
                                    });
                                  },
                                  child: Container(
                                    height: 48.70,
                                    width: 48.70,
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0.0),
                                      color: Colors.white,
                                    ),
                                    child: Text(" "),
                                  ),
                                ),
                              ),
                              Container(
                                child: GestureDetector(
                                  onLongPress: () {
                                    print("1.3");
                                    setState(() {
                                      count++;
                                    });
                                  },
                                  onLongPressEnd: (int) {
                                    setState(() {
                                      c++;
                                      _speak();
                                    });
                                  },
                                  child: Container(
                                    height: 48.70,
                                    width: 48.70,
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0.0),
                                      color: Colors.white,
                                    ),
                                    child: Text(" "),
                                  ),
                                ),
                              ),
                              Container(
                                child: GestureDetector(
                                  onLongPress: () {
                                    print("1.4");
                                    setState(() {
                                      count++;
                                    });
                                  },
                                  onLongPressEnd: (int) {
                                    setState(() {
                                      c++;
                                      _speak();
                                    });
                                  },
                                  child: Container(
                                    height: 48.70,
                                    width: 48.70,
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0.0),
                                      color: Colors.white,
                                    ),
                                    child: Text(" "),
                                  ),
                                ),
                              ),
                              Container(
                                child: GestureDetector(
                                  onLongPress: () {
                                    print("1.5");
                                    setState(() {
                                      count++;
                                    });
                                  },
                                  onLongPressEnd: (int) {
                                    setState(() {
                                      c++;
                                      _speak();
                                    });
                                  },
                                  child: Container(
                                    height: 48.70,
                                    width: 48.70,
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0.0),
                                      color: Colors.white,
                                    ),
                                    child: Text(" "),
                                  ),
                                ),
                              ),
                              Container(
                                child: GestureDetector(
                                  onLongPress: () {
                                    print("1.6");
                                    setState(() {
                                      count++;
                                    });
                                  },
                                  onLongPressEnd: (int) {
                                    setState(() {
                                      c++;
                                      _speak();
                                    });
                                  },
                                  child: Container(
                                    height: 48.70,
                                    width: 48.70,
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0.0),
                                      color: Colors.white,
                                    ),
                                    child: Text(" "),
                                  ),
                                ),
                              ),
                              Container(
                                child: GestureDetector(
                                  onLongPress: () {
                                    print("1.7");
                                    setState(() {
                                      count++;
                                    });
                                  },
                                  onLongPressEnd: (int) {
                                    setState(() {
                                      c++;
                                      _speak();
                                    });
                                  },
                                  child: Container(
                                    height: 48.70,
                                    width: 48.70,
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0.0),
                                      color: Colors.white,
                                    ),
                                    child: Text(" "),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                child: GestureDetector(
                                  onLongPress: () {
                                    print("2.0");
                                    setState(() {
                                      count++;
                                    });
                                  },
                                  onLongPressEnd: (int) {
                                    setState(() {
                                      c++;
                                      _speak();
                                    });
                                  },
                                  child: Container(
                                    height: 48.70,
                                    width: 48.70,
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0.0),
                                      color: Colors.white,
                                    ),
                                    child: Text(" "),
                                  ),
                                ),
                              ),
                              Container(
                                child: GestureDetector(
                                  onLongPress: () {
                                    print("2.1");
                                    setState(() {
                                      count++;
                                    });
                                  },
                                  onLongPressEnd: (int) {
                                    setState(() {
                                      c++;
                                      _speak();
                                    });
                                  },
                                  child: Container(
                                    height: 48.70,
                                    width: 48.70,
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0.0),
                                      color: Colors.white,
                                    ),
                                    child: Text(" "),
                                  ),
                                ),
                              ),
                              Container(
                                child: GestureDetector(
                                  onLongPress: () {
                                    print("2.2");
                                    setState(() {
                                      count++;
                                    });
                                  },
                                  onLongPressEnd: (int) {
                                    setState(() {
                                      c++;
                                      _speak();
                                    });
                                  },
                                  child: Container(
                                    height: 48.70,
                                    width: 48.70,
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0.0),
                                      color: Colors.white,
                                    ),
                                    child: Text(" "),
                                  ),
                                ),
                              ),
                              Container(
                                child: GestureDetector(
                                  onLongPress: () {
                                    print("2.3");
                                    setState(() {
                                      count++;
                                    });
                                  },
                                  onLongPressEnd: (int) {
                                    setState(() {
                                      c++;
                                      _speak();
                                    });
                                  },
                                  child: Container(
                                    height: 48.70,
                                    width: 48.70,
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0.0),
                                      color: Colors.white,
                                    ),
                                    child: Text(" "),
                                  ),
                                ),
                              ),
                              Container(
                                child: GestureDetector(
                                  onLongPress: () {
                                    print("2.4");
                                    setState(() {
                                      count++;
                                    });
                                  },
                                  onLongPressEnd: (int) {
                                    setState(() {
                                      c++;
                                      _speak();
                                    });
                                  },
                                  child: Container(
                                    height: 48.70,
                                    width: 48.70,
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0.0),
                                      color: Colors.white,
                                    ),
                                    child: Text(" "),
                                  ),
                                ),
                              ),
                              Container(
                                child: GestureDetector(
                                  onLongPress: () {
                                    print("2.5");
                                    setState(() {
                                      count++;
                                    });
                                  },
                                  onLongPressEnd: (int) {
                                    setState(() {
                                      c++;
                                      _speak();
                                    });
                                  },
                                  child: Container(
                                    height: 48.70,
                                    width: 48.70,
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0.0),
                                      color: Colors.white,
                                    ),
                                    child: Text(" "),
                                  ),
                                ),
                              ),
                              Container(
                                child: GestureDetector(
                                  onLongPress: () {
                                    print("2.6");
                                    setState(() {
                                      count++;
                                    });
                                  },
                                  onLongPressEnd: (int) {
                                    setState(() {
                                      c++;
                                      _speak();
                                    });
                                  },
                                  child: Container(
                                    height: 48.70,
                                    width: 48.70,
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0.0),
                                      color: Colors.white,
                                    ),
                                    child: Text(" "),
                                  ),
                                ),
                              ),
                              Container(
                                child: GestureDetector(
                                  onLongPress: () {
                                    print("2.7");
                                    setState(() {
                                      count++;
                                    });
                                  },
                                  onLongPressEnd: (int) {
                                    setState(() {
                                      c++;
                                      _speak();
                                    });
                                  },
                                  child: Container(
                                    height: 48.70,
                                    width: 48.70,
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0.0),
                                      color: Colors.white,
                                    ),
                                    child: Text(" "),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                child: GestureDetector(
                                  onLongPress: () {
                                    print("3.0");
                                    setState(() {
                                      count++;
                                    });
                                  },
                                  onLongPressEnd: (int) {
                                    setState(() {
                                      c++;
                                      _speak();
                                    });
                                  },
                                  child: Container(
                                    height: 48.70,
                                    width: 48.70,
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0.0),
                                      color: Colors.white,
                                    ),
                                    child: Text(" "),
                                  ),
                                ),
                              ),
                              Container(
                                child: GestureDetector(
                                  onLongPress: () {
                                    print("3.1");
                                    setState(() {
                                      count++;
                                    });
                                  },
                                  onLongPressEnd: (int) {
                                    setState(() {
                                      c++;
                                      _speak();
                                    });
                                  },
                                  child: Container(
                                    height: 48.70,
                                    width: 48.70,
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0.0),
                                      color: Colors.white,
                                    ),
                                    child: Text(" "),
                                  ),
                                ),
                              ),
                              Container(
                                child: GestureDetector(
                                  onLongPress: () {
                                    print("3.2");
                                    setState(() {
                                      count++;
                                    });
                                  },
                                  onLongPressEnd: (int) {
                                    setState(() {
                                      c++;
                                      _speak();
                                    });
                                  },
                                  child: Container(
                                    height: 48.70,
                                    width: 48.70,
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0.0),
                                      color: Colors.white,
                                    ),
                                    child: Text(" "),
                                  ),
                                ),
                              ),
                              Container(
                                child: GestureDetector(
                                  onLongPress: () {
                                    print("3.3");
                                    setState(() {
                                      count++;
                                    });
                                  },
                                  onLongPressEnd: (int) {
                                    setState(() {
                                      c++;
                                      _speak();
                                    });
                                  },
                                  child: Container(
                                    height: 48.70,
                                    width: 48.70,
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0.0),
                                      color: Colors.white,
                                    ),
                                    child: Text(" "),
                                  ),
                                ),
                              ),
                              Container(
                                child: GestureDetector(
                                  onLongPress: () {
                                    print("3.4");
                                    setState(() {
                                      count++;
                                    });
                                  },
                                  onLongPressEnd: (int) {
                                    setState(() {
                                      c++;
                                      _speak();
                                    });
                                  },
                                  child: Container(
                                    height: 48.70,
                                    width: 48.70,
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0.0),
                                      color: Colors.white,
                                    ),
                                    child: Text(" "),
                                  ),
                                ),
                              ),
                              Container(
                                child: GestureDetector(
                                  onLongPress: () {
                                    print("3.5");
                                    setState(() {
                                      count++;
                                    });
                                  },
                                  onLongPressEnd: (int) {
                                    setState(() {
                                      c++;
                                      _speak();
                                    });
                                  },
                                  child: Container(
                                    height: 48.70,
                                    width: 48.70,
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0.0),
                                      color: Colors.white,
                                    ),
                                    child: Text(" "),
                                  ),
                                ),
                              ),
                              Container(
                                child: GestureDetector(
                                  onLongPress: () {
                                    print("3.6");
                                    setState(() {
                                      count++;
                                    });
                                  },
                                  onLongPressEnd: (int) {
                                    setState(() {
                                      c++;
                                      _speak();
                                    });
                                  },
                                  child: Container(
                                    height: 48.70,
                                    width: 48.70,
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0.0),
                                      color: Colors.white,
                                    ),
                                    child: Text(" "),
                                  ),
                                ),
                              ),
                              Container(
                                child: GestureDetector(
                                  onLongPress: () {
                                    print("3.7");
                                    setState(() {
                                      count++;
                                    });
                                  },
                                  onLongPressEnd: (int) {
                                    setState(() {
                                      c++;
                                      _speak();
                                    });
                                  },
                                  child: Container(
                                    height: 48.70,
                                    width: 48.70,
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0.0),
                                      color: Colors.white,
                                    ),
                                    child: Text(" "),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                child: GestureDetector(
                                  onLongPress: () {
                                    print("4.0");
                                    setState(() {
                                      count++;
                                    });
                                  },
                                  onLongPressEnd: (int) {
                                    setState(() {
                                      c++;
                                      _speak();
                                    });
                                  },
                                  child: Container(
                                    height: 48.70,
                                    width: 48.70,
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0.0),
                                      color: Colors.white,
                                    ),
                                    child: Text(" "),
                                  ),
                                ),
                              ),
                              Container(
                                child: GestureDetector(
                                  onLongPress: () {
                                    print("4.1");
                                    setState(() {
                                      count++;
                                    });
                                  },
                                  onLongPressEnd: (int) {
                                    setState(() {
                                      c++;
                                      _speak();
                                    });
                                  },
                                  child: Container(
                                    height: 48.70,
                                    width: 48.70,
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0.0),
                                      color: Colors.white,
                                    ),
                                    child: Text(" "),
                                  ),
                                ),
                              ),
                              Container(
                                child: GestureDetector(
                                  onLongPress: () {
                                    print("4.2");
                                    setState(() {
                                      count++;
                                    });
                                  },
                                  onLongPressEnd: (int) {
                                    setState(() {
                                      c++;
                                      _speak();
                                      _speak();
                                    });
                                  },
                                  child: Container(
                                    height: 48.70,
                                    width: 48.70,
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0.0),
                                      color: Colors.white,
                                    ),
                                    child: Text(" "),
                                  ),
                                ),
                              ),
                              Container(
                                child: GestureDetector(
                                  onLongPress: () {
                                    print("4.3");
                                    setState(() {
                                      count++;
                                    });
                                  },
                                  onLongPressEnd: (int) {
                                    setState(() {
                                      c++;
                                      _speak();
                                    });
                                  },
                                  child: Container(
                                    height: 48.70,
                                    width: 48.70,
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0.0),
                                      color: Colors.white,
                                    ),
                                    child: Text(" "),
                                  ),
                                ),
                              ),
                              Container(
                                child: GestureDetector(
                                  onLongPress: () {
                                    print("4.4");
                                    setState(() {
                                      count++;
                                    });
                                  },
                                  onLongPressEnd: (int) {
                                    setState(() {
                                      c++;
                                      _speak();
                                    });
                                  },
                                  child: Container(
                                    height: 48.70,
                                    width: 48.70,
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0.0),
                                      color: Colors.white,
                                    ),
                                    child: Text(" "),
                                  ),
                                ),
                              ),
                              Container(
                                child: GestureDetector(
                                  onLongPress: () {
                                    print("4.5");
                                    setState(() {
                                      count++;
                                    });
                                  },
                                  onLongPressEnd: (int) {
                                    setState(() {
                                      c++;
                                      _speak();
                                    });
                                  },
                                  child: Container(
                                    height: 48.70,
                                    width: 48.70,
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0.0),
                                      color: Colors.white,
                                    ),
                                    child: Text(" "),
                                  ),
                                ),
                              ),
                              Container(
                                child: GestureDetector(
                                  onLongPress: () {
                                    print("4.6");
                                    setState(() {
                                      count++;
                                    });
                                  },
                                  onLongPressEnd: (int) {
                                    setState(() {
                                      c++;
                                      _speak();
                                    });
                                  },
                                  child: Container(
                                    height: 48.70,
                                    width: 48.70,
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0.0),
                                      color: Colors.white,
                                    ),
                                    child: Text(" "),
                                  ),
                                ),
                              ),
                              Container(
                                child: GestureDetector(
                                  onLongPress: () {
                                    print("4.7");
                                    setState(() {
                                      count++;
                                    });
                                  },
                                  onLongPressEnd: (int) {
                                    setState(() {
                                      c++;
                                      _speak();
                                    });
                                  },
                                  child: Container(
                                    height: 48.70,
                                    width: 48.70,
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0.0),
                                      color: Colors.white,
                                    ),
                                    child: Text(" "),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                child: GestureDetector(
                                  onLongPress: () {
                                    print("4.0");
                                    setState(() {
                                      count++;
                                    });
                                  },
                                  onLongPressEnd: (int) {
                                    setState(() {
                                      c++;
                                      _speak();
                                    });
                                  },
                                  child: Container(
                                    height: 48.70,
                                    width: 48.70,
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0.0),
                                      color: Colors.white,
                                    ),
                                    child: Text(" "),
                                  ),
                                ),
                              ),
                              Container(
                                child: GestureDetector(
                                  onLongPress: () {
                                    print("4.1");
                                    setState(() {
                                      count++;
                                    });
                                  },
                                  onLongPressEnd: (int) {
                                    setState(() {
                                      c++;
                                      _speak();
                                    });
                                  },
                                  child: Container(
                                    height: 48.70,
                                    width: 48.70,
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0.0),
                                      color: Colors.white,
                                    ),
                                    child: Text(" "),
                                  ),
                                ),
                              ),
                              Container(
                                child: GestureDetector(
                                  onLongPress: () {
                                    print("4.2");
                                    setState(() {
                                      count++;
                                    });
                                  },
                                  onLongPressEnd: (int) {
                                    setState(() {
                                      c++;
                                      _speak();
                                      _speak();
                                    });
                                  },
                                  child: Container(
                                    height: 48.70,
                                    width: 48.70,
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0.0),
                                      color: Colors.white,
                                    ),
                                    child: Text(" "),
                                  ),
                                ),
                              ),
                              Container(
                                child: GestureDetector(
                                  onLongPress: () {
                                    print("4.3");
                                    setState(() {
                                      count++;
                                    });
                                  },
                                  onLongPressEnd: (int) {
                                    setState(() {
                                      c++;
                                      _speak();
                                    });
                                  },
                                  child: Container(
                                    height: 48.70,
                                    width: 48.70,
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0.0),
                                      color: Colors.white,
                                    ),
                                    child: Text(" "),
                                  ),
                                ),
                              ),
                              Container(
                                child: GestureDetector(
                                  onLongPress: () {
                                    print("4.4");
                                    setState(() {
                                      count++;
                                    });
                                  },
                                  onLongPressEnd: (int) {
                                    setState(() {
                                      c++;
                                      _speak();
                                    });
                                  },
                                  child: Container(
                                    height: 48.70,
                                    width: 48.70,
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0.0),
                                      color: Colors.white,
                                    ),
                                    child: Text(" "),
                                  ),
                                ),
                              ),
                              Container(
                                child: GestureDetector(
                                  onLongPress: () {
                                    print("4.5");
                                    setState(() {
                                      count++;
                                    });
                                  },
                                  onLongPressEnd: (int) {
                                    setState(() {
                                      c++;
                                      _speak();
                                    });
                                  },
                                  child: Container(
                                    height: 48.70,
                                    width: 48.70,
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0.0),
                                      color: Colors.white,
                                    ),
                                    child: Text(" "),
                                  ),
                                ),
                              ),
                              Container(
                                child: GestureDetector(
                                  onLongPress: () {
                                    print("4.6");
                                    setState(() {
                                      count++;
                                    });
                                  },
                                  onLongPressEnd: (int) {
                                    setState(() {
                                      c++;
                                      _speak();
                                    });
                                  },
                                  child: Container(
                                    height: 48.70,
                                    width: 48.70,
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0.0),
                                      color: Colors.white,
                                    ),
                                    child: Text(" "),
                                  ),
                                ),
                              ),
                              Container(
                                child: GestureDetector(
                                  onLongPress: () {
                                    print("4.7");
                                    setState(() {
                                      count++;
                                    });
                                  },
                                  onLongPressEnd: (int) {
                                    setState(() {
                                      c++;
                                      _speak();
                                    });
                                  },
                                  child: Container(
                                    height: 48.70,
                                    width: 48.70,
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0.0),
                                      color: Colors.white,
                                    ),
                                    child: Text(" "),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                child: GestureDetector(
                                  onLongPress: () {
                                    print("4.0");
                                    setState(() {
                                      count++;
                                    });
                                  },
                                  onLongPressEnd: (int) {
                                    setState(() {
                                      c++;
                                      _speak();
                                    });
                                  },
                                  child: Container(
                                    height: 48.70,
                                    width: 48.70,
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0.0),
                                      color: Colors.white,
                                    ),
                                    child: Text(" "),
                                  ),
                                ),
                              ),
                              Container(
                                child: GestureDetector(
                                  onLongPress: () {
                                    print("4.1");
                                    setState(() {
                                      count++;
                                    });
                                  },
                                  onLongPressEnd: (int) {
                                    setState(() {
                                      c++;
                                      _speak();
                                    });
                                  },
                                  child: Container(
                                    height: 48.70,
                                    width: 48.70,
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0.0),
                                      color: Colors.white,
                                    ),
                                    child: Text(" "),
                                  ),
                                ),
                              ),
                              Container(
                                child: GestureDetector(
                                  onLongPress: () {
                                    print("4.2");
                                    setState(() {
                                      count++;
                                    });
                                  },
                                  onLongPressEnd: (int) {
                                    setState(() {
                                      c++;
                                      _speak();
                                      _speak();
                                    });
                                  },
                                  child: Container(
                                    height: 48.70,
                                    width: 48.70,
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0.0),
                                      color: Colors.white,
                                    ),
                                    child: Text(" "),
                                  ),
                                ),
                              ),
                              Container(
                                child: GestureDetector(
                                  onLongPress: () {
                                    print("4.3");
                                    setState(() {
                                      count++;
                                    });
                                  },
                                  onLongPressEnd: (int) {
                                    setState(() {
                                      c++;
                                      _speak();
                                    });
                                  },
                                  child: Container(
                                    height: 48.70,
                                    width: 48.70,
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0.0),
                                      color: Colors.white,
                                    ),
                                    child: Text(" "),
                                  ),
                                ),
                              ),
                              Container(
                                child: GestureDetector(
                                  onLongPress: () {
                                    print("4.4");
                                    setState(() {
                                      count++;
                                    });
                                  },
                                  onLongPressEnd: (int) {
                                    setState(() {
                                      c++;
                                      _speak();
                                    });
                                  },
                                  child: Container(
                                    height: 48.70,
                                    width: 48.70,
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0.0),
                                      color: Colors.white,
                                    ),
                                    child: Text(" "),
                                  ),
                                ),
                              ),
                              Container(
                                child: GestureDetector(
                                  onLongPress: () {
                                    print("4.5");
                                    setState(() {
                                      count++;
                                    });
                                  },
                                  onLongPressEnd: (int) {
                                    setState(() {
                                      c++;
                                      _speak();
                                    });
                                  },
                                  child: Container(
                                    height: 48.70,
                                    width: 48.70,
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0.0),
                                      color: Colors.white,
                                    ),
                                    child: Text(" "),
                                  ),
                                ),
                              ),
                              Container(
                                child: GestureDetector(
                                  onLongPress: () {
                                    print("4.6");
                                    setState(() {
                                      count++;
                                    });
                                  },
                                  onLongPressEnd: (int) {
                                    setState(() {
                                      c++;
                                      _speak();
                                    });
                                  },
                                  child: Container(
                                    height: 48.70,
                                    width: 48.70,
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0.0),
                                      color: Colors.white,
                                    ),
                                    child: Text(" "),
                                  ),
                                ),
                              ),
                              Container(
                                child: GestureDetector(
                                  onLongPress: () {
                                    print("4.7");
                                    setState(() {
                                      count++;
                                    });
                                  },
                                  onLongPressEnd: (int) {
                                    setState(() {
                                      c++;
                                      _speak();
                                    });
                                  },
                                  child: Container(
                                    height: 48.70,
                                    width: 48.70,
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0.0),
                                      color: Colors.white,
                                    ),
                                    child: Text(" "),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 70),
                    child: Center(
                      child: Text(
                        q,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 130.0),
                    child: Text(
                      "Welcome,  " + widget.name,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ])
              ],
            ),
          ),
        ));
  }
}
