import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medapp/auth_class.dart';
import 'package:medapp/constants.dart';
import 'package:medapp/constants.dart';
import 'package:medapp/constants.dart';
import 'package:medapp/constants.dart';
import 'package:medapp/constants.dart';
import 'package:medapp/constants.dart';
import 'package:medapp/constants.dart';
import 'package:medapp/constants.dart';
import 'package:medapp/constants.dart';
import 'package:medapp/constants.dart';
import 'package:medapp/constants.dart';
import 'package:medapp/constants.dart';
import 'package:medapp/constants.dart';
import 'package:medapp/constants.dart';
import 'package:medapp/constants.dart';
import 'package:medapp/constants.dart';
import 'package:medapp/constants.dart';
import 'package:medapp/constants.dart';
import 'package:medapp/constants.dart';
import 'package:medapp/constants.dart';
import 'package:medapp/constants.dart';
import 'package:medapp/constants.dart';
import 'package:medapp/constants.dart';
import 'package:medapp/home/records_homepage.dart';
import 'package:medapp/image_upload/progress.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class displayEndocrinology extends StatelessWidget{
  static const String idScreen = "display";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        //leading: new Icon(Icons.list),
        title: new Text("Endocrinology"),
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
  /*Widget build(BuildContext context) {
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
  }*/

  Stream<QuerySnapshot> getUsersStreamSnapshots(BuildContext context) async* {
    final uid = await FirebaseAuth.instance.currentUser();
    yield* Firestore.instance.collection('Users').document(uid.uid).collection('Endocrinology').snapshots();
  }

  String controllerPain;
  String controllerLoc;
  String controllerMedication;
  String controllernow;
  String controllerRelieves;
  String controllerEffects;
  String controllerPrevious;
  String controllerNewProblem;
  String controllerSymptoms;
  String controllerMedications ;

 Widget buildCard(BuildContext context, DocumentSnapshot data) {

   controllerPain=data['PainOngoing'];
   controllerLoc=data['Pain Location And Intensity'];
   controllerMedications=data['Pain Relief Meds'];
   controllernow=data['pain control'];
   controllerRelieves=data['pain inducer'];
   controllerEffects=data['Effects of pain'];
   controllerPrevious=data['Surgeries'];
   controllerNewProblem = data['Problems'];
   controllerSymptoms= data['Symptoms'];
   controllerMedications = data['Medication'];

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
                  Text('Endocrinology', textAlign:TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize:30.0, color: kPrimaryColor),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Pain History',style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 19.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Do you have any ongoing pain problems?',style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.5),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward,color: kPrimaryColor ),
                  Text(data['PainOngoing'], textAlign: TextAlign.right, style: new TextStyle(fontSize: 17.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Location and intensity of pain',style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.5),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward,color: kPrimaryColor ),
                  Text(data['Pain Location And Intensity'], textAlign: TextAlign.right, style: new TextStyle(fontSize: 17.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('What Medications (if any) do you take for \n pain relief?',style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward,color: kPrimaryColor ),
                  Text(data['Pain Relief Meds'], style: new TextStyle(fontSize: 17.0),overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Is your pain satisfactorily controlled now?',style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward,color: kPrimaryColor ),
                  Text(data['pain control'], style: new TextStyle(fontSize: 17.0),overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('What relieves or intensifies your pain?',style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward,color: kPrimaryColor ),
                  Text(data['pain inducer'], style: new TextStyle(fontSize: 17.0),overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Effects of pain on quality of life \n (sleep, appetite, activity)',style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward,color: kPrimaryColor ),
                  Text(data['Effects of pain'], style: new TextStyle(fontSize: 17.0),overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Any Previous Surgeries?',style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward,color: kPrimaryColor ),
                  Text(data['Surgeries'], style: new TextStyle(fontSize: 17.0),overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Current Problems',style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 19.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Problems/Complains',style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward,color: kPrimaryColor ),
                  Text(data['Problems'], style: new TextStyle(fontSize: 17.0),overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Symptoms',style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward,color: kPrimaryColor ),
                  Text(data['Symptoms'], style: new TextStyle(fontSize: 17.0),overflow: TextOverflow.clip,),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Treatment/Medications',style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward,color: kPrimaryColor ),
                  Text(data['Treatments'], style: new TextStyle(fontSize: 17.0),overflow: TextOverflow.clip,),
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
    page.graphics.drawString('Endocrinology',
        PdfStandardFont(PdfFontFamily.helvetica, 25, style: PdfFontStyle.bold));

    page.graphics.drawLine(
        PdfPen(PdfColor(0,0,0)),
        Offset(0, 40),
        Offset(page.getClientSize().width, 40));

    //common part ends


    //with heading start with (15,0,0,0)
    page.graphics.drawString('Do you have any ongoing pain problems? : $controllerPain',
        PdfStandardFont(PdfFontFamily.timesRoman, 12), bounds: const Rect.fromLTWH(15, 90, 0, 0));
    page.graphics.drawString('Location and Intensity of pain : $controllerLoc',
        PdfStandardFont(PdfFontFamily.timesRoman, 12),bounds: const Rect.fromLTWH(15, 120, 0, 0));
    page.graphics.drawString('Medications taken for pain relief: $controllerMedications',
        PdfStandardFont(PdfFontFamily.timesRoman, 12), bounds: const Rect.fromLTWH(15, 150, 0, 0));
    page.graphics.drawString('Is pain Satisfactorily controlled now? : $controllernow',
        PdfStandardFont(PdfFontFamily.timesRoman, 12), bounds: const Rect.fromLTWH(15, 180, 0, 0));
    page.graphics.drawString('What relives or intensifies your pain?: $controllerRelieves',
        PdfStandardFont(PdfFontFamily.timesRoman, 12), bounds: const Rect.fromLTWH(15, 210, 0, 0));
    page.graphics.drawString('Effects of pain on quality of life (Sleep, activity, apetite): $controllerEffects',
        PdfStandardFont(PdfFontFamily.timesRoman, 12), bounds: const Rect.fromLTWH(15, 240, 0, 0));
    page.graphics.drawString('+ Previous Surgeries : $controllerPrevious',
        PdfStandardFont(PdfFontFamily.timesRoman, 15), bounds: const Rect.fromLTWH(15, 270, 0, 0));

    //heading
    page.graphics.drawString('Current Problems',
        PdfStandardFont(PdfFontFamily.timesRoman, 15, style: PdfFontStyle.bold), bounds: const Rect.fromLTWH(0, 350, 0, 0));

    //with heading start with (15,0,0,0)
    page.graphics.drawString('1. Problems/Complains : $controllerNewProblem',
        PdfStandardFont(PdfFontFamily.timesRoman, 12), bounds: const Rect.fromLTWH(15, 400, 0, 0));
    page.graphics.drawString('2. Symptoms : $controllerSymptoms',
        PdfStandardFont(PdfFontFamily.timesRoman, 12),bounds: const Rect.fromLTWH(15, 450, 0, 0));
    page.graphics.drawString('3. Treatment/Medications : $controllerMedications',
        PdfStandardFont(PdfFontFamily.timesRoman, 12), bounds: const Rect.fromLTWH(15, 500, 0, 0));


    List<int> bytes = document.save();
    document.dispose();

    Auth().saveAndLaunchFile(bytes, 'Endocrinology.pdf');
  }

}