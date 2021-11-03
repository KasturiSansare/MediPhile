import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:medapp/auth_class.dart';
import 'package:medapp/constants.dart';
import 'package:medapp/Global_Variables.dart' as globals;
import 'package:medapp/home/records_homepage.dart';
//import '../dentistry_display.dart';

class Dentistry extends StatefulWidget {
  @override
  _DentistryState createState() => _DentistryState();
}

class _DentistryState extends State<Dentistry> {
  String _jk="";
  String _jk1="";
  String brush="";
  String floss="";
  String prob="";
  String PS="";

  TextEditingController controllerBrush = new TextEditingController();
  TextEditingController controllerFloss = new TextEditingController();
  TextEditingController controllerPrev = new TextEditingController();
  TextEditingController controllerSurgery = new TextEditingController();


  @override
  void dispose()
  {
    controllerBrush.dispose();
    controllerFloss.dispose();
    controllerPrev.dispose();
    controllerSurgery.dispose();
  }


  @override
  Widget build(BuildContext context) {

    //controllerBrush.text = '3';
    var size = MediaQuery
        .of(context)
        .size;
    return new Scaffold(
        appBar: new AppBar(
          //leading: new Icon(Icons.list),
            title: new Text("Dentistry"),
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
                padding: new EdgeInsets.only(top: 10.0),
              ),
              new Container(
                  margin: const EdgeInsets.all(10.0),
                  padding: const EdgeInsets.only(top: 10.0),
                  decoration: BoxDecoration(
                      borderRadius: new BorderRadius.circular(20.0),
                      border: Border.all(
                        color: Colors.grey,
                      )),
                  child: new Column(children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "  \t Have you ever had any gum treatment?",
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ),
                    new RadioListTile(
                      title: Text("Yes"),
                      value: "Yes",
                      groupValue: _jk,
                      onChanged: (String value) {
                        _pilihjk(value);
                      },
                      activeColor: kPrimaryColor,
                    ),
                    new RadioListTile(
                      title: Text("No"),
                      value: "No",
                      groupValue: _jk,
                      onChanged: (String value) {
                        _pilihjk(value);
                      },
                      activeColor: kPrimaryColor,
                    ),
                  ])),

              new Padding(
                padding: new EdgeInsets.only(top: 10.0),
              ),
              new Container(
                  margin: const EdgeInsets.all(10.0),
                  padding: const EdgeInsets.only(top: 10.0),
                  decoration: BoxDecoration(
                      borderRadius: new BorderRadius.circular(20.0),
                      border: Border.all(
                        color: Colors.grey,
                      )),
                  child: new Column(children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "\t Do your Gums Bleed?",
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ),
                    new RadioListTile(
                      title: Text("Yes"),
                      value: "Yes",
                      groupValue: _jk1,
                      onChanged: (String value) {
                        _pilihjk1(value);
                      },
                      activeColor: kPrimaryColor,
                    ),
                    new RadioListTile(
                      title: Text("No"),
                      value: "No",
                      groupValue: _jk1,
                      onChanged: (String value) {
                        _pilihjk1(value);
                      },
                      activeColor: kPrimaryColor,
                    ),
                  ])),

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
                  controller: controllerBrush,

                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                      labelText: "How many times a day do you Brush?",
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      )),
                  onSaved: (String value) {
                    brush= value;
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
                  controller: controllerFloss,
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                      labelText: "How many times a week do you Floss?",
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      )),

                  onSaved: (val) => setState(() => floss = val),
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
                  controller: controllerPrev,
                  keyboardType: TextInputType.multiline,
                  decoration: new InputDecoration(
                      labelText: "Had any serious problem with any previous"
                          "\n dental work?",
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      )),
                  onSaved: (String value) {
                    prob= value;
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
                  controller: controllerSurgery,
                  keyboardType: TextInputType.multiline,
                  decoration: new InputDecoration(
                      labelText: "Any previous surgeries?",
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      )),
                  onSaved: (String value) {
                    PS= value;
                  },
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

                      Auth().dentistry(_jk, _jk1, controllerBrush.text, controllerFloss.text, controllerPrev.text, controllerSurgery.text);


                      if(!globals.MyRecords.contains("Dentistry")){
                        setState(() {
                          globals.MyRecords.add("Dentistry");
                        });
                      }

                      String car = "Dentistry";
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
                          new Text("Brush: ${controllerBrush.value}"),
                          new Text("Floss ${controllerFloss.value}"),
                          new Text("Previous dental work: ${controllerPrev.text}"),
                          new Text("Any Previous surgeries: ${controllerSurgery.text}"),

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
  void _pilihjk(String value) {
    //insurance
    setState(() {
      _jk = value;
    });
  }

  void _pilihjk1(String value) {
    //insurance
    setState(() {
      _jk1 = value;
    });
  
  }
}
