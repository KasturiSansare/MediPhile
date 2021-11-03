import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medapp/constants.dart';
import 'package:medapp/home/records_homepage.dart';
import 'package:medapp/image_upload/progress.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

import '../auth_class.dart';


class displayPregnancy extends StatelessWidget {
  static const String idScreen = "display";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        //leading: new Icon(Icons.list),
        title: new Text("Pregnancy"),
        backgroundColor: kPrimaryColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return HomePageRecords();
                },
              ),
            );
          },
        ),
        actions: [
          FlatButton(
              onPressed: () {
                _createPDF();
              },
              child: Icon(
                Icons.share_outlined,
                color: Colors.white,
              ))
        ],
      ),
      body: Container(
        child: StreamBuilder(
            stream: getUsersStreamSnapshots(context),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return circularProgress();
              }
              return new ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (BuildContext context, int index) =>
                      buildCard(context, snapshot.data.documents[index]));
            }
        ),
      ),
    );
  }

  Stream<QuerySnapshot> getUsersStreamSnapshots(BuildContext context) async* {
    final uid = await FirebaseAuth.instance.currentUser();
    yield* Firestore.instance.collection('Users').document(uid.uid).collection(
        'Pregnancy').snapshots();
  }

  String Mname;
  String Fname;
  String Mdob;
  String Fdob;
  String Mblood;
  String Fblood;
  String FailedPregnancy;
  String FPreasons;
  String IVF;
  String PastSurgery;
  String PPweeks;
  String PPotherproblems;
  String ChildName;
  String ChildAge;
  String Childtime;
  String ChildLaborProblem;
  String ChildDelProblem;
  String ChildNICU;
  String OPweeks;
  String OPdue;
  String OPproblems;

  String together;
  String IVFHelp;
  String PP;
  List problems;
  String gender;
  String ontime;
  String delivery;
  String babyproblems;
  String deliveryproblems;
  String NICU;
  String feeding;
  List currentproblems;

  Widget buildCard(BuildContext context, DocumentSnapshot data) {

    Mname =data['Mother Name'];
    Mdob = data['Mother DOB'];
    Mblood=data['Mother BG'];
    Fname = data['Father Name'];
    Fdob = data['Father DOB'];
    Fblood = data['Father BG'];
    together = data['Together'];
    FailedPregnancy = data['Failed Pregnancies'];
    FPreasons = data['Reason'];
    IVF = data['External help'];
    IVFHelp = data['External help reason'];
    PastSurgery = data['Previous Surgeries'];
    PP = data['Care of Doctor'];
    PPweeks = data['How far'];
    problems = data['Pregnancy Problems'];
    PPotherproblems = data['Other Problems'];
    ChildName = data['Child Name'];
    ChildAge = data['Child Age'];
    gender = data['Child Gender'];
    ontime = data['Born time'];
    Childtime = data['Late/Early'];
    delivery = data['Delivery'];
    babyproblems = data['Baby Labour Problem'];
    ChildLaborProblem = data['Baby Labour Problem Reason'];
    deliveryproblems = data['Baby Delivery Problem'];
    ChildDelProblem = data['Baby Delivery Problem Reason'] ;
    NICU = data['NICU'];
    ChildNICU = data['NICU time'];
    feeding = data['Baby feeding problems'] ;
    OPweeks = data['Ongoing how far'] ;
    OPdue = data['Expected Due Date'] ;
    currentproblems = data['Ongoing Pregnancy Problems'] ;
    OPproblems = data['Problems During Pregnancy'];

    return new Container(
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              /*Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 30.0),
                child: Row(children: <Widget>[
                  Text('Pregnancy', textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 30.0, color: kPrimaryColor),),
                  Spacer(),
                ]),
              ),*/
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text("Mother's Information",style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 19.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Name', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.5),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['Mother Name'].toString(), textAlign: TextAlign.right,
                    style: new TextStyle(fontSize: 17.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Date Of Birth', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.5),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['Mother DOB'], textAlign: TextAlign.right,
                    style: new TextStyle(fontSize: 17.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Blood Group', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['Mother BG'].toString(),
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text("Father's Information",style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 19.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Name', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['Father Name'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Date Of Birth', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['Father DOB'].toString(),
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Blood Group', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['Father BG'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Are both the parents together?', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['Together'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Number of failed pregnancies/abortions?', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['Failed Pregnancies'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Reasons', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['Reason'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Have you ever considered or taken help of \nIVF/Test Tube Baby/Surrogacy?', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['External help'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('If Yes, Please Specify', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['External help reason'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Any previous surgeries?', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['Previous Surgeries'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Previous Pregnancies', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 19.0),),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('When the mother was pregnant with the child \nwas she under the care of a doctor?', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['Care of Doctor'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('How far along in the pregnancy was the mother \nwhen she started seeing a doctor?', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['How far'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('During this Pregnancy, did the mother have \nany problems?', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['Pregnancy Problems'].toString(),
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Any other problems during this pregnancy?', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['Other Problems'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Birth History', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 19.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text("Child's Name", style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['Child Name'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Current Age', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['Child Age'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Gender', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['Child Gender'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Was the child born on time?', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['Born time'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('How much Late/Early?', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 17.5),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['Late/Early'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Delivery was?', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 17.5),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['Delivery'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Did the baby have any problems during \nlabour (i.e. drop in heart rate, failure to \nprogress, cord around neck)?', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 17.5),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['Baby Labour Problem'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('If yes, please specify', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 17.5),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['Baby Labour Problem Reason'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Did the baby have any problems after \nthe delivery (i.e. need oxygen, jaundice, \netc)?', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 17.5),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['Baby Delivery Problem'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('If yes, please specify', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 17.5),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['Baby Delivery Problem Reason'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Did the baby go into the NICU?', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['NICU'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('If yes, please specify for how long', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['NICU time'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Did the baby have any feeding problems?', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['Baby feeding problems'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Did the baby go into the NICU?', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['NICU'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Ongoing Pregnancy', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 19.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('How far along in the pregnancy was the \nmother when she started seeing a doctor?', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['Ongoing how far'], style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('What is the expected Due Date?', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['Expected Due Date'], style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('During this Pregnancy, did the mother have \nany problems?', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['Ongoing Pregnancy Problems'].toString(), style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Any other problems during this pregnancy?', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['Problems During Pregnancy'].toString(), style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),

            ],
          ),
        ),
      ),
    );
  }

  Future<void> _createPDF() async {

    PdfDocument document = PdfDocument();
    final page = document.pages.add();

    //change the domain name
    page.graphics.drawString('Pregnancy',
        PdfStandardFont(PdfFontFamily.helvetica, 25, style: PdfFontStyle.bold));

    page.graphics.drawLine(
        PdfPen(PdfColor(0,0,0)),
        Offset(0, 40),
        Offset(page.getClientSize().width, 40));

    page.graphics.drawString("Mother's Information",
        PdfStandardFont(PdfFontFamily.timesRoman, 15, style: PdfFontStyle.bold), bounds: const Rect.fromLTWH(0, 60, 0, 0));

    //with heading start with (15,0,0,0)
    page.graphics.drawString("1. Mother's Name : $Mname",
        PdfStandardFont(PdfFontFamily.timesRoman, 12), bounds: const Rect.fromLTWH(15, 90, 0, 0));
    page.graphics.drawString("2. Mother's Date of Birth : $Mdob",
        PdfStandardFont(PdfFontFamily.timesRoman, 12),bounds: const Rect.fromLTWH(15, 110, 0, 0));
    page.graphics.drawString("3. Mother's Bloog Group : $Mblood",
        PdfStandardFont(PdfFontFamily.timesRoman, 12), bounds: const Rect.fromLTWH(15, 130, 0, 0));

    page.graphics.drawString("Father's Information",
        PdfStandardFont(PdfFontFamily.timesRoman, 15, style: PdfFontStyle.bold), bounds: const Rect.fromLTWH(0, 170, 0, 0));

    //with heading start with (15,0,0,0)
    page.graphics.drawString("1. Father's Name : $Fname",
        PdfStandardFont(PdfFontFamily.timesRoman, 12), bounds: const Rect.fromLTWH(15, 200, 0, 0));
    page.graphics.drawString("2. Father's Date of Birth : $Fdob",
        PdfStandardFont(PdfFontFamily.timesRoman, 12),bounds: const Rect.fromLTWH(15, 220, 0, 0));
    page.graphics.drawString("3. Father's Bloog Group : $Fblood",
        PdfStandardFont(PdfFontFamily.timesRoman, 12), bounds: const Rect.fromLTWH(15, 240, 0, 0));

    page.graphics.drawString("+ Are both the parents together : $together",
        PdfStandardFont(PdfFontFamily.timesRoman, 15), bounds: const Rect.fromLTWH(0, 280, 0, 0));

    page.graphics.drawString("+ Number of failed pregnancies/abortions : $FailedPregnancy",
        PdfStandardFont(PdfFontFamily.timesRoman, 15), bounds: const Rect.fromLTWH(0, 310, 0, 0));

    page.graphics.drawString("+ Reason : $FPreasons",
        PdfStandardFont(PdfFontFamily.timesRoman, 15), bounds: const Rect.fromLTWH(15, 340, 0, 0));

    page.graphics.drawString("+ Have you ever considered or taken help of IVF/Test Tube Baby/Surrogacy? : $IVFHelp",
        PdfStandardFont(PdfFontFamily.timesRoman, 15), bounds: const Rect.fromLTWH(0, 380, 0, 0));

    page.graphics.drawString("+ Specifications : $together",
        PdfStandardFont(PdfFontFamily.timesRoman, 15), bounds: const Rect.fromLTWH(15, 420, 0, 0));

    page.graphics.drawString("+ Previous Surgeries? : $PastSurgery",
        PdfStandardFont(PdfFontFamily.timesRoman, 15), bounds: const Rect.fromLTWH(0, 470, 0, 0));

    page.graphics.drawString('Previous Pregnancies',
        PdfStandardFont(PdfFontFamily.timesRoman, 15, style: PdfFontStyle.bold), bounds: const Rect.fromLTWH(0, 520, 0, 0));

    //with heading start with (15,0,0,0)
    page.graphics.drawString('1. When the mother was pregnant with the child was she under the care of a doctor? : $PP',
        PdfStandardFont(PdfFontFamily.timesRoman, 12), bounds: const Rect.fromLTWH(15, 550, 500, 0),
        format: PdfStringFormat(wordWrap: PdfWordWrapType.word));

    page.graphics.drawString('2. How far along in the pregnancy was the mother when she started seeing a doctor? $PPweeks',
        PdfStandardFont(PdfFontFamily.timesRoman, 12),bounds: const Rect.fromLTWH(15, 580, 0, 0),
        format: PdfStringFormat(wordWrap: PdfWordWrapType.word));

    page.graphics.drawString('3. During this Pregnancy, did the mother have any problems? - ',
        PdfStandardFont(PdfFontFamily.timesRoman, 12), bounds: const Rect.fromLTWH(15, 610, 0, 0));

    page.graphics.drawString('$problems',
        PdfStandardFont(PdfFontFamily.timesRoman, 12), bounds: Rect.fromLTWH(30, 640, 500,0),
        format: PdfStringFormat(wordWrap: PdfWordWrapType.word));

    page.graphics.drawString('4. Any other problems during this pregnancy? $PPotherproblems',
        PdfStandardFont(PdfFontFamily.timesRoman, 12),bounds: const Rect.fromLTWH(15, 700, 0, 0),
        format: PdfStringFormat(wordWrap: PdfWordWrapType.word));

    final page1 = document.pages.add();

    page1.graphics.drawString('Birth History',
        PdfStandardFont(PdfFontFamily.timesRoman, 15,style: PdfFontStyle.bold), bounds: const Rect.fromLTWH(0, 10, 0, 0));

    page1.graphics.drawString("1. Child's Name : $ChildName",
        PdfStandardFont(PdfFontFamily.timesRoman, 12), bounds: const Rect.fromLTWH(15, 40, 0, 0));
    page1.graphics.drawString("2. Child's Current Age : $ChildAge",
        PdfStandardFont(PdfFontFamily.timesRoman, 12), bounds: const Rect.fromLTWH(15, 70, 0, 0));
    page1.graphics.drawString("3. Child's Gender : $gender",
        PdfStandardFont(PdfFontFamily.timesRoman, 12), bounds: const Rect.fromLTWH(15, 100, 0, 0));
    page1.graphics.drawString("4. Was the child born on time? : $ontime",
        PdfStandardFont(PdfFontFamily.timesRoman, 12), bounds: const Rect.fromLTWH(15, 130, 0, 0));
    page1.graphics.drawString("5. How much Early/Late? : $Childtime",
        PdfStandardFont(PdfFontFamily.timesRoman, 12), bounds: const Rect.fromLTWH(15, 160, 0, 0));
    page1.graphics.drawString("6. Delivery was? : $delivery",
        PdfStandardFont(PdfFontFamily.timesRoman, 12), bounds: const Rect.fromLTWH(15, 190, 0, 0));

    page1.graphics.drawString('7. Did the baby have any problems during labour (i.e. drop in heart rate, failure to progress, cord around neck)? $babyproblems',
        PdfStandardFont(PdfFontFamily.timesRoman, 12),bounds: const Rect.fromLTWH(15, 220, 500, 0),
        format: PdfStringFormat(wordWrap: PdfWordWrapType.word));
    page1.graphics.drawString("Specification : $ChildLaborProblem",
        PdfStandardFont(PdfFontFamily.timesRoman, 12), bounds: const Rect.fromLTWH(30, 260, 0, 0));

    page1.graphics.drawString('8. Did the baby have any problems after the delivery (i.e. need oxygen, jaundice, etc)? $deliveryproblems',
        PdfStandardFont(PdfFontFamily.timesRoman, 12),bounds: const Rect.fromLTWH(15, 300, 500, 0),
        format: PdfStringFormat(wordWrap: PdfWordWrapType.word));
    page1.graphics.drawString("Specification : $ChildDelProblem",
        PdfStandardFont(PdfFontFamily.timesRoman, 12), bounds: const Rect.fromLTWH(30, 330, 0, 0));

    page1.graphics.drawString("9. Did the baby go into the NICU? : $NICU",
        PdfStandardFont(PdfFontFamily.timesRoman, 12), bounds: const Rect.fromLTWH(15, 370, 0, 0));
    page1.graphics.drawString("Specification : $ChildNICU",
        PdfStandardFont(PdfFontFamily.timesRoman, 12), bounds: const Rect.fromLTWH(30, 400, 0, 0));
    page1.graphics.drawString("10. Did the baby have any feeding problems? : $feeding",
        PdfStandardFont(PdfFontFamily.timesRoman, 12), bounds: const Rect.fromLTWH(15, 440, 0, 0));

    page1.graphics.drawString("Ongoing Pregnancy",
        PdfStandardFont(PdfFontFamily.timesRoman, 15, style: PdfFontStyle.bold), bounds: const Rect.fromLTWH(0, 480, 0, 0));

    //with heading start with (15,0,0,0)
    page1.graphics.drawString("1. How far along in the pregnancy was the mother when she started seeing a doctor? : $OPweeks",
        PdfStandardFont(PdfFontFamily.timesRoman, 12), bounds: const Rect.fromLTWH(15, 510, 0, 0),
        format: PdfStringFormat(wordWrap: PdfWordWrapType.word));
    page1.graphics.drawString("2. What is the expected Due Date? : $OPdue",
        PdfStandardFont(PdfFontFamily.timesRoman, 12),bounds: const Rect.fromLTWH(15, 540, 0, 0));
    page1.graphics.drawString("3. During this Pregnancy, did the mother have any problems? Please check all that apply:",
        PdfStandardFont(PdfFontFamily.timesRoman, 12), bounds: const Rect.fromLTWH(15, 570, 500, 0),
        format: PdfStringFormat(wordWrap: PdfWordWrapType.word));

    page1.graphics.drawString('$currentproblems',
        PdfStandardFont(PdfFontFamily.timesRoman, 12), bounds: Rect.fromLTWH(30, 600, 500,0),
        format: PdfStringFormat(wordWrap: PdfWordWrapType.word));

    page1.graphics.drawString("4. Any other problems during this pregnancy? : $OPproblems",
        PdfStandardFont(PdfFontFamily.timesRoman, 12),bounds: const Rect.fromLTWH(15, 660, 0, 0));



    //without heading starts with 0
    /*page.graphics.drawString('+ Previous Surgeries : $controllerPrevious',
        PdfStandardFont(PdfFontFamily.timesRoman, 15), bounds: const Rect.fromLTWH(0, 130, 0, 0));*/


    List<int> bytes = document.save();
    document.dispose();

    Auth().saveAndLaunchFile(bytes, 'Pregnancy.pdf');
  }

}