import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medapp/constants.dart';
import 'package:medapp/home/records_homepage.dart';
import 'package:medapp/image_upload/progress.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

import '../auth_class.dart';

class displayCardiology extends StatelessWidget {
  static const String idScreen = "display";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        //leading: new Icon(Icons.list),
        title: new Text("Cardiology"),
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
        'Cardiology').snapshots();
  }

  List specific;
  List medicalServices;
  List familyHistory;
  String controllerPastHistory;
  String controllerServiceHistory;
  String controllerFamilyHistory;
  String controllerPastSurgery;
  String controllerNewProblem;
  String controllerSymptoms;
  String controllerMedications;


 Widget buildCard(BuildContext context, DocumentSnapshot data) {
   specific = data['Diseases'];
   final List<dynamic> tags = data['Diseases'];
   medicalServices = data['Medical service'];
   final List<dynamic> tags1 = data['Medical service'];
   familyHistory = data['Family history'];
   final List<dynamic> tags2 = data['Family history'];

   controllerPastHistory= data['Past medical history'];
   controllerServiceHistory = data['Medical service others'];
   controllerFamilyHistory= data['Extra Family History'];
   controllerPastSurgery = data['Any Previous Surgeries'];
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
                 Text('Cardiology', textAlign:TextAlign.center,
                   overflow: TextOverflow.ellipsis,
                   style: TextStyle(fontSize:30.0, color: kPrimaryColor),),
                 Spacer(),
               ]),
             ),
             Padding(
               padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
               child: Row(children: <Widget>[
                 //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                 Text('Personal Cardiological History',style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.5),),
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
                 Icon(Icons.arrow_forward,color: kPrimaryColor ),
                 Text(data['Diseases'].toString(), textAlign: TextAlign.right, style: new TextStyle(fontSize: 17.0),),
                 Spacer(),
               ]),
             ),*/
             Padding(
               padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
               child: Row(children: <Widget>[
                 Icon(Icons.arrow_forward,color: kPrimaryColor ),
                 Text(data['Past medical history'], textAlign: TextAlign.right, style: new TextStyle(fontSize: 17.0),),
                 Spacer(),
               ]),
             ),
             Padding(
               padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
               child: Row(children: <Widget>[
                 //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                 Text('Past Medical Services',style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
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
                 Icon(Icons.arrow_forward,color: kPrimaryColor ),
                 Text(data['Medical service'].toString(), style: new TextStyle(fontSize: 17.0),overflow: TextOverflow.clip,),
                 Spacer(),
               ]),
             ),*/
             Padding(
               padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
               child: Row(children: <Widget>[
                 Icon(Icons.arrow_forward,color: kPrimaryColor ),
                 Text(data['Medical service others'], style: new TextStyle(fontSize: 17.0),overflow: TextOverflow.clip,),
                 Spacer(),
               ]),
             ),
             Padding(
               padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
               child: Row(children: <Widget>[
                 //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                 Text('Family History',style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
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
             ),
             /*Padding(
               padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
               child: Row(children: <Widget>[
                 Icon(Icons.arrow_forward,color: kPrimaryColor ),
                 Text(data['Family history'].toString(), style: new TextStyle(fontSize: 17.0),overflow: TextOverflow.clip,),
                 Spacer(),
               ]),
             ),*/
             Padding(
               padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
               child: Row(children: <Widget>[
                 Icon(Icons.arrow_forward,color: kPrimaryColor ),
                 Text(data['Extra Family History'], style: new TextStyle(fontSize: 17.0),overflow: TextOverflow.clip,),
                 Spacer(),
               ]),
             ),
             Padding(
               padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
               child: Row(children: <Widget>[
                 //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                 Text('Previous Surgeries',style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
                 Spacer(),
               ]),
             ),
             Padding(
               padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
               child: Row(children: <Widget>[
                 Icon(Icons.arrow_forward,color: kPrimaryColor ),
                 Text(data['Any Previous Surgeries'], style: new TextStyle(fontSize: 17.0),overflow: TextOverflow.clip,),
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
                 Text(data['Meds'], style: new TextStyle(fontSize: 17.0),overflow: TextOverflow.clip,),
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
    page.graphics.drawString('Cardiology',
        PdfStandardFont(PdfFontFamily.helvetica, 25, style: PdfFontStyle.bold));

    page.graphics.drawLine(
        PdfPen(PdfColor(0,0,0)),
        Offset(0, 40),
        Offset(page.getClientSize().width, 40));

    //common part ends

    //for checkboxes
    page.graphics.drawString('+ Personal Cardiological History - ',
        PdfStandardFont(PdfFontFamily.timesRoman, 15), bounds: const Rect.fromLTWH(0, 60, 0, 0));

    page.graphics.drawString('$specific',
        PdfStandardFont(PdfFontFamily.timesRoman, 12), bounds: Rect.fromLTWH(15, 90, 500,0),
        format: PdfStringFormat(wordWrap: PdfWordWrapType.word));

    //without heading starts with 0
    page.graphics.drawString('+ Others : $controllerPastHistory',
        PdfStandardFont(PdfFontFamily.timesRoman, 15), bounds: const Rect.fromLTWH(0, 120, 0, 0));


    page.graphics.drawString('+ Past Medical Services - ',
        PdfStandardFont(PdfFontFamily.timesRoman, 15), bounds: const Rect.fromLTWH(0, 160, 0, 0));

    page.graphics.drawString('$medicalServices',
        PdfStandardFont(PdfFontFamily.timesRoman, 12), bounds: Rect.fromLTWH(15, 190, 500,0),
        format: PdfStringFormat(wordWrap: PdfWordWrapType.word));

    page.graphics.drawString('+ Others : $controllerServiceHistory',
        PdfStandardFont(PdfFontFamily.timesRoman, 15), bounds: const Rect.fromLTWH(0, 220, 0, 0));

    page.graphics.drawString('+ Family History - ',
        PdfStandardFont(PdfFontFamily.timesRoman, 15), bounds: const Rect.fromLTWH(0, 260, 0, 0));

    page.graphics.drawString('$familyHistory',
        PdfStandardFont(PdfFontFamily.timesRoman, 12), bounds: Rect.fromLTWH(15, 290, 500,0),
        format: PdfStringFormat(wordWrap: PdfWordWrapType.word));

    page.graphics.drawString('+ Others : $controllerFamilyHistory',
        PdfStandardFont(PdfFontFamily.timesRoman, 15), bounds: const Rect.fromLTWH(0, 320, 0, 0));

    page.graphics.drawString('+ Previous Surgeries : $controllerPastSurgery',
        PdfStandardFont(PdfFontFamily.timesRoman, 15), bounds: const Rect.fromLTWH(0, 360, 0, 0));

    //heading
    page.graphics.drawString('Current Problems',
        PdfStandardFont(PdfFontFamily.timesRoman, 15, style: PdfFontStyle.bold), bounds: const Rect.fromLTWH(0, 410, 0, 0));

    //with heading start with (15,0,0,0)
    page.graphics.drawString('1. Problems/Complains : $controllerNewProblem',
        PdfStandardFont(PdfFontFamily.timesRoman, 12), bounds: const Rect.fromLTWH(15, 430, 0, 0));
    page.graphics.drawString('2. Symptoms : $controllerSymptoms',
        PdfStandardFont(PdfFontFamily.timesRoman, 12),bounds: const Rect.fromLTWH(15, 450, 0, 0));
    page.graphics.drawString('3. Treatment/Medications : $controllerMedications',
        PdfStandardFont(PdfFontFamily.timesRoman, 12), bounds: const Rect.fromLTWH(15, 470, 0, 0));


    List<int> bytes = document.save();
    document.dispose();

    Auth().saveAndLaunchFile(bytes, 'Cardiology.pdf');
  }

}