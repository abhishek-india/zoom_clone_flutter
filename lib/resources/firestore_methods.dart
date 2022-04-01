import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class FireStoreMethods{

  final FirebaseFirestore _fireStore=FirebaseFirestore.instance;
  final FirebaseAuth _auth=FirebaseAuth.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> get meetingHistory => _fireStore.collection('users').doc(_auth.currentUser!.uid).collection('meetings').snapshots();

  void addToMeetingHistory(String meetingName) async{
    try{
      await _fireStore.collection('users').doc(_auth.currentUser!.uid).collection('meetings').add({
        'meetingName':meetingName,
        'createdAt':DateTime.now(),
      });
    }catch(e){
      print(e);
    }
  }

}