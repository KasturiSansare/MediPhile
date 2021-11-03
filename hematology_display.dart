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
import 'package:medapp/home/records_homepage.dart';
import 'package:medapp/image_upload/progress.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class displayHematology extends StatelessWidget {
  static const String idScreen = "display";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        //leading: new Icon(Icons.list),
        title: new Text("Hematology"),
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
        'Hematology').snapshots();
  }

  String controllerSurgery;
  String controllerNewProblem;
  String controllerSymptoms;
  String controllerMedications ;

 Widget buildCard(BuildContext context, DocumentSnapshot data)
 {

   controllerSurgery= data['Surgery'];
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
                 Text('Hematology', textAlign:TextAlign.center,
                   overflow: TextOverflow.ellipsis,
                   style: TextStyle(fontSize:30.0, color: kPrimaryColor),),
                 Spacer(),
               ]),
             ),
             Padding(
               padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
               child: Row(children: <Widget>[
                 //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                 Text('Any previous surgeries?',style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.5),),
                 Spacer(),
               ]),
             ),
             Padding(
               padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
               child: Row(children: <Widget>[
                 Icon(Icons.arrow_forward,color: kPrimaryColor ),
                 Text(data['Surgery'], textAlign: TextAlign.right, style: new TextStyle(fontSize: 17.0),),
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
                 Text(data['Medication'], style: new TextStyle(fontSize: 17.0),overflow: TextOverflow.clip,),
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
    page.graphics.drawString('Hematology',
        PdfStandardFont(PdfFontFamily.helvetica, 25, style: PdfFontStyle.bold));

    page.graphics.drawLine(
        PdfPen(PdfColor(0,0,0)),
        Offset(0, 40),
        Offset(page.getClientSize().width, 40));

    //common part ends

    //for checkboxes
    page.graphics.drawString('+ Any previous surgeries? - ',
        PdfStandardFont(PdfFontFamily.timesRoman, 15), bounds: const Rect.fromLTWH(0, 60, 0, 0));

    page.graphics.drawString('$controllerSurgery',
        PdfStandardFont(PdfFontFamily.timesRoman, 12), bounds: Rect.fromLTWH(15, 90, 500,0),
        format: PdfStringFormat(wordWrap: PdfWordWrapType.word));

    //heading
    page.graphics.drawString('Current Problems',
        PdfStandardFont(PdfFontFamily.timesRoman, 15, style: PdfFontStyle.bold), bounds: const Rect.fromLTWH(0, 140, 0, 0));

    //with heading start with (15,0,0,0)
    page.graphics.drawString('1. Problems/Complains : $controllerNewProblem',
        PdfStandardFont(PdfFontFamily.timesRoman, 12), bounds: const Rect.fromLTWH(15, 160, 0, 0));
    page.graphics.drawString('2. Symptoms : $controllerSymptoms',
        PdfStandardFont(PdfFontFamily.timesRoman, 12),bounds: const Rect.fromLTWH(15, 180, 0, 0));
    page.graphics.drawString('3. Treatment/Medications : $controllerMedications',
        PdfStandardFont(PdfFontFamily.timesRoman, 12), bounds: const Rect.fromLTWH(15, 200, 0, 0));


    List<int> bytes = document.save();
    document.dispose();

    Auth().saveAndLaunchFile(bytes, 'Hematology.pdf');
  }

}