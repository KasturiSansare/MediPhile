import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medapp/Config.dart';
import 'package:medapp/constants.dart';
//import 'file:///C:/Users/kirti/AndroidStudioProjects/medapp/lib/settings/display_personal_information.dart';
//import 'file:///C:/Users/kirti/AndroidStudioProjects/medapp/lib/login/login_screen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:medapp/home/records_homepage.dart';
import 'package:medapp/login/login_screen.dart';
import 'package:medapp/login/signIn_screen.dart';
import 'dart:async';
import 'package:medapp/personal_information.dart';
//import 'file:///C:/Users/kirti/AndroidStudioProjects/medapp/lib/home/records_homepage.dart';
import 'package:medapp/remainder/screens/add_new_medicine/add_new_medicine.dart';
import 'package:medapp/remainder/screens/home/home.dart';
import 'package:medapp/settings/display_personal_information.dart';
import 'package:medapp/settings/settings_profile_page.dart';
/*import 'file:///C:/Users/kirti/AndroidStudioProjects/medapp/lib/settings/settings_profile_page.dart';
import 'file:///C:/Users/kirti/AndroidStudioProjects/medapp/lib/login/signIn_screen.dart';*/
import 'auth_class.dart';
import 'home/media_homepage.dart';
import 'package:medapp/Global_Variables.dart' as globals;

Future<void> main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  //final Future<Firebase> _initialization = Firebase.initializeApp();
  MedicalHistoryApp.auth = FirebaseAuth.instance;
  runApp(MyApp());
}

DatabaseReference userRef = FirebaseDatabase.instance.reference().child("users");

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  //final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override 
  Widget build(BuildContext context)
  {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Auth',
        theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
        ),
        home: SplashScreen(),
        //initialRoute: FirebaseAuth.instance.currentUser() == null ? LoginScreen.idScreen : NavigationPage.idScreen,
      routes:
      {
        LoginScreen.idScreen: (context) => LoginScreen(),
        SignUpScreen.idScreen: (context) => SignUpScreen(),
        PersonalInformation.idScreen: (context) => PersonalInformation(),
        PersonalInformationDisplay.idScreen: (context) =>PersonalInformationDisplay(),
        HomePageRecords.idScreen: (context) => HomePageRecords(),
        MediaHP.idScreen: (context) => MediaHP(),
        SettingsUI.idScreen: (context) => SettingsUI(),
        AddNewMedicine.idScreen : (context) => AddNewMedicine(),
        Home.idScreen: (context) => Home(),


      },

    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState()
  {
    super.initState();
    displaySplash();
    Auth().getMyList();
  }

  displaySplash()
  {
    Timer(Duration(seconds: 3), () async
    {
      if(await FirebaseAuth.instance.currentUser() != null)
      {
        Route route = MaterialPageRoute(builder: (_) => HomePageRecords());
        Navigator.pushReplacement(context, route);
        Auth().getMyList();
        Auth().getMyMediaList();
        print('-----------------------------------------${globals.MyRecords}');
        //Auth().createMyList("General History");
      }
      else
      {
        Route route = MaterialPageRoute(builder: (_) => LoginScreen());
        Navigator.pushReplacement(context, route);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          color: kPrimaryColor,
          /*gradient: LinearGradient(
            colors: [kPrimaryColor],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 0.0),
            stops: [0.0,1.0],
            tileMode: TileMode.clamp,
          ),*/
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset("assets/images/Logo_wt_wt.png"),
              /*SizedBox(height: 20.0,),
              Text(""),*/
            ],
          ),
        ),
      ),
    );
  }
}


/*
  test --> pubspec.yaml
    add 'flutter_svg: ^0.17.4' in dependencies
    add 'assets : assets/images'
         'assets : assets/icons'
         on line 50 (remove the comment and add)

  added images to the assets which might change
 */