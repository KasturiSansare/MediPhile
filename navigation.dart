import 'package:flutter/material.dart';
//import 'file:///C:/Users/kirti/AndroidStudioProjects/medapp/lib/settings/settings_profile_page.dart';
import 'package:medapp/settings/settings_profile_page.dart';


class NavigationPage extends StatelessWidget {
  @override
  static const String idScreen = "navigation";

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form'),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(25),
          child: FlatButton(
            child: Text('Navigate', style: TextStyle(fontSize: 20.0),),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SettingsUI()));
            },
          ),
        ),

        /*child: SignInButton(
          Buttons.Google, text: 'Sign Out of Google',
          onPressed: () {
            FirebaseAuth.instance.signOut();
            Navigator.pushNamedAndRemoveUntil(context,LoginScreen.idScreen, (router) => false);

            //Navigator.of(context).pop();

          },
        ),*/
      ),
    );


  }

}