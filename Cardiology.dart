import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:medapp/constants.dart';
import 'package:medapp/display/cardiology_display.dart';
//import 'package:health_pile/SettingsUI.dart';
//import 'auth_class.dart';
import '../auth_class.dart';
import '../notification_setting.dart';
import 'package:medapp/home/records_homepage.dart';
import 'package:medapp/Global_Variables.dart' as globals;


void main() {
  runApp(new MaterialApp(
    home: new Cardiology(),
  ));
}

class Cardiology extends StatefulWidget {
  @override
  _CardiologyState createState() => _CardiologyState();
}

class _CardiologyState extends State<Cardiology> {

  var history=[];
  var history1=[];
  var history2=[];


  final notifications=[
    NotificationSetting(title:'Cardiomyopathy',val:'Cardiomyopathy' ),
    NotificationSetting(title:'Carotid Artery Disease',val:'Carotid Artery Disease'),
    NotificationSetting(title: 'Atrial Fibrillation',val:'Atrial Fibrillation'),
    NotificationSetting(title: 'Coronary Artery Disease',val:'Coronary Artery Disease'),
    NotificationSetting(title: 'COPD',val:'COPD'),
    NotificationSetting(title: 'Heart Attack Myocardial Infarction', val:'Heart Attack Myocardial Infarction'),
    NotificationSetting(title: 'Heart Failure',val:'Heart Failure'),
    NotificationSetting(title: 'Heart Murmur', val:'Heart Murmur'),
    NotificationSetting(title: 'Stroke', val:'Stroke'),
    NotificationSetting(title: 'None', val: 'None'),

  ];

  final notifications1=[
    NotificationSetting(title:'Holter Monitor', val:'Holter Monitor'),
    NotificationSetting(title:'Cardiac Catheterization',val:'Cardiac Catheterization'),
    NotificationSetting(title: 'Stress Test',val:'Stress Test'),
    NotificationSetting(title: 'Echocardiogram',val:'Echocardiogram'),
    NotificationSetting(title: 'Angioplasty or Stent',val:'Angioplasty or Stent'),
    NotificationSetting(title: 'CABG (Coronary Artery Bypass Surgery)', val:'CABG (Coronary Artery Bypass Surgery)'),
    NotificationSetting(title: 'Pacemaker Insertion',val:'Pacemaker Insertion'),
    NotificationSetting(title: 'ICD (Defibrillator Insertion)', val:'ICD (Defibrillator Insertion)'),
    NotificationSetting(title: 'None', val: 'None'),

  ];

  final notifications2=[
    NotificationSetting(title:'Diabetes', val:'Diabetes'),
    NotificationSetting(title:'Hypertension',val:'Hypertension'),
    NotificationSetting(title: 'Heart Disease',val:'Heart Disease'),
    NotificationSetting(title: 'Anemia',val:'Anemia'),
    NotificationSetting(title: 'Clotting Disorder',val:'Clotting Disorder'),
    NotificationSetting(title: 'Asthma', val:'Asthma'),
    NotificationSetting(title: 'CVA (Stroke)',val:'CVA (Stroke)'),
    NotificationSetting(title: 'Heart Attack', val:'Heart Attack'),
    NotificationSetting(title: 'Heart Failure', val:'Heart Failure'),
    NotificationSetting(title: 'High Cholesterol', val:'High Cholesterol'),
    NotificationSetting(title: 'None', val: 'None'),

  ];


  String PastHistory = "";
  String ServiceHistory = "";
  String FamilyHistory = "";
  String PastSurgery = "";
  String NewProblem="";
  String Symptoms="";
  String Medications="";

  TextEditingController controllerPastHistory = new TextEditingController();
  TextEditingController controllerServiceHistory = new TextEditingController();
  TextEditingController controllerFamilyHistory = new TextEditingController();
  TextEditingController controllerPastSurgery = new TextEditingController();
  TextEditingController controllerNewProblem = new TextEditingController();
  TextEditingController controllerSymptoms = new TextEditingController();
  TextEditingController controllerMedications = new TextEditingController();

  @override
  void dispose() {
    controllerPastSurgery.dispose();
    controllerFamilyHistory.dispose();
    controllerServiceHistory.dispose();
    controllerPastHistory.dispose();
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
                  color: Colors.grey,
                )),
            child: new Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "\t Have you ever had the following?",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 10.0),
                ),

                Divider(),
                ...notifications.map(buildSingleCheckbox).toList(),


                new Padding(
                  padding: new EdgeInsets.only(top: 10.0),
                ),
                new TextFormField(
                  controller: controllerPastHistory,
                  keyboardType: TextInputType.multiline,
                  decoration: new InputDecoration(
                      labelText: "If Others, Please Specify.",
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      )),
                  onSaved: (String value) {
                    PastHistory = value;
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
                  color: Colors.grey,
                )),
            child: new Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "\t Have you had any of the following medical services?",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 10.0),
                ),

                Divider(),
                ...notifications1.map(buildSingleCheckbox1).toList(),

                new Padding(
                  padding: new EdgeInsets.only(top: 10.0),
                ),
                new TextFormField(
                  controller: controllerServiceHistory,
                  keyboardType: TextInputType.multiline,
                  decoration: new InputDecoration(
                      labelText: "If Others, Please Specify.",
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      )),
                  onSaved: (String value) {
                    ServiceHistory = value;
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
                  color: Colors.grey,
                )),
            child: new Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "\t Family History (Please check all that apply)",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 10.0),
                ),

                Divider(),
                ...notifications2.map(buildSingleCheckbox2).toList(),

                new Padding(
                  padding: new EdgeInsets.only(top: 10.0),
                ),
                new TextFormField(
                  controller: controllerFamilyHistory,
                  keyboardType: TextInputType.multiline,
                  decoration: new InputDecoration(
                      labelText: "If Others, Please Specify.",
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      )),
                  onSaved: (String value) {
                    FamilyHistory = value;
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
            //padding: const EdgeInsets.only(top: 10.0),
            decoration: BoxDecoration(
                borderRadius: new BorderRadius.circular(20.0),
                border: Border.all(
                  color: Colors.white,
                )),
            child: new TextFormField(
              controller: controllerPastSurgery,
              keyboardType: TextInputType.text,
              decoration: new InputDecoration(
                  labelText: "Any previous surgeries?",
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(20.0),
                  )
              ),
              onSaved: (String value)
              {
                PastSurgery = value;
              },
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
                  print(PastHistory);
                  print(PastSurgery);
                  print(FamilyHistory);
                  print(ServiceHistory);


                  for(final e in notifications){
                    if(e.value==true)
                    {
                      history.add(e.val);
                    }
                  }

                  for(final e in notifications1){
                    if(e.value==true)
                    {
                      history1.add(e.val);
                    }
                  }

                  for(final e in notifications2){
                    if(e.value==true)
                    {
                      history2.add(e.val);
                    }
                  }

                  Auth().cardiology(controllerPastHistory.text, controllerServiceHistory.text, controllerFamilyHistory.text,
                      controllerPastSurgery.text, controllerNewProblem.text, controllerSymptoms.text,
                      controllerMedications.text, history.toList(), history1.toList(), history2.toList());

                  if(!globals.MyRecords.contains("Cardiology")){
                    setState(() {
                      globals.MyRecords.add("Cardiology");
                    });
                  }

                  String car = "Cardiology";
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
                  /*Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return displayCardiology();
                      },
                    ),
                  );*/

                  print(history);
                  print(history1);
                  print(history2);

                  history.clear();
                  history1.clear();
                  history2.clear();

                  new Column(
                    children: <Widget>[
                      new Text("Past medical History: ${controllerPastHistory.text}"),
                      new Text("Medical Service History: ${controllerServiceHistory.text}"),
                      new Text("Family History: ${controllerFamilyHistory.text}"),
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


  Widget buildSingleCheckbox1(NotificationSetting notification) => buildCheckbox1(
    notification: notification,
    onClicked: () {
      setState(() {
        final newValue = !notification.value;
        notification.value = newValue;

      });
    },
  );

  Widget buildCheckbox1({
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



  Widget buildSingleCheckbox2(NotificationSetting notification) => buildCheckbox2(
    notification: notification,
    onClicked: () {
      setState(() {
        final newValue = !notification.value;
        notification.value = newValue;


      });
    },
  );

  Widget buildCheckbox2({
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

