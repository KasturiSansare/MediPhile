import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:medapp/auth_class.dart';
import 'package:medapp/constants.dart';
import 'package:medapp/display/gynecology_display.dart';
import 'package:medapp/notification_setting.dart';
import 'package:medapp/Global_Variables.dart' as globals;
import 'package:medapp/home/records_homepage.dart';

class Gynecology extends StatefulWidget {
  @override
  _GynecologyState createState() => _GynecologyState();
}

class _GynecologyState extends State<Gynecology> {

  String _jk1 = "";
  String _jk2 = "";
  String _jk3 = "";
  String _jk4 = "";
  String _jk5 = "";
  String _jk6 = "";

  var history=[];

  final notifications=[
    NotificationSetting(title: 'Abnormal Pap Smears', val:'Abnormal Pap Smears'),
    NotificationSetting(title: 'STDs', val: 'STDs'),
    NotificationSetting(title: 'Fibroids', val: 'Fibroids'),
    NotificationSetting(title: 'Endometriosis', val: 'Endometriosis'),
    NotificationSetting(title: 'Infertility', val: 'Infertility'),
    NotificationSetting(title: 'Urinary incontinence', val:'Urinary incontinence'),
    NotificationSetting(title: 'None', val: 'None'),

  ];


  String AgeFMP = "";
  String BleedingDays = "";
  String TamponsNo = "";
  String AgeLMP = "";

  String CurrentBC = "";
  String PastBC = "";
  String BCUseLength = "";
  String BCReason = "";

  String PapSmear = "";
  String Mammogram = "";
  String BoneDensity = "";
  String Colonoscopy = "";

  String Pregnancy = "";
  String VaginalBirth = "";
  String Ectopics = "";
  String Abortions = "";
  String LiveChildren = "";
  String CSection = "";
  String Miscarriages = "";

  String PastSurgery = "";

  String NewProblem;
  String Symptoms;
  String Medications;


  TextEditingController controllerAgeFMP = new TextEditingController();
  TextEditingController controllerBleedingDays = new TextEditingController();
  TextEditingController controllerTamponsNo = new TextEditingController();
  TextEditingController controllerAgeLMP = new TextEditingController();

  TextEditingController controllerCurrentBC = new TextEditingController();
  TextEditingController controllerPastBC = new TextEditingController();
  TextEditingController controllerBCUseLength = new TextEditingController();
  TextEditingController controllerBCReason = new TextEditingController();

  TextEditingController controllerPapSmear = new TextEditingController();
  TextEditingController controllerMammogram = new TextEditingController();
  TextEditingController controllerBoneDensity = new TextEditingController();
  TextEditingController controllerColonoscopy = new TextEditingController();

  TextEditingController controllerPregnancy = new TextEditingController();
  TextEditingController controllerVaginalBirth = new TextEditingController();
  TextEditingController controllerEctopics = new TextEditingController();
  TextEditingController controllerAbortions = new TextEditingController();
  TextEditingController controllerLiveChildren = new TextEditingController();
  TextEditingController controllerCSection = new TextEditingController();
  TextEditingController controllerMiscarriages = new TextEditingController();

  TextEditingController controllerPastSurgery = new TextEditingController();

  TextEditingController controllerNewProblem = new TextEditingController();
  TextEditingController controllerSymptoms = new TextEditingController();
  TextEditingController controllerMedications = new TextEditingController();

  @override
  void dispose() {
    controllerAgeFMP.dispose();
    controllerBleedingDays.dispose();
    controllerTamponsNo.dispose();
    controllerAgeLMP.dispose();

    controllerCurrentBC.dispose();
    controllerPastBC.dispose();
    controllerBCUseLength.dispose();
    controllerBleedingDays.dispose();
    controllerBCReason.dispose();

    controllerPapSmear.dispose();
    controllerMammogram.dispose();
    controllerBoneDensity.dispose();
    controllerColonoscopy.dispose();

    controllerPregnancy.dispose();
    controllerVaginalBirth.dispose();
    controllerEctopics.dispose();
    controllerAbortions.dispose();
    controllerLiveChildren.dispose();
    controllerCSection.dispose();
    controllerMiscarriages.dispose();

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
              }
          )
      ),

      body: ListView(
        children: <Widget>[
          SizedBox(height: size.height * 0.04),
          new Container(
            margin: const EdgeInsets.all(10.0),
            padding: const EdgeInsets.only(top: 10.0),
            decoration: BoxDecoration(
                borderRadius: new BorderRadius.circular(20.0),
                border: Border.all(
                  color: Colors.white,
                )
            ),
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Text("\t Menstrual History", style: TextStyle(fontSize: 20)),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 20.0),
                ),
                new TextFormField(
                  controller: controllerAgeFMP,
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                      labelText: "Age at first menstrual period",
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      )
                  ),
                  onSaved: (String value)
                  {
                    AgeFMP = value;
                  },
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 10.0),
                ),
                new TextFormField(
                  controller: controllerBleedingDays,
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                      labelText: "Number of days you bleed",
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      )
                  ),
                  onSaved: (String value)
                  {
                    BleedingDays = value;
                  },
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 20.0),
                ),

                new Container(
                  //margin: const EdgeInsets.all(10.0),
                  padding: const EdgeInsets.only(top: 10.0),
                  decoration: BoxDecoration(
                      borderRadius: new BorderRadius.circular(20.0),
                      border: Border.all(
                        color: Colors.grey,
                      )
                  ),
                  child: new Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "\t Describe the amount of menstrual flow\n\t (select one)",
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
                              title: Text("Light"),
                              value: "Light",
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
                              title: Text("Moderate"),
                              value: "Moderate",
                              groupValue: _jk1,
                              onChanged: (String value) {
                                _pilihjk1(value);
                              },
                              activeColor: kPrimaryColor,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Flexible(
                            fit: FlexFit.loose,
                            child: new RadioListTile(
                              title: Text("Heavy"),
                              value: "Heavy",
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
                              title: Text("Clots"),
                              value: "Clots",
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
                  padding: new EdgeInsets.only(top: 20.0),
                ),
                new TextFormField(
                  controller: controllerTamponsNo,
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                      labelText: "How many tampons or pads do you use on \n your heaviest day?",
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      )
                  ),
                  onSaved: (String value)
                  {
                    TamponsNo = value;
                  },
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 20.0),
                ),

                new Container(
                  //margin: const EdgeInsets.all(10.0),
                  padding: const EdgeInsets.only(top: 10.0),
                  decoration: BoxDecoration(
                      borderRadius: new BorderRadius.circular(20.0),
                      border: Border.all(
                        color: Colors.grey,
                      )
                  ),
                  child: new Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "\t Describe the amount of menstrual discomfort (select one)",
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
                              title: Text("None"),
                              value: "None",
                              groupValue: _jk2,
                              onChanged: (String value) {
                                _pilihjk2(value);
                              },
                              activeColor: kPrimaryColor,
                            ),
                          ),

                          Flexible(
                            fit: FlexFit.loose,
                            child: new RadioListTile(
                              title: Text("Mild"),
                              value: "Mild",
                              groupValue: _jk2,
                              onChanged: (String value) {
                                _pilihjk2(value);
                              },
                              activeColor: kPrimaryColor,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Flexible(
                            fit: FlexFit.loose,
                            child: new RadioListTile(
                              title: Text("Moderate"),
                              value: "Moderate",
                              groupValue: _jk2,
                              onChanged: (String value) {
                                _pilihjk2(value);
                              },
                              activeColor: kPrimaryColor,
                            ),
                          ),

                          Flexible(
                            fit: FlexFit.loose,
                            child: new RadioListTile(
                              title: Text("Severe"),
                              value: "Severe",
                              groupValue: _jk2,
                              onChanged: (String value) {
                                _pilihjk2(value);
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
                  padding: new EdgeInsets.only(top: 20.0),
                ),

                new Container(
                  //margin: const EdgeInsets.all(10.0),
                  padding: const EdgeInsets.only(top: 10.0),
                  decoration: BoxDecoration(
                      borderRadius: new BorderRadius.circular(20.0),
                      border: Border.all(
                        color: Colors.grey,
                      )
                  ),
                  child: new Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "\t Do you bleed in between your periods?",
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
                              groupValue: _jk3,
                              onChanged: (String value) {
                                _pilihjk3(value);
                              },
                              activeColor: kPrimaryColor,
                            ),
                          ),

                          Flexible(
                            fit: FlexFit.loose,
                            child: new RadioListTile(
                              title: Text("No"),
                              value: "No",
                              groupValue: _jk3,
                              onChanged: (String value) {
                                _pilihjk3(value);
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
                  padding: new EdgeInsets.only(top: 20.0),
                ),

                new TextFormField(
                  controller: controllerAgeLMP,
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                      labelText: "If you stopped menstruating, at\nwhat age did you stop?",
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      )
                  ),
                  onSaved: (String value)
                  {
                    AgeLMP = value;
                  },
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 20.0),
                ),

                new Container(
                  //margin: const EdgeInsets.all(10.0),
                  padding: const EdgeInsets.only(top: 10.0),
                  decoration: BoxDecoration(
                      borderRadius: new BorderRadius.circular(20.0),
                      border: Border.all(
                        color: Colors.grey,
                      )
                  ),
                  child: new Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "\t Have you had bleeding or spotting since your periods stopped?",
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
                              groupValue: _jk4,
                              onChanged: (String value) {
                                _pilihjk4(value);
                              },
                              activeColor: kPrimaryColor,
                            ),
                          ),

                          Flexible(
                            fit: FlexFit.loose,
                            child: new RadioListTile(
                              title: Text("No"),
                              value: "No",
                              groupValue: _jk4,
                              onChanged: (String value) {
                                _pilihjk4(value);
                              },
                              activeColor: kPrimaryColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

              ],
            ),
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
                  color: Colors.white,
                )
            ),
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Text("\t Contraceptive History", style: TextStyle(fontSize: 20)),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 20.0),
                ),
                new TextFormField(
                  controller: controllerCurrentBC,
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(
                      labelText: "Present birth control method",
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      )
                  ),
                  onSaved: (String value)
                  {
                    CurrentBC = value;
                  },
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 10.0),
                ),
                new TextFormField(
                  controller: controllerPastBC,
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(
                      labelText: "Birth control methods used in the past",
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      )
                  ),
                  onSaved: (String value)
                  {
                    PastBC = value;
                  },
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 10.0),
                ),
                new TextFormField(
                  controller: controllerBCUseLength,
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(
                      labelText: "Length of use",
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      )
                  ),
                  onSaved: (String value)
                  {
                    BCUseLength = value;
                  },
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 10.0),
                ),
                new TextFormField(
                  controller: controllerBCReason,
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(
                      labelText: "Reason for Discontinuation",
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      )
                  ),
                  onSaved: (String value)
                  {
                    BCReason = value;
                  },
                ),
              ],
            ),
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
                  color: Colors.white,
                )
            ),
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Text("\t Gynecological History", style: TextStyle(fontSize: 20)),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 20.0),
                ),
                new Container(
                  //margin: const EdgeInsets.all(10.0),
                  padding: const EdgeInsets.only(top: 10.0),
                  decoration: BoxDecoration(
                      borderRadius: new BorderRadius.circular(20.0),
                      border: Border.all(
                        color: Colors.grey,
                      )
                  ),
                  child: new Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "\t Have you been vaccinated for Human Papilloma Virus (HPV) – Gardasil",
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
                              groupValue: _jk5,
                              onChanged: (String value) {
                                _pilihjk5(value);
                              },
                              activeColor: kPrimaryColor,
                            ),
                          ),

                          Flexible(
                            fit: FlexFit.loose,
                            child: new RadioListTile(
                              title: Text("No"),
                              value: "No",
                              groupValue: _jk5,
                              onChanged: (String value) {
                                _pilihjk5(value);
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

                new TextFormField(
                  controller: controllerPapSmear,
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(
                      labelText: "Last Pap Smear",
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      )
                  ),
                  onSaved: (String value)
                  {
                    PapSmear = value;
                  },
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 10.0),
                ),
                new TextFormField(
                  controller: controllerMammogram,
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(
                      labelText: "Last Mammogram",
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      )
                  ),
                  onSaved: (String value)
                  {
                    Mammogram = value;
                  },
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 10.0),
                ),
                new TextFormField(
                  controller: controllerBoneDensity,
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(
                      labelText: "Last Bone Density (DEXA)",
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      )
                  ),
                  onSaved: (String value)
                  {
                    BoneDensity = value;
                  },
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 10.0),
                ),
                new TextFormField(
                  controller: controllerColonoscopy,
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(
                      labelText: "Last Colonoscopy",
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      )
                  ),
                  onSaved: (String value)
                  {
                    Colonoscopy = value;
                  },
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 10.0),
                ),

                new Container(
                  //margin: const EdgeInsets.all(10.0),
                  padding: const EdgeInsets.only(top: 10.0),
                  decoration: BoxDecoration(
                      borderRadius: new BorderRadius.circular(20.0),
                      border: Border.all(
                        color: Colors.grey,
                      )
                  ),
                  child: new Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "\t Have you ever been on hormone therapy (estrogen / progesterone)?",
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
                              groupValue: _jk6,
                              onChanged: (String value) {
                                _pilihjk6(value);
                              },
                              activeColor: kPrimaryColor,
                            ),
                          ),

                          Flexible(
                            fit: FlexFit.loose,
                            child: new RadioListTile(
                              title: Text("No"),
                              value: "No",
                              groupValue: _jk6,
                              onChanged: (String value) {
                                _pilihjk6(value);
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
                  //margin: const EdgeInsets.all(10.0),
                  padding: const EdgeInsets.only(top: 10.0),
                  decoration: BoxDecoration(
                      borderRadius: new BorderRadius.circular(20.0),
                      border: Border.all(
                        color: Colors.grey,
                      )
                  ),
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text("\t Any Personal History of", style: TextStyle(fontSize: 17)),
                      ),
                      Divider(),
                      ...notifications.map(buildSingleCheckbox).toList(),
                    ],
                  ),
                ),

              ],
            ),
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
                  color: Colors.white,
                )
            ),
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Text("\t Obstetrical History", style: TextStyle(fontSize: 20)),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 20.0),
                ),
                new Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text("\t Please record the number of:", style: TextStyle(fontSize: 17)),
                    ),
                    new Padding(
                      padding: new EdgeInsets.only(top: 20.0),
                    ),
                    new TextFormField(
                      controller: controllerPregnancy,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                          labelText: "Pregnancies",
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0),
                          )
                      ),
                      onSaved: (String value)
                      {
                        Pregnancy = value;
                      },
                    ),
                    new Padding(
                      padding: new EdgeInsets.only(top: 10.0),
                    ),
                    new TextFormField(
                      controller: controllerVaginalBirth,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                          labelText: "Vaginal Births",
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0),
                          )
                      ),
                      onSaved: (String value)
                      {
                        VaginalBirth = value;
                      },
                    ),
                    new Padding(
                      padding: new EdgeInsets.only(top: 10.0),
                    ),
                    new TextFormField(
                      controller: controllerEctopics,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                          labelText: "Ectopics",
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0),
                          )
                      ),
                      onSaved: (String value)
                      {
                        Ectopics = value;
                      },
                    ),
                    new Padding(
                      padding: new EdgeInsets.only(top: 10.0),
                    ),
                    new TextFormField(
                      controller: controllerAbortions,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                          labelText: "Abortions",
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0),
                          )
                      ),
                      onSaved: (String value)
                      {
                        Abortions = value;
                      },
                    ),
                    new Padding(
                      padding: new EdgeInsets.only(top: 10.0),
                    ),
                    new TextFormField(
                      controller: controllerLiveChildren,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                          labelText: "Living Children",
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0),
                          )
                      ),
                      onSaved: (String value)
                      {
                        LiveChildren = value;
                      },
                    ),
                    new Padding(
                      padding: new EdgeInsets.only(top: 10.0),
                    ),
                    new TextFormField(
                      controller: controllerCSection,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                          labelText: "C-Sections",
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0),
                          )
                      ),
                      onSaved: (String value)
                      {
                        CSection = value;
                      },
                    ),
                    new Padding(
                      padding: new EdgeInsets.only(top: 10.0),
                    ),
                    new TextFormField(
                      controller: controllerMiscarriages,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                          labelText: "Miscarriages",
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0),
                          )
                      ),
                      onSaved: (String value)
                      {
                        Miscarriages = value;
                      },
                    ),
                    new Padding(
                      padding: new EdgeInsets.only(top: 10.0),
                    ),
                    new TextFormField(
                      controller: controllerPastSurgery,
                      keyboardType: TextInputType.text,
                      decoration: new InputDecoration(
                          labelText: "Any Previous Surgeries",
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0),
                          )
                      ),
                      onSaved: (String value)
                      {
                        PastSurgery = value;
                      },
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
            padding: const EdgeInsets.only(top: 10.0),
            decoration: BoxDecoration(
                borderRadius: new BorderRadius.circular(20.0),
                border: Border.all(
                  color: Colors.white,
                )
            ),
            child: new Column(
              children: <Widget>[
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

              ],
            ),
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
                  print(AgeFMP);
                  print(BleedingDays);
                  print(TamponsNo);
                  print(AgeLMP);

                  print(CurrentBC);
                  print(PastBC);
                  print(BCUseLength);
                  print(BCReason);

                  print(PapSmear);
                  print(Mammogram);
                  print(BoneDensity);
                  print(Colonoscopy);

                  print(Pregnancy);
                  print(VaginalBirth);
                  print(Ectopics);
                  print(Abortions);
                  print(LiveChildren);
                  print(CSection);
                  print(Miscarriages);

                  print(PastSurgery);

                  print(NewProblem);
                  print(Symptoms);
                  print(Medications);

                  for (final e in notifications) {
                    if (e.value == true) {
                      history.add(e.val);
                    }
                  }

                  Auth().gynecology(controllerAgeFMP.text, controllerBleedingDays.text, _jk1, controllerTamponsNo.text, _jk2, _jk3,
                      controllerAgeLMP.text, _jk4, controllerCurrentBC.text, controllerPastBC.text, controllerBCUseLength.text,
                      controllerBCReason.text, _jk5, controllerPapSmear.text, controllerMammogram.text, controllerBoneDensity.text,
                      controllerColonoscopy.text, _jk6, history.toList(), controllerPregnancy.text, controllerVaginalBirth.text,
                      controllerEctopics.text, controllerAbortions.text, controllerLiveChildren.text, controllerCSection.text,
                      controllerMiscarriages.text, controllerPastSurgery.text, controllerNewProblem.text, controllerSymptoms.text,
                      controllerMedications.text);

                  if(!globals.MyRecords.contains("Gynecology")){
                    setState(() {
                      globals.MyRecords.add("Gynecology");
                    });
                  }

                  String car = "Gynecology";
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

                  print(history);
                  history.clear();

                  new Column(
                    children: <Widget>[
                      new Text("Age at first menstrual period ${controllerAgeFMP.text}"),
                      new Text("Number of days that you bleed: ${controllerBleedingDays.text}"),
                      new Text("Number of tampons used on heaviest day: ${controllerTamponsNo.text}"),
                      new Text("If you stopped menstruating, at what age did you stop: ${controllerAgeLMP.text}"),

                      new Text("Present birth control method: ${controllerCurrentBC.text}"),
                      new Text("Birth control methods used in the past: ${controllerPastBC.text}"),
                      new Text("Length of Use: ${controllerBCUseLength.text}"),
                      new Text("Reason for discontinuation: ${controllerBCReason.text}"),

                      new Text("Last Pap Smear: ${controllerPapSmear.text}"),
                      new Text("Last Mammogram: ${controllerMammogram.text}"),
                      new Text("Last Bone Density (DEXA): ${controllerBoneDensity.text}"),
                      new Text("Last Colonoscopy: ${controllerColonoscopy.text}"),

                      new Text("Number of Pregnancies: ${controllerPregnancy.text}"),
                      new Text("Number of Vaginal Births: ${controllerVaginalBirth.text}"),
                      new Text("Number of Ectopics: ${controllerEctopics.text}"),
                      new Text("Number of Abortions: ${controllerAbortions.text}"),
                      new Text("Number of Living Children: ${controllerLiveChildren.text}"),
                      new Text("Number of C-Sections: ${controllerCSection.text}"),
                      new Text("Number of Miscarriages: ${controllerMiscarriages.text}"),

                      new Text("Previous Surgeries: ${controllerPastSurgery.value}"),

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
          ),
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

  void _pilihjk2(String value)
  {
    setState(() {
      _jk2 = value;
    });
  }

  void _pilihjk3(String value)
  {
    setState(() {
      _jk3 = value;
    });
  }

  void _pilihjk4(String value)
  {
    setState(() {
      _jk4 = value;
    });
  }

  void _pilihjk5(String value)
  {
    setState(() {
      _jk5 = value;
    });
  }

  void _pilihjk6(String value)
  {
    setState(() {
      _jk6 = value;
    });
  }

  Widget buildSingleCheckbox(NotificationSetting notification) => buildCheckbox(
    notification: notification,
    onClicked: () {
      setState(() {
        final newValue = !notification.value;
        notification.value = newValue;
      });
    },
  );

  Widget buildCheckbox({
    @required NotificationSetting notification,
    @required VoidCallback onClicked,
  }) =>
      ListTile(
        onTap: onClicked,
        leading: Checkbox(
          value: notification.value,
          onChanged: (value) => onClicked(),
        ),
        title: Text(
          notification.title,
          style: TextStyle(fontSize: 15),
        ),
      );
  
}
