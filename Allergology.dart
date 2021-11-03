import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:medapp/constants.dart';
import 'package:medapp/display/allergology_display.dart';
import 'package:medapp/home/records_homepage.dart';
import '../auth_class.dart';
import '../notification_setting.dart';
import 'package:medapp/Global_Variables.dart' as globals;
// line no. 22, 39, 189

void main() {
  runApp(new MaterialApp(
    home: new Allergology(),
  ));
}

class Allergology extends StatefulWidget {
  @override
  _AllergologyState createState() => _AllergologyState();
}

class _AllergologyState extends State<Allergology> {


  String NewProblem="";
  String Symptoms="";
  String Medications="";
  String spec = "";
  String surgery = "";


  TextEditingController controllerOthers = new TextEditingController();
  TextEditingController controllerPrevious = new TextEditingController();
  TextEditingController controllerNewProblem = new TextEditingController();
  TextEditingController controllerSymptoms = new TextEditingController();
  TextEditingController controllerMedications = new TextEditingController();

  //got to notification_setting.dart
  // Add the val values in this class of NotificationSetting() declared in notification_setting.dart
  //Val is the name/value of checkboxes.

  //Go to onpressed(){}

  final notifications = [
    NotificationSetting(title: 'Hay Fever / Allergic Nose Problem', val: 'Hay Fever / Allergic Nose Problem'),
    NotificationSetting(title: 'Eczema', val: 'Eczema'),
    NotificationSetting(title: 'Sinusitis', val: 'Sinusitis'),
    NotificationSetting(title: 'Insect Allergy', val: 'Insect Allergy'),
    NotificationSetting(title: 'Bronchitis', val: 'Bronchitis'),
    NotificationSetting(title: 'Asthma', val: 'Asthma'),
    NotificationSetting(title: 'None', val: 'None'),
  ];

  //declare the list
  var history = [];


  @override
  void dispose() {
    controllerOthers.dispose();
    controllerPrevious.dispose();
    controllerNewProblem.dispose();
    controllerSymptoms.dispose();
    controllerMedications.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return new Scaffold(
      /*appBar: PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              child: Container(
                height: size.height * 0.4,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    image: DecorationImage(
                        alignment: Alignment.topCenter,
                        fit: BoxFit.fitWidth,
                        image: AssetImage('assets/images/9.jpeg'))),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.all(50.0),
                child: Column(
                  children: <Widget>[
                    Center(
                      child: Text(
                        'ALLERGOLOGY',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 30.0, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),*/

      appBar: new AppBar(
          //leading: new Icon(Icons.list),
          title: new Text("Allergology"),
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
                )),
            child: new Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "\t Allergology specific family history:  ",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
                Divider(),
                ...notifications.map(buildSingleCheckbox).toList(),
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
                )),
            child: new TextFormField(
              controller: controllerPrevious,
              keyboardType: TextInputType.multiline,
              decoration: new InputDecoration(
                  labelText: "Any previous surgeries?",
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(20.0),
                  )),
              onSaved: (String value) {
                surgery = value;
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
                  print(spec);
                  print(surgery);

                  // add this loop

                  for (final e in notifications) {
                    if (e.value == true) {
                      history.add(e.val);
                    }
                  }

                  Auth().allergology(history.toList(), controllerPrevious.text, controllerNewProblem.text, controllerSymptoms.text, controllerMedications.text);
                  print(history);

                  if(!globals.MyRecords.contains("Allergology")){
                    setState(() {
                      globals.MyRecords.add("Allergology");
                    });
                  }

                  String car = "Allergology";
                  Auth().createMyList(car);
                  print('Yo===================================${globals.MyRecords}');



                  /*setState(() {
                    globals.MyRecords.add("Allergology");
                    globals.MyDisplays.add(displayAllergology());
                  });*/
                  //Navigator.of(context).pop();

                  /*print('hiiiiii');
                  print(globals.MyRecords);*/

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return HomePageRecords();
                      },
                    ),
                  );

                  history.clear();


                  new Column(
                    children: <Widget>[
                      new Text("Others: ${controllerOthers.text}"),
                      new Text("Previous: ${controllerPrevious.text}"),
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
            padding: new EdgeInsets.only(top: 50.0),
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
        print(newValue);
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
          focusColor: kPrimaryColor,
          value: notification.value,
          onChanged: (value) => onClicked(),

        ),
        title: Text(
          notification.title,
          style: TextStyle(fontSize: 15),
        ),
      );
}
