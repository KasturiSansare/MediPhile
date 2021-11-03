import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medapp/constants.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;


class pdfAllergology extends StatelessWidget{
  static const String idScreen = "display";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
          stream: getUsersStreamSnapshots(context),
          builder: (context, snapshot) {
            if(!snapshot.hasData) return const Text("Loading...", );
            return new ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (BuildContext context, int index) =>
                    buildCard(context, snapshot.data.documents[index]));
          }
      ),
    );
    //writeOnPdf();
  }

  Stream<QuerySnapshot> getUsersStreamSnapshots(BuildContext context) async* {
    final uid = await FirebaseAuth.instance.currentUser();
    yield* Firestore.instance.collection('Users').document(uid.uid).collection('Allergology').snapshots();
  }

  final pdf = pw.Document();


  writeOnPdf() {
    pdf.addPage(pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      margin: pw.EdgeInsets.all(32),
      // ignore: missing_return
      build: (pw.Context context) {
        return <pw.Widget>[
          pw.Header(
              level: 0,
              child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: <pw.Widget>[
                    pw.Text('Allergology', textScaleFactor: 2),
                  ])),
          pw.Header(level: 1, text: 'Specific family history', ),


          /*Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 30.0),
                      child: Row(children: <Widget>[
                        Text('Allergology', textAlign:TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize:30.0, color: kPrimaryColor),),
                        IconButton(
                          icon: Icon(Icons.share_outlined,
                            color: kPrimaryColor, ),
                          onPressed: () async{
                            writeOnPdf();
                            await savePdf();

                            Directory documentDirectory =
                            await getApplicationDocumentsDirectory();

                            String documentPath = documentDirectory.path;

                            String fullPath = "$documentPath/example.pdf";
                            print(fullPath);

                          },
                        ),
                        Spacer(),
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Row(children: <Widget>[
                        //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                        Text('Specific family history',style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.5),),
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
                    *//*Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_forward,color: kPrimaryColor ),
                  Text(data['Family history'].toString(), textAlign: TextAlign.right, style: new TextStyle(fontSize: 17.0),),
                  Spacer(),
                ]),
              ),*//*
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Row(children: <Widget>[
                        //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                        Text('Surgeries',style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
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
                        Text(data['Meds'], style: new TextStyle(fontSize: 17.0),overflow: TextOverflow.clip,),
                        Spacer(),
                      ]),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 30.0),
                      child: Row(children: <Widget>[
                        RaisedButton(
                          color: Colors.blueGrey,
                          child: Text(
                            'Preview PDF',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white),
                          ),
                          onPressed: () async {
                            writeOnPdf();
                            await savePdf();

                            Directory documentDirectory =
                            await getApplicationDocumentsDirectory();

                            String documentPath = documentDirectory.path;

                            String fullPath = "$documentPath/ex.pdf";
                            print(fullPath);

                            *//* Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>// PdfPreviewScreen(
                            path: fullPath,
                          )));*//*
                          },
                        ),
                        Spacer(),
                      ]),
                    ),

                  ],
                ),
              ),
            );*/

          // Write All the paragraph in one line.
          // For clear understanding
          // here there are line breaks.
          pw.Paragraph(
              text:'hola'),
          //'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nunc mi ipsum faucibus');
          pw.Paragraph(
              text:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod'),
          pw.Header(level: 1, text: 'This is Header'),
          pw.Paragraph(
              text:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod'),
          pw.Paragraph(
              text:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod'),
          pw.Padding(padding: const pw.EdgeInsets.all(10)),
          pw.Table.fromTextArray(context: context, data: const <List<String>>[
            <String>['Year', 'Sample'],
            <String>['SN0', 'GFG1'],
            <String>['SN1', 'GFG2'],
            <String>['SN2', 'GFG3'],
            <String>['SN3', 'GFG4'],
          ]),
        ];
      },
    ));

  }

  Future savePdf() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String documentPath = documentDirectory.path;
    File file = File("$documentPath/example.pdf");
    file.writeAsBytesSync(pdf.save());
  }

  Widget buildCard(BuildContext context, DocumentSnapshot data) {
    final List<dynamic> tags = data['Family history'];

    writeOnPdf();
    savePdf();

    /*Future savePdf() async {
      Directory documentDirectory = await getApplicationDocumentsDirectory();
      String documentPath = documentDirectory.path;
      File file = File("$documentPath/allergology.pdf");
      file.writeAsBytesSync(pdf.save());
    }

    @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Scaffold(
        appBar: AppBar(
          title: Text("Allergology"),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              SizedBox(
                width: double.infinity,
                child: RaisedButton(
                  color: Colors.blueGrey,
                  child: Text(
                    'Preview PDF',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white),
                  ),
                  onPressed: () async {
                    writeOnPdf();
                    await savePdf();

                    Directory documentDirectory =
                    await getApplicationDocumentsDirectory();

                    String documentPath = documentDirectory.path;

                    String fullPath = "$documentPath/allergology.pdf";
                    print(fullPath);

                    *//* Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>// PdfPreviewScreen(
                            path: fullPath,
                          )));*//*
                  },
                ),
              ),
            ],
          ),
        ),
      );
    }*/

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
                  Text('Allergology', textAlign:TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize:30.0, color: kPrimaryColor),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Specific family history',style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.5),),
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
                  Text(data['Family history'].toString(), textAlign: TextAlign.right, style: new TextStyle(fontSize: 17.0),),
                  Spacer(),
                ]),
              ),*/
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  //Icon(Icons.arrow_forward_rounded,color: kPrimaryColor ),
                  Text('Surgeries',style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
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

}