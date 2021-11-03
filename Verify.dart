import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Verify extends StatefulWidget {
  @override
  _VerifyState createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  FirebaseUser firebaseUser;

  getData() async {
    firebaseUser = await FirebaseAuth.instance.currentUser();

  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: firebaseUser != null ?
      Center(
        child: Container(
        alignment: Alignment.center,
        child:
        Text(firebaseUser != null && firebaseUser.isEmailVerified
            ? "Email Verified"
        : "Email not Verified"
        ),
      )
      ):Text("not loaded"),

       );
  }
}
