import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final CollectionReference  pharma = Firestore.instance.collection('pharmassist');
  /*Future updateUserData(int noOfTabCount) async {
    return await pharma.document(uid).setData({
      
    });
  }*/
  

}