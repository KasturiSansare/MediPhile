import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medapp/constants.dart';
import 'package:medapp/home/records_homepage.dart';
import 'package:medapp/image_upload/progress.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

import '../auth_class.dart';


class displayPediatrics extends StatelessWidget {
  static const String idScreen = "display";

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: new AppBar(
          //leading: new Icon(Icons.list),
          title: new Text("Pediatrics"),
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
              if (!snapshot.hasData)  {
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
        'Pediatrics').snapshots();
  }

  String ChildName;
  String ChildDOB;
  String ChildGender;
  String ChildLive;

  //Parent 1's Info
  String Parent1Name;
  String Parent1Age;
  String Parent1Health;
  String Parent1Ethnicity;

  //Parent 2's Info
  String Parent2Name;
  String Parent2Age;
  String Parent2Health;
  String Parent2Ethnicity;

  //Family History
  String OtherChildren;
  String CulturalPractices;
  String TobaccoUse;
  String FamilyHistory;

  //Pre-Natal History
  String PregProblems;
  String PregMeds;
  String PregFertility;

  //Birth History
  String ChildBirthPlace;
  String ChildTime;
  String ChildBirthWeight;

  //Immunization History
  String BCG;
  String Polio1;
  String HpB1;
  String DPT1;
  String Polio2;
  String HpB2;
  String DPT2;
  String Polio3;
  String DPT3;
  String Polio4;
  String Polio5;
  String HpB3;
  String Measles;
  String MMR;
  String DPTbooster1;
  String Polio6;
  String DPTbooster2;
  String Polio7;
  String MMRbooster;
  String TDbooster3;
  String TdCellular;


  String OtherProblems;
  String PastSurgery;

  String NewProblem;
  String Symptoms;
  String Medications;

  List history;
  List prenatalhistory;
  List childhistory;
  List optionalvaccines;

  String status;
  String culturereligion;
  String herbs;
  String fertility;
  String lateearly;
  String birthMethod;


  Widget buildCard(BuildContext context, DocumentSnapshot data) {
    final List<dynamic> tags =data['History'];
    final List<dynamic> tags1 = data['PrenatalHistory'];
    final List<dynamic> tags2 = data['ChildHistory'];
    final List<dynamic> tags3 = data['OptionalVaccines'];

    ChildName = data['ChildName'];
    ChildDOB = data['ChildDOB'];
    ChildGender = data['ChildGender'];
    ChildLive = data['ChildLiveWith'];
    Parent1Name = data['Parent1Name'];
    Parent1Age = data['Parent1Age'];
    Parent1Health = data['Parent1CurrentHealth'];
    Parent1Ethnicity = data['Parent1Race'];
    Parent2Name = data['Parent2Name'] ;
    Parent2Age = data['Parent2Age'] ;
    Parent2Health = data['Parent2CurrentHealth'];
    Parent2Ethnicity = data['Parent2Race'] ;
    status = data['MaritialStatus'];
    OtherChildren = data['OtherChildren'];
    culturereligion = data['ReligiousPractices'];
    CulturalPractices = data['ReligiousPracticesExplanation'];
    TobaccoUse = data['Tobacco'];
    history = data['History'] ;
    FamilyHistory = data['OtherHistory'] ;
    prenatalhistory = data['PrenatalHistory'] ;
    PregProblems = data['PrenatalHistoryOther'] ;
    herbs = data['PregnancyMedications'];
    PregMeds = data['PregnancyMedicationsKind'] ;
    fertility = data['FertilityTreatment'] ;
    PregFertility = data['FertilityTreatmentKind'];
    ChildBirthPlace = data['BirthPlace'];
    lateearly= data['BirthTime'] ;
    ChildTime = data['EarlyLate'] ;
    birthMethod = data['DeliveryMethod'] ;
    ChildBirthWeight = data['ChildBirthWeight'] ;
    childhistory = data['ChildHistory'] ;
    PastSurgery = data['PreviousSurgery'] ;
    OtherProblems = data['Other Problems'];
    BCG = data['BCG'] ;
    Polio1 = data['Polio1stDose'] ;
    HpB1 = data['HepatitisB1stDose'] ;
    DPT1 = data['DPT1stDose'] ;
    Polio2 = data['Polio2stDose'] ;
    HpB2 = data['HepatitisB2ndDose'] ;
    DPT2 = data['DPT2ndDose'];
    Polio3 = data['Polio3rdDose'] ;
    DPT3 = data['DPT3rdDose'] ;
    Polio4 = data['Polio4thDose'] ;
    Polio5 = data['Polio5thDose'] ;
    HpB3 = data['HepatitisB3rdDose'] ;
    Measles = data['Measles'] ;
    MMR = data['MMR'] ;
    DPTbooster1 = data['DPT1srBooster'] ;
    Polio6 = data['Polio6thDose'] ;
    DPTbooster2 = data['DPT2ndBoosterDose'];
    Polio7 = data['Polio7thDose'] ;
    MMRbooster = data['MMRBooster'] ;
    TDbooster3 = data['TD3rdBoosterDose'] ;
    TdCellular = data['TDACellularPertusis'] ;
    optionalvaccines = data['OptionalVaccines'] ;
    NewProblem = data['Problems'];
    Symptoms = data['Symptoms'];
    Medications = data['Medication'];

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
                  Text('Pediatrics', textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 30.0, color: kPrimaryColor),),
                  Spacer(),
                ]),
              ),*/
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text("Child's Information",style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 19.0),),
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
                  Text(data['ChildName'], textAlign: TextAlign.right,
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
                  Text(data['ChildDOB'], textAlign: TextAlign.right,
                    style: new TextStyle(fontSize: 17.0),),
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
                  Text(data['ChildGender'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Who does the child live with?', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['ChildLiveWith'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text("Family History",style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 19.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text("Parent 1 Information",style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),),
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
                  Text(data['Parent1Name'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Age', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['Parent1Age'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Current Health', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['Parent1CurrentHealth'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Ethinicity/Race', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['Parent1Race'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),


              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text("Parent 2 Information",style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),),
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
                  Text(data['Parent2Name'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Age', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['Parent2Age'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Current Health', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['Parent2CurrentHealth'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Ethinicity/Race', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['Parent2Race'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),


              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Marital Status of Parents', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['MaritialStatus'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Other Children in the Family', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['OtherChildren'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Are there cultural or religious practices that \n might affect your child’s medical care?', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['ReligiousPractices'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('If yes, please explain', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['ReligiousPracticesExplanation'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),


              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Is there tobacco use in/around your household?', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['Tobacco'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Is there a history in the family/a blood \nrelative of', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: //Row(
                  Wrap(
                    children: tags.map((tag) {
                      return Container(
                        //margin: EdgeInsets.only(left: 10),
                        child: Chip(
                            label: Text(tag)
                        ),
                      );
                    }).toList(),
                  )
              ),
              /*Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['History'].toString(),
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),*/

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Other', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['OtherHistory'].toString(),
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text("Prenatal History",style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 19.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('While pregnant, did mother have any of the \n following?', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: //Row(
                  Wrap(
                    children: tags1.map((tag) {
                      return Container(
                        //margin: EdgeInsets.only(left: 10),
                        child: Chip(
                            label: Text(tag)
                        ),
                      );
                    }).toList(),
                  )
              ),
              /*Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['PrenatalHistory'].toString(),
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),*/

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text("Other", style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['PrenatalHistoryOther'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Were medications or herbs taken during \n pregnancy?', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['PregnancyMedications'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('If yes, what kind?', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['PregnancyMedicationsKind'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text("Birth History",style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 19.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Where was the child Born?', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['BirthPlace'],
                    style: new TextStyle(fontSize: 16.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Was child born early, late or on time?', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['BirthTime'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('How early/how late?', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 17.5),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['EarlyLate'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('What was the method of delivery?', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 17.5),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['DeliveryMethod'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text("Child's Birth Weight", style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 17.5),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['ChildBirthWeight'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text("Past Medical History",style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 19.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Has the child had/currently have', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 17.5),),
                  Spacer(),
                ]),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: //Row(
                  Wrap(
                    children: tags2.map((tag) {
                      return Container(
                        //margin: EdgeInsets.only(left: 10),
                        child: Chip(
                            label: Text(tag)
                        ),
                      );
                    }).toList(),
                  )
              ),/*Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['ChildHistory'].toString(),
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),*/

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Any previous surgeries?', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 17.5),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['PreviousSurgery'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Any other concerns/problems?', style: new TextStyle(
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
                  Text("Immunisation Record",style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 19.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('At Birth', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 17.5),),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('BCG ', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['BCG'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Oral Polio 1st Dose ', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['Polio1stDose'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Hepatitis B 1st Dose ', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['HepatitisB1stDose'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('At 6 Weeks/More', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 17.5),),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('DPT 1st Dose ', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['DPT1stDose'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Oral Polio 2nd Dose ', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['Polio2stDose'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Hepatitis B 2nd Dose ', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['HepatitisB2ndDose'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('10 Weeks/After', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 17.5),),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('DPT 2nd Dose ', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['DPT2ndDose'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Oral Polio 3rd Dose ', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['Polio3rdDose'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('14 Weeks/After', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 17.5),),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('DPT 3rd Dose ', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['DPT3rdDose'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Oral Polio 4th Dose ', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['Polio4thDose'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('6-9 Months', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 17.5),),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Oral Polio 5th Dose ', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['Polio5thDose'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Hepatitis B 3rd Dose ', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['HepatitisB3rdDose'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('At 9 Months', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 17.5),),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Measles ', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['Measles'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('15-18 Months/After', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 17.5),),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('MMR ', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['MMR'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('DPT-1st Booster Dose ', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['DPT1srBooster'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Oral Polio 6th Dose ', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['Polio6thDose'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('4.5 Years/After', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 17.5),),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('DPT-2nd Booster Dose', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['DPT2ndBoosterDose'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Oral Polio 7th Dose ', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['Polio7thDose'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('MMR Booster ', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['MMRBooster'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('At 10 YearsAt 10 Years', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 17.5),),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('TD-3rd Booster Dose', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['TD3rdBoosterDose'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('At 16 Years', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 17.5),),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('TD+A Cellular Pertusis ', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['TDACellularPertusis'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Optional Vaccines ', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              /*Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['OptionalVaccines'].toString(),
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),
*/
              Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: //Row(
                  Wrap(
                    children: tags3.map((tag) {
                      return Container(
                        //margin: EdgeInsets.only(left: 10),
                        child: Chip(
                            label: Text(tag)
                        ),
                      );
                    }).toList(),
                  )
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Current Problems', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 19.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Problems/Complains', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['Problems'], style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Symptoms', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['Symptoms'], style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Treatment/Medications', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['Medication'], style: new TextStyle(fontSize: 17.0),
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
    page.graphics.drawString('Pediatrics',
        PdfStandardFont(PdfFontFamily.helvetica, 25, style: PdfFontStyle.bold));

    page.graphics.drawLine(
        PdfPen(PdfColor(0,0,0)),
        Offset(0, 40),
        Offset(page.getClientSize().width, 40));

    page.graphics.drawString("Child's Information",
        PdfStandardFont(PdfFontFamily.timesRoman, 15, style: PdfFontStyle.bold), bounds: const Rect.fromLTWH(0, 60, 0, 0));

    //with heading start with (15,0,0,0)
    page.graphics.drawString("1. Name : $ChildName",
        PdfStandardFont(PdfFontFamily.timesRoman, 12), bounds: const Rect.fromLTWH(15, 90, 0, 0));
    page.graphics.drawString("2. Date of Birth : $ChildDOB",
        PdfStandardFont(PdfFontFamily.timesRoman, 12),bounds: const Rect.fromLTWH(15, 110, 0, 0));
    page.graphics.drawString("3. Gender : $ChildGender",
        PdfStandardFont(PdfFontFamily.timesRoman, 12), bounds: const Rect.fromLTWH(15, 130, 0, 0));
    page.graphics.drawString("4. Child lives with : $ChildLive",
        PdfStandardFont(PdfFontFamily.timesRoman, 12), bounds: const Rect.fromLTWH(15, 150, 0, 0));

    page.graphics.drawString("Family History",
        PdfStandardFont(PdfFontFamily.timesRoman, 15, style: PdfFontStyle.bold), bounds: const Rect.fromLTWH(0, 190, 0, 0));
    page.graphics.drawString("Parent 1 Informatiom",
        PdfStandardFont(PdfFontFamily.timesRoman, 13, style: PdfFontStyle.bold), bounds: const Rect.fromLTWH(15, 220, 0, 0));

    //with heading start with (15,0,0,0)
    page.graphics.drawString("1. Name : $Parent1Name",
        PdfStandardFont(PdfFontFamily.timesRoman, 12), bounds: const Rect.fromLTWH(30, 250, 0, 0));
    page.graphics.drawString("2. Age : $Parent1Age",
        PdfStandardFont(PdfFontFamily.timesRoman, 12),bounds: const Rect.fromLTWH(30, 270, 0, 0));
    page.graphics.drawString("3. Current Health : $Parent1Health",
        PdfStandardFont(PdfFontFamily.timesRoman, 12), bounds: const Rect.fromLTWH(30, 290, 0, 0));
    page.graphics.drawString("4. Ethnicity/Race : $Parent1Ethnicity",
        PdfStandardFont(PdfFontFamily.timesRoman, 12), bounds: const Rect.fromLTWH(30, 310, 0, 0));

    page.graphics.drawString("Parent 2 Informatiom",
        PdfStandardFont(PdfFontFamily.timesRoman, 13, style: PdfFontStyle.bold), bounds: const Rect.fromLTWH(15, 340, 0, 0));

    //with heading start with (15,0,0,0)
    page.graphics.drawString("1. Name : $Parent2Name",
        PdfStandardFont(PdfFontFamily.timesRoman, 12), bounds: const Rect.fromLTWH(30, 370, 0, 0));
    page.graphics.drawString("2. Age : $Parent2Age",
        PdfStandardFont(PdfFontFamily.timesRoman, 12),bounds: const Rect.fromLTWH(30, 390, 0, 0));
    page.graphics.drawString("3. Current Health : $Parent2Health",
        PdfStandardFont(PdfFontFamily.timesRoman, 12), bounds: const Rect.fromLTWH(30, 410, 0, 0));
    page.graphics.drawString("4. Ethnicity/Race : $Parent2Ethnicity",
        PdfStandardFont(PdfFontFamily.timesRoman, 12), bounds: const Rect.fromLTWH(30, 430, 0, 0));


    page.graphics.drawString("+ Marital Status : $status",
        PdfStandardFont(PdfFontFamily.timesRoman, 15), bounds: const Rect.fromLTWH(15, 470, 0, 0));

    page.graphics.drawString("+ Other Children in the Family : $OtherChildren",
        PdfStandardFont(PdfFontFamily.timesRoman, 15), bounds: const Rect.fromLTWH(15, 500, 0, 0));

    page.graphics.drawString("+ Are there cultural or religious practices that might affect your child's medical care? e.g. blood transfusion, dietary rules, etc. : $culturereligion",
        PdfStandardFont(PdfFontFamily.timesRoman, 15), bounds: const Rect.fromLTWH(15, 530, 590, 0),
        format: PdfStringFormat(wordWrap: PdfWordWrapType.word));

    page.graphics.drawString("+ Explanation : $CulturalPractices",
        PdfStandardFont(PdfFontFamily.timesRoman, 15), bounds: const Rect.fromLTWH(15, 570, 0, 0));

    page.graphics.drawString("+ Tobacco use in/around : $TobaccoUse",
        PdfStandardFont(PdfFontFamily.timesRoman, 15), bounds: const Rect.fromLTWH(15, 600, 0, 0));

    page.graphics.drawString('+ Is there a history in the family/a blood relative of - ',
        PdfStandardFont(PdfFontFamily.timesRoman, 15), bounds: const Rect.fromLTWH(15, 630, 0, 0));

    page.graphics.drawString('$history',
        PdfStandardFont(PdfFontFamily.timesRoman, 12), bounds: Rect.fromLTWH(30, 660, 500,0),
        format: PdfStringFormat(wordWrap: PdfWordWrapType.word));

    page.graphics.drawString("+ Other history in the family/a blood relative : $FamilyHistory",
        PdfStandardFont(PdfFontFamily.timesRoman, 15), bounds: const Rect.fromLTWH(15, 710, 0, 0));

    final page1 = document.pages.add();


    page1.graphics.drawString("Prenatal History",
        PdfStandardFont(PdfFontFamily.timesRoman, 15, style: PdfFontStyle.bold), bounds: const Rect.fromLTWH(0, 0, 0, 0));

    page1.graphics.drawString('+ While pregnant, did mother have any of the following? - ',
        PdfStandardFont(PdfFontFamily.timesRoman, 12), bounds: const Rect.fromLTWH(15,30, 0, 0));

    page1.graphics.drawString('$prenatalhistory',
        PdfStandardFont(PdfFontFamily.timesRoman, 12), bounds: Rect.fromLTWH(30, 60, 500,0),
        format: PdfStringFormat(wordWrap: PdfWordWrapType.word));

    page1.graphics.drawString("+ Other : $PregProblems",
        PdfStandardFont(PdfFontFamily.timesRoman, 12), bounds: const Rect.fromLTWH(15, 110, 0, 0));

    page1.graphics.drawString("+ Were medications or herbs taken during pregnancy? : $herbs",
        PdfStandardFont(PdfFontFamily.timesRoman, 12), bounds: const Rect.fromLTWH(15, 140, 500, 0),
        format: PdfStringFormat(wordWrap: PdfWordWrapType.word));

    page1.graphics.drawString("+ Kind : $PregMeds",
        PdfStandardFont(PdfFontFamily.timesRoman, 12), bounds: const Rect.fromLTWH(30, 170, 0, 0));

    page1.graphics.drawString("+ Was a fertility treatment used for this pregnancy? : $fertility",
        PdfStandardFont(PdfFontFamily.timesRoman, 12), bounds: const Rect.fromLTWH(15, 200, 500, 0),
        format: PdfStringFormat(wordWrap: PdfWordWrapType.word));

    page1.graphics.drawString("+ Kind : $PregFertility",
        PdfStandardFont(PdfFontFamily.timesRoman, 12), bounds: const Rect.fromLTWH(30, 230, 0, 0));

    page1.graphics.drawString("Birth History",
        PdfStandardFont(PdfFontFamily.timesRoman, 15, style: PdfFontStyle.bold), bounds: const Rect.fromLTWH(0, 270, 0, 0));

    page1.graphics.drawString('+ Where was the child born? : $ChildBirthPlace',
        PdfStandardFont(PdfFontFamily.timesRoman, 12), bounds: const Rect.fromLTWH(15, 300, 0, 0));

    page1.graphics.drawString("+ Was child born early, late or on time? : $lateearly",
        PdfStandardFont(PdfFontFamily.timesRoman, 12), bounds: const Rect.fromLTWH(15, 330, 0, 0));
    page1.graphics.drawString("+ How early/late? : $ChildTime",
        PdfStandardFont(PdfFontFamily.timesRoman, 12), bounds: const Rect.fromLTWH(15, 360, 0, 0));

    page1.graphics.drawString("+ What was the method of delivery? : $birthMethod",
        PdfStandardFont(PdfFontFamily.timesRoman, 12), bounds: const Rect.fromLTWH(15, 390, 0, 0));
    page1.graphics.drawString("+ Child's Birth Weight : $ChildBirthWeight",
        PdfStandardFont(PdfFontFamily.timesRoman, 12), bounds: const Rect.fromLTWH(15, 420, 0, 0));

    page1.graphics.drawString("Past Medical History",
        PdfStandardFont(PdfFontFamily.timesRoman, 15, style: PdfFontStyle.bold), bounds: const Rect.fromLTWH(0, 460, 0, 0));

    page1.graphics.drawString('+ Has the child had/currently have - ',
        PdfStandardFont(PdfFontFamily.timesRoman, 12), bounds: const Rect.fromLTWH(15, 500, 0, 0));
    page1.graphics.drawString('$childhistory',
        PdfStandardFont(PdfFontFamily.timesRoman, 12), bounds: Rect.fromLTWH(30, 530, 500,0),
        format: PdfStringFormat(wordWrap: PdfWordWrapType.word));
    page1.graphics.drawString("+ Previous Surgeries : $PastSurgery",
        PdfStandardFont(PdfFontFamily.timesRoman, 12), bounds: const Rect.fromLTWH(15, 580, 0, 0));
    page1.graphics.drawString("+ Other Concerns/Problems : $OtherProblems",
        PdfStandardFont(PdfFontFamily.timesRoman, 12), bounds: const Rect.fromLTWH(15, 610, 0, 0));

    final page2 = document.pages.add();
    page2.graphics.drawString("Immunisation Record",
        PdfStandardFont(PdfFontFamily.timesRoman, 15, style: PdfFontStyle.bold), bounds: const Rect.fromLTWH(0, 0, 0, 0));


    PdfGrid grid = PdfGrid();
    grid.style = PdfGridStyle(
        font: PdfStandardFont(PdfFontFamily.helvetica, 12),
        cellPadding: PdfPaddings(left: 10, right: 2, top: 5, bottom: 2));

    grid.columns.add(count: 2);
    grid.headers.add(1);

    PdfGridRow header = grid.headers[0];
    header.cells[0].value = 'Dose Name';
    header.cells[1].value = 'Date(Given on)';

    PdfGridRow row = grid.rows.add();
    row.cells[0].value = ' - AT BIRTH - ';

    row = grid.rows.add();
    row.cells[0].value = 'BCG';
    row.cells[1].value = BCG;

    row = grid.rows.add();
    row.cells[0].value = 'Oral Polio 1st Dose';
    row.cells[1].value = Polio1;

    row = grid.rows.add();
    row.cells[0].value = 'Hepatitis B 1st Dose';
    row.cells[1].value = HpB1;

    row = grid.rows.add();
    row.cells[0].value = ' - AT 6 WEEKS/MORE - ';

    row = grid.rows.add();
    row.cells[0].value = 'DPT 1st Dose';
    row.cells[1].value = DPT1;

    row = grid.rows.add();
    row.cells[0].value = 'Oral Polio 2nd Dose';
    row.cells[1].value = Polio2;

    row = grid.rows.add();
    row.cells[0].value = 'Hepatitis B 2nd Dose';
    row.cells[1].value = HpB2;

    row = grid.rows.add();
    row.cells[0].value = ' - AT 10 WEEKS/MORE - ';

    row = grid.rows.add();
    row.cells[0].value = 'DPT 2nd Dose';
    row.cells[1].value = DPT2;

    row = grid.rows.add();
    row.cells[0].value = 'Oral Polio 3rd Dose';
    row.cells[1].value = Polio3;

    row = grid.rows.add();
    row.cells[0].value = ' - AT 14 WEEKS/MORE - ';

    row = grid.rows.add();
    row.cells[0].value = 'DPT 3rd Dose';
    row.cells[1].value = DPT3;

    row = grid.rows.add();
    row.cells[0].value = 'Oral Polio 4th Dose';
    row.cells[1].value = Polio4;

    row = grid.rows.add();
    row.cells[0].value = ' - AT 6-9 MONTHS - ';

    row = grid.rows.add();
    row.cells[0].value = 'Oral Polio 5th Dose';
    row.cells[1].value = Polio5;

    row = grid.rows.add();
    row.cells[0].value = 'Hepatitis B 3rd Dose';
    row.cells[1].value = HpB3;

    row = grid.rows.add();
    row.cells[0].value = ' - AT 9 MONTHS - ';

    row = grid.rows.add();
    row.cells[0].value = 'Measles';
    row.cells[1].value = Measles;

    row = grid.rows.add();
    row.cells[0].value = ' - 15-18 MONTHS/AFTER - ';

    row = grid.rows.add();
    row.cells[0].value = 'MMR';
    row.cells[1].value = MMR;

    row = grid.rows.add();
    row.cells[0].value = 'DPT-1st Booster Dose';
    row.cells[1].value = DPTbooster1;

    row = grid.rows.add();
    row.cells[0].value = 'Oral Polio 6th Dose';
    row.cells[1].value = Polio6;

    row = grid.rows.add();
    row.cells[0].value = ' - 4.5 YEARS/AFTER - ';

    row = grid.rows.add();
    row.cells[0].value = 'DPT-2ND Booster Dose';
    row.cells[1].value = DPTbooster2;

    row = grid.rows.add();
    row.cells[0].value = 'Oral Polio 7th Dose';
    row.cells[1].value = Polio7;

    row = grid.rows.add();
    row.cells[0].value = 'MMR Booster';
    row.cells[1].value = MMRbooster;

    grid.draw(
        page: page2, bounds: const Rect.fromLTWH(50, 30, 450, 0));

    final page3 = document.pages.add();

    PdfGrid grid1 = PdfGrid();
    grid1.style = PdfGridStyle(
        font: PdfStandardFont(PdfFontFamily.helvetica, 12),
        cellPadding: PdfPaddings(left: 10, right: 2, top: 5, bottom: 2));

    grid1.columns.add(count: 2);
    //grid1.headers.add(1);

    PdfGridRow row1 = grid.rows.add();

    row1 = grid1.rows.add();
    row1.cells[0].value = ' - AT 10 YEARS - ';

    row1 = grid1.rows.add();
    row1.cells[0].value = 'TD-3rd Booster Dose';
    row1.cells[1].value = TDbooster3;

    row1 = grid1.rows.add();
    row1.cells[0].value = ' - 16 YEARS - ';

    row1 = grid1.rows.add();
    row1.cells[0].value = 'TD+A Cellular Pertusis';
    row1.cells[1].value = TdCellular;

    grid1.draw(
        page: page3, bounds: const Rect.fromLTWH(50, 30, 450, 0));

    page3.graphics.drawString('Current Problems',
        PdfStandardFont(PdfFontFamily.timesRoman, 15, style: PdfFontStyle.bold), bounds: const Rect.fromLTWH(0, 180, 0, 0));

    //with heading start with (15,0,0,0)
    page3.graphics.drawString('1. Problems/Complains : $NewProblem',
        PdfStandardFont(PdfFontFamily.timesRoman, 12), bounds: const Rect.fromLTWH(15, 210, 0, 0));
    page3.graphics.drawString('2. Symptoms : $Symptoms',
        PdfStandardFont(PdfFontFamily.timesRoman, 12),bounds: const Rect.fromLTWH(15, 240, 0, 0));
    page3.graphics.drawString('3. Treatment/Medications : $Medications',
        PdfStandardFont(PdfFontFamily.timesRoman, 12), bounds: const Rect.fromLTWH(15, 270, 0, 0));

    List<int> bytes = document.save();
    document.dispose();

    Auth().saveAndLaunchFile(bytes, 'Pediatrics.pdf');
  }

}