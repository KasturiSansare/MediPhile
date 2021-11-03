library globals;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

List<String> MyRecords = List<String>();
List<String> Media  = List<String>();
List<String> UrlList  = List<String>();
List<String> recipents=[];

String profile_image;

Future<void> retrieveMyList(String name) async {
  FirebaseUser userData = await FirebaseAuth.instance.currentUser();

  DatabaseReference databaseReference = FirebaseDatabase.instance.reference();
}

/*createMyRecords(){
  DocumentReference documentReference = Firestore.instance.collection('Users').document('path');
}*/
