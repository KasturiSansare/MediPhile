import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

//import 'package:shared_preferences/shared_preferences.dart';

class MedicalHistoryApp
{

  static const String appName = 'Medical History';

  //static SharedPreferences sharedPreferences;
  static FirebaseUser user;
  static FirebaseAuth auth;
  static Firestore firestore;

  static String collectionUser = "users";

  static String subCollectionAddress = 'userAddress';

  String userName = 'name';
  String userEmail = 'email';
  //String userPhotoUrl = 'photoUrl';
  String userUID = 'uid';
  String userAvatarUrl = 'url';

  MedicalHistoryApp({
    this.userName,
    this.userUID,
    this.userEmail,
    this.userAvatarUrl,
    //this.userPhotoUrl,



});


}