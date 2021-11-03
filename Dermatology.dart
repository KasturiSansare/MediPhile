import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:medapp/constants.dart';
import 'package:medapp/display/dermatology_display.dart';
import 'package:medapp/Global_Variables.dart' as globals;
import 'package:medapp/home/records_homepage.dart';
import '../auth_class.dart';

class Dermatology extends StatefulWidget {
  @override
  _DermatologyState createState() => _DermatologyState();
}

class _DermatologyState extends State<Dermatology> {

  String PMH="";
  String MSH="";
  String FH="";
  String PS="";
  String NewProblem="";
  String Symptoms="";
  String Medications="";

  TextEditingController controllermedical = new TextEditingController();
  TextEditingController controllerskin = new TextEditingController();
  TextEditingController controllermedication = new TextEditingController();
  TextEditingController controllerprevious = new TextEditingController();
  TextEditingController controllerwater = new TextEditingController();
  TextEditingController controllerNewProblem = new TextEditingController();
  TextEditingController controllerSymptoms = new TextEditingController();
  TextEditingController controllerMedications = new TextEditingController();

  @override
  void dispose()
  {
    controllerprevious.dispose();
    controllermedication.dispose();
    controllerskin.dispose();
    controllermedical.dispose();
    controllerwater.dispose();
    controllerNewProblem.dispose();
    controllerSymptoms.dispose();
    controllerMedications.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return new Scaffold(
      appBar: new AppBar(
        //leading: new Icon(Icons.list),
          title: new Text("Dermatology"),
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
              }
          )
      ),
      body: ListView(
        children: <Widget>[

          new Padding(
            padding: new EdgeInsets.only(top: 30.0),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            //padding: const EdgeInsets.only(top: 10.0),
            decoration: BoxDecoration(
                borderRadius: new BorderRadius.circular(20.0),
                border: Border.all(
                  color: Colors.white,
                )),
            child: TextFormField(
              controller: controllerprevious,
              keyboardType: TextInputType.multiline,
              decoration: new InputDecoration(
                  labelText: "Any Medical History?",
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(20.0),
                  )),
              onSaved: (String value) {
                PMH = value;
              },
            ),
          ),

          new Padding(
            padding: new EdgeInsets.only(top: 10.0),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            //padding: const EdgeInsets.only(top: 10.0),
            decoration: BoxDecoration(
                borderRadius: new BorderRadius.circular(20.0),
                border: Border.all(
                  color: Colors.white,
                )),
            child: TextFormField(
              controller: controllerskin,
              keyboardType: TextInputType.multiline,
              decoration: new InputDecoration(
                  labelText: "Any previous skin disease?",
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(20.0),
                  )),
              onSaved: (String value) {
                MSH = value;
              },
            ),
          ),

          new Padding(
            padding: new EdgeInsets.only(top: 10.0),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            //padding: const EdgeInsets.only(top: 10.0),
            decoration: BoxDecoration(
                borderRadius: new BorderRadius.circular(20.0),
                border: Border.all(
                  color: Colors.white,
                )),
            child: TextFormField(
              controller: controllermedication,
              keyboardType: TextInputType.multiline,
              decoration: new InputDecoration(
                  labelText: "Current Disease and Medications",
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(20.0),
                  )),
              onSaved: (String value) {
                FH= value;
              },
            ),
          ),

          new Padding(
            padding: new EdgeInsets.only(top: 10.0),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            //padding: const EdgeInsets.only(top: 10.0),
            decoration: BoxDecoration(
                borderRadius: new BorderRadius.circular(20.0),
                border: Border.all(
                  color: Colors.white,
                )),
            child: TextFormField(
              controller: controllerwater,
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(
                  labelText: "Number of glasses of water per day",
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(20.0),
                  )),
              onSaved: (String value) {
                PS= value;
              },
            ),
          ),

          new Padding(
            padding: new EdgeInsets.only(top: 10.0),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            //padding: const EdgeInsets.only(top: 10.0),
            decoration: BoxDecoration(
                borderRadius: new BorderRadius.circular(20.0),
                border: Border.all(
                  color: Colors.white,
                )),
            child: TextFormField(
              controller: controllerprevious,
              keyboardType: TextInputType.multiline,
              decoration: new InputDecoration(
                  labelText: "Any previous skin surgeries?",
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(20.0),
                  )),
              onSaved: (String value) {
                PS= value;
              },
            ),
          ),

          new Container(
            margin: const EdgeInsets.all(10.0),
            padding: const EdgeInsets.only(top: 10.0),
            decoration: BoxDecoration(
                borderRadius: new BorderRadius.circular(20.0),
                border: Border.all(
                  color: Colors.white,
                )),
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Text("\t Current Problems",
                      style: TextStyle(fontSize: 20)),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 20.0),
                ),
                new TextFormField(
                  controller: controllerNewProblem,
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(
                      labelText: "Problems/Complains",
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      )),
                  onSaved: (String value) {
                    NewProblem = value;
                  },
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 10.0),
                ),
                new TextFormField(
                  controller: controllerSymptoms,
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(
                      labelText: "Symptoms",
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      )),
                  onSaved: (String value) {
                    Symptoms = value;
                  },
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 10.0),
                ),
                new TextFormField(
                  controller: controllerMedications,
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(
                      labelText: "Treatment/Medications",
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      )),
                  onSaved: (String value) {
                    Medications = value;
                  },
                ),
              ],
            ),
          ),

          new Padding(
            padding: new EdgeInsets.only(top: 50.0),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            padding: const EdgeInsets.only(top: 10.0),
            decoration: BoxDecoration(
                borderRadius: new BorderRadius.circular(20.0),
                border: Border.all(
                  color: Colors.white,
                )),
            child: ConstrainedBox(
              constraints: new BoxConstraints(
                minHeight: 60.0,
                minWidth: 335.0,
              ),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: BorderSide(color: kPrimaryColor)),
                child: new Text(
                  "SAVE",
                  style: Theme.of(context)
                      .textTheme
                      .button
                      .apply(color: Colors.white, fontSizeDelta: 3.5),
                ),
                color: kPrimaryColor,
                onPressed: () {
                  print(PMH);
                  print(PS);
                  print(FH);
                  print(MSH);

                  Auth().dermatology(controllermedical.text, controllerskin.text, controllermedication.text, controllerprevious.text,controllerwater.text
                  ,controllerNewProblem.text, controllerSymptoms.text, controllerMedications.text);

                  if(!globals.MyRecords.contains("Dermatology")){
                    setState(() {
                      globals.MyRecords.add("Dermatology");
                    });
                  }

                  //Navigator.of(context).pop();

                  String car = "Dermatology";
                  Auth().createMyList(car);
                  print('Yo===================================${globals.MyRecords}');

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return HomePageRecords();
                      },
                    ),
                  );

                  new Column(
                    children: <Widget>[
                      new Text("Past skin History: ${controllermedical.text}"),
                      new Text("Current Skin Disease: ${controllerskin.text}"),
                      new Text("Medications : ${controllermedication.text}"),
                      new Text("Any Previous skin surgeries: ${controllerprevious.text}"),
                      new Text("glasses of water: ${controllerwater.value}"),
                      new Text("Problems/Complains: ${controllerNewProblem.value}"),
                      new Text("Symptoms: ${controllerSymptoms.value}"),
                      new Text("Treatment/Medications: ${controllerMedications.value}"),

                    ],
                  );
                },
              ),
            ),
          ),
          new Padding(
            padding: new EdgeInsets.only(top: 30.0),
          )

        ],
      ),

    );
  }
}
