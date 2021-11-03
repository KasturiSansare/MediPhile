import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'file:///C:/Users/kirti/AndroidStudioProjects/medapp/lib/settings/settings_profile_page.dart';

import 'constants.dart';

class displayPersonalInformation extends StatelessWidget{
  static const String idScreen = "displayPersonal";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
          stream: getUsersStreamSnapshots(context),
          builder: (context, snapshot) {
            if(!snapshot.hasData) return const Text("Loading...");
            return new ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (BuildContext context, int index) =>
                    buildCard(context, snapshot.data.documents[index]));
          }
      ),
    );
  }

  Stream<QuerySnapshot> getUsersStreamSnapshots(BuildContext context) async* {
    final uid = await FirebaseAuth.instance.currentUser();
    yield* Firestore.instance.collection('Users').document(uid.uid).collection('PersonalInformation').snapshots();
  }

  String image;

  Widget buildCard(BuildContext context, DocumentSnapshot data) {
    image = data['AvatarUrl'];

    Size size = MediaQuery
        .of(context)
        .size;
    String returnAvatarUrl(){

    }

  }




}

