import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:medapp/constants.dart';
import 'package:medapp/display/nephrology_display.dart';
import 'package:medapp/Global_Variables.dart' as globals;
import 'package:medapp/home/records_homepage.dart';
import '../auth_class.dart';
//import 'package:health_pile/SettingsUI.dart';

void main() {
  runApp(new MaterialApp(
    home: new Nephrology(),
  ));
}

class Nephrology extends StatefulWidget {
  @override
  _NephrologyState createState() => _NephrologyState();
}

class _NephrologyState extends State<Nephrology> {

  String Surgeries;
  final _formKey = GlobalKey<FormState>();

  String NewProblem;
  String Symptoms;
  String Medications;

  TextEditingController controllerSurgeries = new TextEditingController();

  TextEditingController controllerNewProblem = new TextEditingController();
  TextEditingController controllerSymptoms = new TextEditingController();
  TextEditingController controllerMedications = new TextEditingController();

  @override
  void dispose()
  {
    controllerSurgeries.dispose();

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
    //Size size = MediaQuery.of(context).size;
    return new Scaffold(
        appBar: new AppBar(
          //leading: new Icon(Icons.list),
            title: new Text("Nephrology"),
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
              new Container(
                  padding: new EdgeInsets.all(10.0),
                  child: new Column(children: <Widget>[
                    new Form(
                      key: _formKey,
                      child: new Column(
                          children:<Widget>[
                            new TextFormField(
                              controller: controllerSurgeries,
                              decoration: new InputDecoration(
                                  labelText: "Any previous surgeries?",
                                  //errorText: isValidate ? 'Required': null ,
                                  border: new OutlineInputBorder(
                                    borderRadius: new BorderRadius.circular(20.0),
                                  )
                              ),
                              onSaved: (String value) {
                                Surgeries = value;
                              },
                            ),
                          ]
                      ),
                    ),
                  ]
                  )
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

              new Container(
                margin: const EdgeInsets.all(10.0),
                padding: const EdgeInsets.only(top: 10.0),
                decoration: BoxDecoration(
                    borderRadius: new BorderRadius.circular(20.0),
                    border: Border.all(
                      color: Colors.white,
                    )
                ),
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
                      print(Surgeries);
                      print(NewProblem);
                      print(Symptoms);
                      print(Medications);

                      Auth().nephrology( controllerSurgeries.text, controllerNewProblem.text,
                          controllerSymptoms.text, controllerMedications.text);

                      if(!globals.MyRecords.contains("Nephrology")){
                        setState(() {
                          globals.MyRecords.add("Nephrology");
                        });
                      }

                      String car = "Nephrology";
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
                          new Text("Previous Surgeries: ${controllerSurgeries.text}"),

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

            ]
        )
    );
  }
}
