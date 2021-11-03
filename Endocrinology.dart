import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:medapp/constants.dart';
import 'package:medapp/display/endocrinology_display.dart';
import 'package:medapp/Global_Variables.dart' as globals;
import 'package:medapp/home/records_homepage.dart';
import '../auth_class.dart';
//import 'package:health_pile/SettingsUI.dart';

void main() {
  runApp(new MaterialApp(
    home: new Endocrinology(),
  ));
}

class Endocrinology extends StatefulWidget {
  @override
  _EndocrinologyState createState() => _EndocrinologyState();
}

class _EndocrinologyState extends State<Endocrinology> {

  var _formKey = GlobalKey<FormState>();
  String _jk1 = "";

  String Pain="";
  String PainMeds="";
  String PainControl="";
  String PainInducer="";
  String PainEffects="";
  String PastSurgery="";

  String NewProblem;
  String Symptoms;
  String Medications;

  TextEditingController controllerPain = new TextEditingController();
  TextEditingController controllerPainMeds = new TextEditingController();
  TextEditingController controllerPainControl = new TextEditingController();
  TextEditingController controllerPainInducer = new TextEditingController();
  TextEditingController controllerPainEffects = new TextEditingController();
  TextEditingController controllerPastSurgery = new TextEditingController();

  TextEditingController controllerNewProblem = new TextEditingController();
  TextEditingController controllerSymptoms = new TextEditingController();
  TextEditingController controllerMedications = new TextEditingController();

  @override
  void dispose()
  {
    controllerPain.dispose();
    controllerPainMeds.dispose();
    controllerPainControl.dispose();
    controllerPainInducer.dispose();
    controllerPainEffects.dispose();
    controllerPastSurgery.dispose();

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
              }
          )
      ),

      body: ListView(
        children: <Widget>[

          SizedBox(height: size.height * 0.04),
          Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Text("\t Pain History", style: TextStyle(fontSize: 20)),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 20.0),
              ),
              new Container(
                margin: const EdgeInsets.all(10.0),
                padding: const EdgeInsets.only(top: 10.0),
                decoration: BoxDecoration(
                    borderRadius: new BorderRadius.circular(20.0),
                    border: Border.all(
                      color: Colors.grey,
                    )),
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        " \t Do you have any ongoing pain problems?",
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Flexible(
                          fit: FlexFit.loose,
                          child: new RadioListTile(
                            title: Text("Yes"),
                            value: "Yes",
                            groupValue: _jk1,
                            onChanged: (String value) {
                              _pilihjk1(value);
                            },
                            activeColor: kPrimaryColor,
                          ),
                        ),
                        Flexible(
                          fit: FlexFit.loose,
                          child: new RadioListTile(
                            title: Text("No"),
                            value: "No",
                            groupValue: _jk1,
                            onChanged: (String value) {
                              _pilihjk1(value);
                            },
                            activeColor: kPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 10.0),
              ),
              new Container(
                margin: const EdgeInsets.all(10.0),
                //padding: const EdgeInsets.only(top: 10.0),
                decoration: BoxDecoration(
                    borderRadius: new BorderRadius.circular(20.0),
                    border: Border.all(
                      color: Colors.white,
                    )),
                child: TextFormField(
                  controller: controllerPain,
                  keyboardType: TextInputType.multiline,
                  decoration: new InputDecoration(
                      labelText: "Location and intensity of pain",
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      )),
                  onSaved: (String value) {
                    Pain = value;
                  },
                ),
              ),
            ],
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
              controller: controllerPainMeds,
              keyboardType: TextInputType.multiline,
              decoration: new InputDecoration(
                  labelText: "What Medications (if any) do you take\nfor pain relief?",
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(20.0),
                  )),
              onSaved: (String value) {
                PainMeds = value;
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
              controller: controllerPainControl,
              keyboardType: TextInputType.multiline,
              decoration: new InputDecoration(
                  labelText: "Is your pain satisfactorily controlled now?",
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(20.0),
                  )),
              onSaved: (String value) {
                PainControl= value;
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
              controller: controllerPainInducer,
              keyboardType: TextInputType.multiline,
              decoration: new InputDecoration(
                  labelText: "What relieves or intensifies your pain?",
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(20.0),
                  )),
              onSaved: (String value) {
                PainInducer= value;
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
              controller: controllerPainEffects,
              keyboardType: TextInputType.multiline,
              decoration: new InputDecoration(
                  labelText: "Effects of pain on quality of life\n(sleep, appetite, activity)",
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(20.0),
                  )),
              onSaved: (String value) {
                PainEffects= value;
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
              controller: controllerPastSurgery,
              keyboardType: TextInputType.multiline,
              decoration: new InputDecoration(
                  labelText: "Any Previous Surgeries?",
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(20.0),
                  )),
              onSaved: (String value) {
                PastSurgery= value;
              },
            ),
          ),

          new Padding(
            padding: new EdgeInsets.only(top: 40.0),
          ),

          new Container(
            margin: const EdgeInsets.all(10.0),
            padding: const EdgeInsets.only(top: 10.0),
            decoration: BoxDecoration(
                borderRadius: new BorderRadius.circular(20.0),
                border: Border.all(
                  color: Colors.white,
                )
            ),
            child: Column(children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Text("\t Current Problems", style: TextStyle(fontSize: 20)),
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
                    )
                ),
                onSaved: (String value)
                {
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
                    )
                ),
                onSaved: (String value)
                {
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
                    )
                ),
                onSaved: (String value)
                {
                  Medications = value;
                },
              ),


              /*new TextFormField(
                controller: controllerMedications,
                keyboardType: TextInputType.text,
                decoration: new InputDecoration(
                    labelText: "Upload Reports",
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(20.0),
                    )
                ),
                onSaved: (String value)
                {
                  Medications = value;
                },
              ),*/

            ],),
          ),
          new Padding(
            padding: new EdgeInsets.only(top: 40.0),
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
                  style: Theme.of(context).textTheme.button.apply(color: Colors.white, fontSizeDelta: 3.5),
                ),
                color: kPrimaryColor,
                onPressed: () {
                  print(Pain);
                  print(PainMeds);
                  print(PainControl);
                  print(PainInducer);
                  print(PainEffects);
                  print(PastSurgery);
                  print(NewProblem);
                  print(Symptoms);
                  print(Medications);

                  Auth().endocrinology(_jk1, controllerPain.text, controllerPainMeds.text, controllerPainControl.text,
                      controllerPainInducer.text, controllerPainEffects.text, controllerPastSurgery.text,
                      controllerNewProblem.text, controllerSymptoms.text, controllerMedications.text);

                  if(!globals.MyRecords.contains("Endocrinology")){
                    setState(() {
                      globals.MyRecords.add("Endocrinology");
                    });
                  }

                  String car = "Endocrinology";
                  Auth().createMyList(car);
                  print('Yo===================================${globals.MyRecords}');

                  //Navigator.of(context).pop();

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
                      new Text("Location and intensity of pain: ${controllerPain.text}"),
                      new Text("What Medications (if any) do you take for pain relief: ${controllerPainMeds.text}"),
                      new Text("Is your pain satisfactorily controlled now?: ${controllerPainControl.text}"),
                      new Text("What relieves or intensifies your pain?: ${controllerPainInducer.text}"),
                      new Text("Effects of pain on quality of life (sleep, appetite, activity): ${controllerPainEffects.text}"),
                      new Text("Any Previous surgeries: ${controllerPastSurgery.text}"),

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
  void _pilihjk1(String value)
  {
    setState(() {
      _jk1 = value;
    });
  }
}
