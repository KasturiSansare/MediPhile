import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medapp/auth_class.dart';
import 'package:medapp/constants.dart';
import 'package:medapp/home/records_homepage.dart';
import 'package:medapp/image_upload/progress.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class displayGynecology extends StatelessWidget {
  static const String idScreen = "display";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        //leading: new Icon(Icons.list),
        title: new Text("Gynecology"),
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
              if(!snapshot.hasData) {
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
        'Gynecology').snapshots();
  }

  List specific;

  String jk1;
  String jk2;
  String jk3;
  String jk4;
  String jk5;
  String jk6;

  String controllerAgeFMP;
  String controllerBleedingDays;
  String controllerTamponsNo;
  String controllerAgeLMP;

  String controllerCurrentBC;
  String controllerPastBC;
  String controllerBCUseLength;
  String controllerBCReason;

  String controllerPapSmear;
  String controllerMammogram;
  String controllerBoneDensity;
  String controllerColonoscopy;

  String controllerPregnancy;
  String controllerVaginalBirth;
  String controllerEctopics;
  String controllerAbortions;
  String controllerLiveChildren;
  String controllerCSection;
  String controllerMiscarriages;

  String controllerPastSurgery;

  String controllerNewProblem;
  String controllerSymptoms;
  String controllerMedications;


  Widget buildCard(BuildContext context, DocumentSnapshot data) {

    specific = data['Personal history'];
    final List<dynamic> tags = data['Personal History'];

    jk1= data['Menstrual Flow'];
    jk2 = data['Discomfort'];
    jk3= data['Bleed'];
    jk4 = data['Bleed after menstrual stop'];
    jk5 = data['HPV Vaccine'];
    jk6= data['Therapy'];

    controllerAgeFMP = data['First Period'];
    controllerBleedingDays= data['Days you bleed'];
    controllerTamponsNo = data['No of tampons'];
    controllerAgeLMP= data['Menstrual Stop'];

    controllerCurrentBC = data['Birth Control method'];
    controllerPastBC= data['Past method'];
    controllerBCUseLength = data['Length'];
    controllerBCReason = data['Reason'];

    controllerPapSmear= data['Pap Smear'];
    controllerMammogram = data['Mammogram'];
    controllerBoneDensity= data['DEXA'];
    controllerColonoscopy = data['Colonoscopy'];

    controllerPregnancy= data['Pregnancies'];
    controllerVaginalBirth = data['Vaginal Birth'];
    controllerEctopics= data['Ectopics'];
    controllerAbortions = data['Abortions'];
    controllerLiveChildren = data['Children'];
    controllerCSection= data['C-Sections'];
    controllerMiscarriages = data['Miscarriages'];

    controllerPastSurgery= data['Previous Surgeries'];
    controllerNewProblem = data['Problems'];
    controllerSymptoms= data['Symptoms'];
    controllerMedications = data['Meds'];


    return new Container(
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 30.0),
                child: Row(children: <Widget>[
                  Text('Gynecology', textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 30.0, color: kPrimaryColor),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Menstrual History',style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 19.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Age at first menstrual period', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.5),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['First Period'].toString(), textAlign: TextAlign.right,
                    style: new TextStyle(fontSize: 17.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Number of days you bleed', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.5),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['Days you bleed'], textAlign: TextAlign.right,
                    style: new TextStyle(fontSize: 17.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Describe the amount of menstrual flow', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['Menstrual Flow'].toString(),
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),
              //Expanded(
              Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Row(children: <Widget>[
                    //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                    Text('How many tampons or pads do you use on \n your heaviest day?', style: new TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 16.0),),
                    Spacer(),
                  ]),
                ),
              //),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['No of tampons'],style: new TextStyle(fontSize: 17.0),overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Describe the amount of menstrual discomfort', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['Discomfort'].toString(),
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Do you bleed in between your periods?', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['Bleed'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('If you stopped menstruating, at \n what age did you stop?', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['Menstrual Stop'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Have you had bleeding or spotting since your \n periods stopped?', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['Bleed after menstrual stop'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Contraceptive History', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 19.0),),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Present birth control method', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['Birth Control method'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Birth control methods used in the past', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['Past method'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Length of use', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['Length'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Reason for Discontinuation', style: new TextStyle(
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
                  Text('Gynecological History', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 19.0),),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Have you been vaccinated for Human \nPapilloma Virus (HPV) – Gardasil?', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['HPV Vaccine'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Last Pap Smear', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['Pap Smear'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Last Mammogram', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['Mammogram'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Last Bone Density (DEXA)', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['DEXA'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Last Colonoscopy', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['Colonoscopy'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text("Have you ever been on hormone therapy \n"
                      " (estrogen / progesterone)?", style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['Therapy'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Any Personal History of', style: new TextStyle(
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
                          margin: EdgeInsets.only(left: 10),
                          child: Chip(
                              label: Text(tag)
                          ),
                        );
                      }).toList(),
                    )
                  ),
              //),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Obstetrical History', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 19.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Please record the number of:', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 17.5),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Pregnancies', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['Pregnancies'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Vaginal Births', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 17.5),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['Vaginal Birth'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Ectopics', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 17.5),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['Ectopics'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Abortions', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 17.5),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['Abortions'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Living Children', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 17.5),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['Children'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('C-Sections', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 17.5),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['C-Sections'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Miscarriages', style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 17.5),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward, color: kPrimaryColor),
                  Text(data['Miscarriages'],
                    style: new TextStyle(fontSize: 17.0),
                    overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Any Previous Surgeries', style: new TextStyle(
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
    page.graphics.drawString('Gynecology',
        PdfStandardFont(PdfFontFamily.helvetica, 25, style: PdfFontStyle.bold));

    page.graphics.drawLine(
        PdfPen(PdfColor(0,0,0)),
        Offset(0, 40),
        Offset(page.getClientSize().width, 40));

    //common part ends

    //heading
    page.graphics.drawString('Menstrual History',
        PdfStandardFont(PdfFontFamily.timesRoman, 15, style: PdfFontStyle.bold), bounds: const Rect.fromLTWH(0, 60, 0, 0));

    page.graphics.drawString('1. Age at first menstrual period : $controllerAgeFMP' ,
        PdfStandardFont(PdfFontFamily.timesRoman, 15), bounds: const Rect.fromLTWH(15, 90, 0, 0));

    page.graphics.drawString('2. Number of days you bleed : $controllerBleedingDays ',
        PdfStandardFont(PdfFontFamily.timesRoman, 15), bounds: const Rect.fromLTWH(15, 120, 0, 0));

    page.graphics.drawString('3. Describe the amount of menstrual flow :  $jk1',
        PdfStandardFont(PdfFontFamily.timesRoman, 15), bounds: const Rect.fromLTWH(15, 150, 0, 0));

    page.graphics.drawString('4. How many tampons or pads do you use on your heaviest day? :  $controllerTamponsNo',
        PdfStandardFont(PdfFontFamily.timesRoman, 15), bounds: const Rect.fromLTWH(15, 180, 0, 0));

    page.graphics.drawString('5. Describe the amount of menstrual discomfort : $jk2 ',
        PdfStandardFont(PdfFontFamily.timesRoman, 15), bounds: const Rect.fromLTWH(15, 210, 0, 0));

    page.graphics.drawString('6. Do you bleed in between your periods? : $jk3',
        PdfStandardFont(PdfFontFamily.timesRoman, 15), bounds: const Rect.fromLTWH(15, 240, 0, 0));

    page.graphics.drawString('7. If you stopped menstruating, at what age did you stop? : $controllerAgeLMP ',
        PdfStandardFont(PdfFontFamily.timesRoman, 15), bounds: const Rect.fromLTWH(15, 270, 0, 0));

    page.graphics.drawString('8. Have you had bleeding or spotting since your periods stopped? : $jk4 ',
        PdfStandardFont(PdfFontFamily.timesRoman, 15), bounds: const Rect.fromLTWH(15, 300, 0, 0));


    page.graphics.drawString('Contraceptive History',
        PdfStandardFont(PdfFontFamily.timesRoman, 15, style: PdfFontStyle.bold), bounds: const Rect.fromLTWH(0, 350, 0, 0));

    page.graphics.drawString('1. Present birth control method : $controllerCurrentBC ',
        PdfStandardFont(PdfFontFamily.timesRoman, 15), bounds: const Rect.fromLTWH(15, 380, 0, 0));

    page.graphics.drawString('2. Birth control methods used in the past : $controllerPastBC ',
        PdfStandardFont(PdfFontFamily.timesRoman, 15), bounds: const Rect.fromLTWH(15, 410, 0, 0));

    page.graphics.drawString('3. Length of use : $controllerBCUseLength ',
        PdfStandardFont(PdfFontFamily.timesRoman, 15), bounds: const Rect.fromLTWH(15, 440, 0, 0));

    page.graphics.drawString('4. Reason for Discontinuation : $controllerBCReason ',
        PdfStandardFont(PdfFontFamily.timesRoman, 15), bounds: const Rect.fromLTWH(15, 470, 0, 0));


    page.graphics.drawString('Gynecological History',
        PdfStandardFont(PdfFontFamily.timesRoman, 15, style: PdfFontStyle.bold), bounds: const Rect.fromLTWH(0, 520, 0, 0));

    page.graphics.drawString("1. Have you been vaccinated for Human Papilloma Virus (HPV) - Gardasil? : $jk5 ",
        PdfStandardFont(PdfFontFamily.timesRoman, 15), bounds: const Rect.fromLTWH(15, 550, 500, 0),
        format: PdfStringFormat(wordWrap: PdfWordWrapType.word));

    page.graphics.drawString('2. Last Pap Smear : $controllerPapSmear ',
        PdfStandardFont(PdfFontFamily.timesRoman, 15), bounds: const Rect.fromLTWH(15, 580, 0, 0));
    page.graphics.drawString('3. Last Mammogram : $controllerMammogram ',
        PdfStandardFont(PdfFontFamily.timesRoman, 15), bounds: const Rect.fromLTWH(15, 610, 0, 0));

    page.graphics.drawString('4. Last Bone Density (DEXA) : $controllerBoneDensity ',
        PdfStandardFont(PdfFontFamily.timesRoman, 15), bounds: const Rect.fromLTWH(15, 640, 0, 0));

    page.graphics.drawString('5. Last Colonoscopy : $controllerColonoscopy ',
        PdfStandardFont(PdfFontFamily.timesRoman, 15), bounds: const Rect.fromLTWH(15, 670, 0, 0));

    page.graphics.drawString('6. Have you ever been on hormone therapy (estrogen / progesterone)? : $jk6 ',
        PdfStandardFont(PdfFontFamily.timesRoman, 15), bounds: const Rect.fromLTWH(15, 700, 0, 0));


    final page1 = document.pages.add();

    page1.graphics.drawString('7. Any Personal History of : ',
        PdfStandardFont(PdfFontFamily.timesRoman, 15), bounds: const Rect.fromLTWH(15, 30, 0, 0));

    page1.graphics.drawString('$specific',
        PdfStandardFont(PdfFontFamily.timesRoman, 12), bounds: Rect.fromLTWH(25, 60, 500,0),
        format: PdfStringFormat(wordWrap: PdfWordWrapType.word));



    page1.graphics.drawString('Obstetrical History',
        PdfStandardFont(PdfFontFamily.timesRoman, 15, style: PdfFontStyle.bold), bounds: const Rect.fromLTWH(0, 110, 0, 0));
    page1.graphics.drawString('Please record the number of:',
        PdfStandardFont(PdfFontFamily.timesRoman, 15, style: PdfFontStyle.bold), bounds: const Rect.fromLTWH(10, 140, 0, 0));


    page1.graphics.drawString('1. Pregnancies : $controllerPregnancy ',
        PdfStandardFont(PdfFontFamily.timesRoman, 15), bounds: const Rect.fromLTWH(15, 170, 0, 0));

    page1.graphics.drawString('2. Vaginal Births : $controllerVaginalBirth ',
        PdfStandardFont(PdfFontFamily.timesRoman, 15), bounds: const Rect.fromLTWH(15, 200, 0, 0));

    page1.graphics.drawString('3. Ectopics : $controllerEctopics ',
        PdfStandardFont(PdfFontFamily.timesRoman, 15), bounds: const Rect.fromLTWH(15, 230, 0, 0));

    page1.graphics.drawString('4. Abortions : $controllerAbortions ',
        PdfStandardFont(PdfFontFamily.timesRoman, 15), bounds: const Rect.fromLTWH(15, 260, 0, 0));

    page1.graphics.drawString('5. Living Children : $controllerLiveChildren ',
        PdfStandardFont(PdfFontFamily.timesRoman, 15), bounds: const Rect.fromLTWH(15, 290, 0, 0));

    page1.graphics.drawString('6. C-Sections : $controllerCSection ',
        PdfStandardFont(PdfFontFamily.timesRoman, 15), bounds: const Rect.fromLTWH(15, 320, 0, 0));

    page1.graphics.drawString('7. Miscarriages : $controllerMiscarriages ',
        PdfStandardFont(PdfFontFamily.timesRoman, 15), bounds: const Rect.fromLTWH(15, 350, 0, 0));

    page1.graphics.drawString('+ Any Previous Surgeries? : $controllerPastSurgery ',
        PdfStandardFont(PdfFontFamily.timesRoman, 15), bounds: const Rect.fromLTWH(0, 390, 0, 0));

    //heading
    page1.graphics.drawString('Current Problems',
        PdfStandardFont(PdfFontFamily.timesRoman, 15, style: PdfFontStyle.bold), bounds: const Rect.fromLTWH(0, 440, 0, 0));

    //with heading start with (15,0,0,0)
    page1.graphics.drawString('1. Problems/Complains : $controllerNewProblem',
        PdfStandardFont(PdfFontFamily.timesRoman, 12), bounds: const Rect.fromLTWH(15, 470, 0, 0));
    page1.graphics.drawString('2. Symptoms : $controllerSymptoms',
        PdfStandardFont(PdfFontFamily.timesRoman, 12),bounds: const Rect.fromLTWH(15, 500, 0, 0));
    page1.graphics.drawString('3. Treatment/Medications : $controllerMedications',
        PdfStandardFont(PdfFontFamily.timesRoman, 12), bounds: const Rect.fromLTWH(15, 530, 0, 0));



    List<int> bytes = document.save();
    document.dispose();

    Auth().saveAndLaunchFile(bytes, 'Gynecology.pdf');
  }

}