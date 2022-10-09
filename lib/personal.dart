import 'package:flutter/material.dart';

class Personal extends StatefulWidget {
  final n,city,mobi,address;
  Personal({Key key, this.n,this.city,this.mobi,this.address}) : super(key: key);
  @override
  _PersonalState createState() => _PersonalState();
}

class _PersonalState extends State<Personal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
        Center(child: Text("Personal Details",style: TextStyle(fontSize: 30,color:Colors.deepPurple,fontWeight: FontWeight.bold),),),
        Center(
        child: Card(
        elevation: 5.0,
        child: Container(
          height: 120,
          width: 330,
          child: Padding(
            padding: const EdgeInsets.only(left:20.0),
            child: Row(children: <Widget>[
              Text("Name : ",style: TextStyle(fontSize: 25,color: Colors.indigoAccent,fontWeight: FontWeight.bold),),
              Text(widget.n,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
            ],),
          ),
        )
          ),
        ),
        Center(
        child: Card(
        elevation: 5.0,
        child: Container(
          height: 120,
          width: 330,
          child: Padding(
            padding: const EdgeInsets.only(left:20.0),
            child: Row(children: <Widget>[
              Text("Mobile no : ",style: TextStyle(fontSize: 25,color: Colors.indigoAccent,fontWeight: FontWeight.bold),),
              Text(widget.mobi.toString(),style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
            ],),
          ),
        )
          ),
        ),
        Center(
        child: Card(
        elevation: 5.0,
        child: Container(
          height: 120,
          width: 330,
          child: Padding(
            padding: const EdgeInsets.only(left:20.0),
            child: Row(children: <Widget>[
              Text("City : ",style: TextStyle(fontSize: 25,color: Colors.indigoAccent,fontWeight: FontWeight.bold),),
              Text(widget.city,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
            ],),
          ),
        )
          ),
        ),
        Center(
        child: Card(
        elevation: 5.0,
        child: Container(
          height: 250,
          width: 330,
            child: Column(children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 170.0,top: 20),
                child: Text("Address : ",style: TextStyle(fontSize: 25,color: Colors.indigoAccent,fontWeight: FontWeight.bold),),
              ),
              Padding(
                padding: const EdgeInsets.only(left:20.0,top: 30),
                child: Text(widget.address,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
              ),
            ],),
        ),
          ),
        ),
      ],),
    );
  }
}