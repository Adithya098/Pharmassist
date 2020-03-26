import 'dart:async';

import 'package:pharmassist/Animation/FadeAnimation.dart';

import 'package:flutter/material.dart';

import 'package:flutter_tts/flutter_tts.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

//import 'package:speech_to_text/speech_to_text.dart' as stt;

//import 'package:speech_recognition/speech_recognition.dart';









class Second extends StatefulWidget {
  final med, tabcount;
  final f;
  final mob;
  Second(this.med, this.tabcount, this.f ,this.mob);

  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {
  int finall,i=0;
//String f;
  final String a = "have you taken the pills?";

  final FlutterTts flutterTts = FlutterTts();

  Future function(String f, int finall) async {
    await Firestore.instance
        .collection('user')
        .document(widget.mob).collection("medicine").document(f)
        .updateData({'Count': finall});
  }

  // SpeechRecognition _speechRecognition;
  // bool _isAvailable = false;
  // bool _isListening = false;
  // String resultText = "";
  // @override
  // void initState() {
  //   super.initState();
  //   initSpeechRecognizer();
  // }

  // void initSpeechRecognizer() {
  //   _speechRecognition = SpeechRecognition();

  //   _speechRecognition.setAvailabilityHandler(
  //       (bool result) => setState(() => _isAvailable = result));

  //   _speechRecognition.setRecognitionStartedHandler(
  //     () => setState(() => _isListening = true),
  //   );

  //   _speechRecognition.setRecognitionResultHandler(
  //     (String speech) => setState(() => resultText = speech),
  //   );

  //   _speechRecognition.setRecognitionCompleteHandler(
  //       () => setState(() => _isListening = false),
  //       );

  //   _speechRecognition.activate().then((result)=> setState(()=>_isAvailable=result));
  // }

  @override
  Widget build(BuildContext context) {
    Future _speak() async {
      await flutterTts.speak(a);
      // Future.delayed(const Duration(milliseconds: 2000), () {
      //   print("HI");
      //   if(_isAvailable && !_isListening)
      //   print("SPEECH");
      //   _speechRecognition.listen(locale:"en_US").then((result)=> print('$result'));
      //   print('HELLO');
      // });
      // Future.delayed(const Duration(milliseconds: 4000), () {
      //   if(_isListening)
      //   print("stop");
      //   _speechRecognition.stop().then((result)=>setState(()=>_isListening=result));
      // });
    }

// Timer(Duration(seconds: 5),(){
//       print("1");
      
//     });

    Timer(Duration(seconds: 2), () {
      _speak();
      
      //print(widget.med);
    });

    
// if(i==0){
//       //Future.delayed(const Duration(milliseconds: 2000), () {
//         print("HI");
//         if(_isAvailable && !_isListening)
//         print("SPEECH");
//         _speechRecognition.listen(locale:"en_US").then((result)=> print('$result'));
//         print('HELLO');
//       //});
//       // Future.delayed(const Duration(milliseconds: 10000), () {
//         if(_isListening)
//         print("stop");
//         _speechRecognition.stop().then((result)=>setState(()=>_isListening=result));
//       // });
//       }
//       i=1;

    return Scaffold(
        //appBar: AppBar(centerTitle: true,title: Text("Count check"),),
        body: Container(
            child: SingleChildScrollView(
                child: Column(children: <Widget>[
      SizedBox(
        height: 20,
      ),
      Container(
        height: 350,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/3.png'), fit: BoxFit.fill)),
        child: Stack(
          children: <Widget>[],
        ),
      ),
      SizedBox(
        height: 90,
      ),
      Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //Future.delayed(const Duration(milliseconds: 5000),(){};
          Text(
            "Have you taken the pills ?",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FadeAnimation(
                  2,
                  Container(
                      height: 45,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          gradient: LinearGradient(colors: [
                            Colors.green[500],
                            Colors.green[500],
                          ])),
                      child: RaisedButton(
                        child: Center(
                          child: Text(
                            "Yes",
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
                        color: Colors.green[500],
                        onPressed: () {
                          //print(widget.tabcount);
                          //print(widget.med);
                          if(widget.tabcount>0){
                          finall = widget.tabcount - widget.med;
                          function(widget.f, finall);}
                          //print(widget.tabcount);
                          Navigator.pop(context);

                        },
                      ))),
              // RaisedButton(
              //   child: Text("YES"),
              //   onPressed: () {
              //     print(widget.f);
              //     print(widget.med);
              //     finall = widget.tabcount - widget.med;
              //     function(widget.f, finall);
              //     Navigator.pop(context);
              //   },
              // ),
              FadeAnimation(
                  2,
                  Container(
                      height: 45,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          gradient: LinearGradient(colors: [
                            Colors.red[600],
                            Colors.red[600],
                          ])),
                      child: RaisedButton(
                        child: Center(
                          child: Text(
                            "No",
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
                        color: Colors.red[600],
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ))),
              // RaisedButton(
              //   child: Text("NO"),
              //   onPressed: () {
              //     Navigator.pop(context);
              //   },
              // )
            ],
          )
        ],
      )),
    ]))));
  }
}
