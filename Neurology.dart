import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medapp/constants.dart';
import 'package:medapp/display/neurology_display.dart';
import 'package:medapp/notification_setting.dart';
import 'package:medapp/Global_Variables.dart' as globals;
import 'package:medapp/home/records_homepage.dart';
import '../auth_class.dart';

class Neurology extends StatefulWidget {
  @override
  _NeurologyState createState() => _NeurologyState();
}

class _NeurologyState extends State<Neurology> {

  var _formKey = GlobalKey<FormState>();

  /*bool checkBoxValue1 = false;
  bool checkBoxValue2 = false;
  bool checkBoxValue3 = false;
  bool checkBoxValue4 = false;
  bool checkBoxValue5 = false;
  bool checkBoxValue6 = false;
  bool checkBoxValue7 = false;
  bool checkBoxValue8 = false;
  bool checkBoxValue9 = false;
  bool checkBoxValue10 = false;
  bool checkBoxValue11 = false;
  bool checkBoxValue12 = false;
  bool checkBoxValue13 = false;
  bool checkBoxValue14 = false;
  bool checkBoxValue15 = false;
  bool checkBoxValue16 = false;*/

  final notifications=[
    NotificationSetting(title: 'Headaches', val: 'Headaches'),
    NotificationSetting(title: 'Seizures/Convulsions', val: 'Seizures/Convulsions'),
    NotificationSetting(title: 'Weakness', val: 'Weakness'),
    NotificationSetting(title: 'Numbness Sensation', val: 'Numbness Sensation'),
    NotificationSetting(title: 'Tremors', val: 'Tremors'),
    NotificationSetting(title: 'Concussion/Whiplash', val: 'Concussion/Whiplash'),
    NotificationSetting(title: 'Trouble Sleeping', val: 'Trouble Sleeping'),
    NotificationSetting(title: 'Trouble Walking', val: 'Trouble Walking'),
    NotificationSetting(title: 'Dizziness', val: 'Dizziness'),
    NotificationSetting(title: 'Speech Difficulty', val: 'Speech Difficulty'),
    NotificationSetting(title: 'Motion Sickness', val: 'Motion Sickness'),
    NotificationSetting(title: 'Double Vision', val: 'Double Vision'),
    NotificationSetting(title: 'History of Stroke', val: 'History of Stroke'),
    NotificationSetting(title: 'Confusion', val: 'Confusion'),
    NotificationSetting(title: 'Memory Problems', val: 'Memory Problems'),
    NotificationSetting(title: 'None', val: 'None'),

  ];
  var history=[];

  String OtherProblems;
  String PastSurgery;
  String NewProblem;
  String Symptoms;
  String Medications;

  TextEditingController controllerOtherProblems = new TextEditingController();
  TextEditingController controllerPastSurgery = new TextEditingController();
  TextEditingController controllerNewProblem = new TextEditingController();
  TextEditingController controllerSymptoms = new TextEditingController();
  TextEditingController controllerMedications = new TextEditingController();

  void dispose()
  {
    controllerOtherProblems.dispose();
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

    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),

      //APPBAR
      appBar: new AppBar(
        //leading: new Icon(Icons.list),
          title: new Text("Neurology"),
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
                  child: Text("\t Personal Neurological History", style: TextStyle(fontSize: 20)),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 20.0),
                ),

                Divider(),
                ...notifications.map(buildSingleCheckbox).toList(),

                new TextFormField(
                  controller: controllerOtherProblems,
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(
                      labelText: "Other Psychiatric/Neurological condition",
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      )
                  ),
                  onSaved: (String value)
                  {
                    OtherProblems = value;
                  },
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
              constraints:new BoxConstraints(
                minHeight: 60.0,
                minWidth: 335.0,
              ),
              child: RaisedButton(

                shape: RoundedRectangleBorder(

                  borderRadius: BorderRadius.circular(20.0),
                  side: BorderSide(color: kPrimaryColor),
                ),
                child: new Text(
                  "SAVE",
                  style: Theme.of(context).textTheme.button.apply(color: Colors.white, fontSizeDelta: 3.5),
                ),
                color: kPrimaryColor,
                onPressed: () {
                  /*if (!_formKey.currentState.validate()) {
                    return;
                  }*/

                  //_formKey.currentState.save();

                  print(OtherProblems);
                  print(PastSurgery);
                  print(NewProblem);
                  print(Symptoms);
                  print(Medications);

                  for (final e in notifications) {
                    if (e.value == true) {
                      history.add(e.val);
                    }
                  }

                  Auth().neurology(history.toList(), controllerOtherProblems.text,controllerPastSurgery.text,
                      controllerNewProblem.text, controllerSymptoms.text, controllerMedications.text);

                  if(!globals.MyRecords.contains("Neurology")){
                    setState(() {
                      globals.MyRecords.add("Neurology");
                    });
                  }

                  String car = "Neurology";
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
                      new Text("Other Psychiatric/Neurological Condition: ${controllerOtherProblems.value}"),
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
