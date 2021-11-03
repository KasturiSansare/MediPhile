import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:medapp/constants.dart';
import 'package:medapp/display/gastroenterology_display.dart';
import 'package:medapp/notification_setting.dart';
import 'package:medapp/Global_Variables.dart' as globals;
import 'package:medapp/home/records_homepage.dart';
import '../auth_class.dart';

void main() {
  runApp(new MaterialApp(
    home: new Gastroenterology(),
  ));
}

class Gastroenterology extends StatefulWidget {
  @override
  _GastroenterologyState createState() => _GastroenterologyState();
}

class _GastroenterologyState extends State<Gastroenterology> {

  var _formKey = GlobalKey<FormState>();

  /*bool checkBoxValue1 = false;
  bool checkBoxValue2 = false;
  bool checkBoxValue3 = false;
  bool checkBoxValue4 = false;
  bool checkBoxValue5 = false;
  bool checkBoxValue6 = false;
  bool checkBoxValue7 = false;
  bool checkBoxValue8 = false;*/

  final notifications1=[
    NotificationSetting(title: 'Autoimmune Disease', val: 'Autoimmune Disease'),
    NotificationSetting(title: 'Ulcerative Colitis',val: 'Ulcerative Colitis'),
    NotificationSetting(title: 'Pancreatitis', val: 'Pancreatitis'),
    NotificationSetting(title: 'Gallbladder disease', val: 'Gallbladder disease'),
    NotificationSetting(title: 'Gastric Ulcer', val: 'Gastric Ulcer'),
    NotificationSetting(title: 'History of Colon Cancer', val: 'History of Colon Cancer'),
    NotificationSetting(title: 'Inflammatory Bowel Disease', val:'Inflammatory Bowel Disease'),
    NotificationSetting(title: 'None', val:'None'),

  ];

  /*bool checkBoxValue9 = false;
  bool checkBoxValue10 = false;
  bool checkBoxValue11 = false;
  bool checkBoxValue12 = false;
  bool checkBoxValue13 = false;
  bool checkBoxValue14 = false;*/

  final notifications2=[
    NotificationSetting(title: 'Appendectomy', val:'Appendectomy'),
    NotificationSetting(title: 'Hernia Repair', val: 'Hernia Repair'),
    NotificationSetting(title: 'Colon Resection', val:'Colon Resection'),
    NotificationSetting(title: 'Gastric By-pass', val:'Gastric By-pass'),
    NotificationSetting(title: 'Gall Bladder Surgery', val:'Gall Bladder Surgery'),
    NotificationSetting(title: 'None', val: 'None'),

  ];

  /*bool checkBoxValue15 = false;
  bool checkBoxValue16 = false;
  bool checkBoxValue17 = false;*/

  final notifications3=[
    NotificationSetting(title: 'Endoscopy', val: 'Endoscopy'),
    NotificationSetting(title: 'Colonoscopy', val:  'Colonoscopy'),
    NotificationSetting(title: 'None', val:  'None'),

  ];

  var history1=[];
  var history2=[];
  var history3=[];

  String NewProblem;
  String Symptoms;
  String Medications;

  TextEditingController controllerNewProblem = new TextEditingController();
  TextEditingController controllerSymptoms = new TextEditingController();
  TextEditingController controllerMedications = new TextEditingController();

  void dispose()
  {
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
            title: new Text("Gastroenterology"),
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

        body: ListView(children: <Widget>[

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
                    "\t Previous/Present medical condition? ",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 10.0),
                ),
                Column(
                  children: <Widget>[
                    Divider(),
                    ...notifications1.map(buildSingleCheckbox1).toList(),
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
                  color: Colors.grey,
                )),
            child: new Column(children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "\t Previous Procedures? ",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
              Divider(),
              ...notifications2.map(buildSingleCheckbox2).toList(),
            ]),
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
                  color: Colors.grey,
                )),
            child: new Column(children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "\t Preventive Screening ",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
              Divider(),
              ...notifications3.map(buildSingleCheckbox3).toList(),
            ]),
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



                  print(NewProblem);
                  print(Symptoms);
                  print(Medications);

                  for (final e in notifications1) {
                    if (e.value == true) {
                      history1.add(e.val);
                    }
                  }

                  for (final e in notifications2) {
                    if (e.value == true) {
                      history2.add(e.val);
                    }
                  }
                  for (final e in notifications3) {
                    if (e.value == true) {
                      history3.add(e.val);
                    }
                  }
                  Auth().gastroenterology(history1.toList(), history2.toList(), history3.toList(),
                      controllerNewProblem.text, controllerSymptoms.text, controllerMedications.text);

                  if(!globals.MyRecords.contains("Gastroenterology")){
                    setState(() {
                      globals.MyRecords.add("Gastroenterology");
                    });
                  }

                  //Navigator.of(context).pop();

                  String car = "Gastroenterology";
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

                  print(history1);
                  history1.clear();
                  print(history2);
                  history2.clear();
                  print(history3);
                  history3.clear();


                  child:
                  new Column(
                    children: <Widget>[
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
        ]));
  }

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


  Widget buildSingleCheckbox3(NotificationSetting notification) => buildCheckbox3(
    notification: notification,
    onClicked: () {
      setState(() {
        final newValue = !notification.value;
        notification.value = newValue;
      });
    },
  );


  Widget buildCheckbox3({
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
