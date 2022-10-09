import 'package:flutter/material.dart';

class MedicinalRecord extends StatefulWidget {
  final c1, c2, c3, n1, n2, n3, mo1, mo2, mo3, md1, md2, md3, ng1, ng2, ng3;
  MedicinalRecord({
    Key key,
    this.n1,
    this.mo1,
    this.md1,
    this.ng1,
    this.c1,
    this.n2,
    this.mo2,
    this.md2,
    this.ng2,
    this.c2,
    this.n3,
    this.mo3,
    this.md3,
    this.ng3,
    this.c3,
  }) : super(key: key);
  @override
  _MedicinalRecordState createState() => _MedicinalRecordState();
}

class _MedicinalRecordState extends State<MedicinalRecord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Center(
            child: Text(
              "History",
              style: TextStyle(fontSize: 30, color: Colors.deepPurple,fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            child: Card(
                elevation: 5.0,
                child: Container(
                  height: 120,
                  width: 330,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 2.0,),
                        Row(
                          children: <Widget>[
                            Text(
                              "Name : ",
                              style: TextStyle(fontSize: 23, color: Colors.indigoAccent,fontWeight: FontWeight.bold),
                            ),
                            Text(widget.n1, style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold)),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: <Widget>[
                           Text(
                              "Count :",
                              style: TextStyle(fontSize: 23, color: Colors.indigoAccent,fontWeight: FontWeight.bold),
                            ),
                            Text(widget.c1.toString(), style: TextStyle(fontSize:23,fontWeight: FontWeight.bold)),
                        ],),
                        SizedBox(height: 10,),
                        Row(
                        children: <Widget>[
                        Container(
                          child: Text(
                                "Morning :",
                                style: TextStyle(
                                    fontSize: 19, color: Colors.orange,fontWeight: FontWeight.bold),
                              ),
                        ),
                            Text(widget.mo1.toString(), style: TextStyle(fontSize:19,fontWeight: FontWeight.bold)),
                        Text(
                              "     MidDay :",
                              style: TextStyle(
                                  fontSize: 19, color: Colors.red,fontWeight: FontWeight.bold),
                            ),
                            Text(widget.md1.toString(), style: TextStyle(fontSize:19,fontWeight: FontWeight.bold)),
                        Text(
                              "     Night :",
                              style: TextStyle(
                                  fontSize: 19, color: Colors.green,fontWeight: FontWeight.bold),
                            ),
                        Text(widget.ng1.toString(), style: TextStyle(fontSize:19,fontWeight: FontWeight.bold)),      
                        ],)
                      ],
                    ),
                  ),
                )),
          ),
          Center(
            child: Card(
                elevation: 5.0,
                child: Container(
                  height: 120,
                  width: 330,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 2.0,),
                        Row(
                          children: <Widget>[
                            Text(
                              "Name : ",
                              style: TextStyle(
                                  fontSize: 23, color: Colors.indigoAccent,fontWeight: FontWeight.bold),
                            ),
                            Text(widget.n2, style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold)),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: <Widget>[
                           Text(
                              "Count :",
                              style: TextStyle(
                                  fontSize: 23, color: Colors.indigoAccent,fontWeight: FontWeight.bold),
                            ),
                            Text(widget.c2.toString(), style: TextStyle(fontSize:23,fontWeight: FontWeight.bold)),
                        ],),
                        SizedBox(height: 10,),
                        Row(
                        children: <Widget>[
                        Container(
                          child: Text(
                                "Morning :",
                                style: TextStyle(
                                    fontSize: 19, color: Colors.orange,fontWeight: FontWeight.bold),
                              ),
                        ),
                            Text(widget.mo2.toString(), style: TextStyle(fontSize:19,fontWeight: FontWeight.bold)),
                        Text(
                              "     MidDay :",
                              style: TextStyle(
                                  fontSize: 19, color: Colors.red,fontWeight: FontWeight.bold),
                            ),
                            Text(widget.md2.toString(), style: TextStyle(fontSize:19,fontWeight: FontWeight.bold)),
                        Text(
                              "     Night :",
                              style: TextStyle(
                                  fontSize: 19, color: Colors.green,fontWeight: FontWeight.bold),
                            ),
                        Text(widget.ng2.toString(), style: TextStyle(fontSize:19,fontWeight: FontWeight.bold)),      
                        ],)
                      ],
                    ),
                  ),
                )),
          ),
          Center(
            child: Card(
                elevation: 5.0,
                child: Container(
                  height: 120,
                  width: 330,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 2.0,),
                        Row(
                          children: <Widget>[
                            Text(
                              "Name : ",
                              style: TextStyle(
                                  fontSize: 23, color: Colors.indigoAccent,fontWeight: FontWeight.bold),
                            ),
                            Text(widget.n3, style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold)),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: <Widget>[
                           Text(
                              "Count :",
                              style: TextStyle(
                                  fontSize: 23, color: Colors.indigoAccent,fontWeight: FontWeight.bold),
                            ),
                            Text(widget.c3.toString(), style: TextStyle(fontSize:23,fontWeight: FontWeight.bold)),
                        ],),
                        SizedBox(height: 10,),
                        Row(
                        children: <Widget>[
                        Container(
                          child: Text(
                                "Morning :",
                                style: TextStyle(
                                    fontSize: 19, color: Colors.orange,fontWeight: FontWeight.bold),
                              ),
                        ),
                            Text(widget.mo3.toString(), style: TextStyle(fontSize:19,fontWeight: FontWeight.bold)),
                        Text(
                              "     MidDay :",
                              style: TextStyle(
                                  fontSize: 19, color: Colors.red,fontWeight: FontWeight.bold),
                            ),
                            Text(widget.md3.toString(), style: TextStyle(fontSize:19,fontWeight: FontWeight.bold)),
                        Text(
                              "     Night :",
                              style: TextStyle(
                                  fontSize: 19, color: Colors.green,fontWeight: FontWeight.bold),
                            ),
                        Text(widget.ng3.toString(), style: TextStyle(fontSize:19,fontWeight: FontWeight.bold)),      
                        ],)
                      ],
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
