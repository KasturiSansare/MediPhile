import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medapp/auth_class.dart';
import 'package:medapp/constants.dart';
//import 'file:///C:/Users/kirti/AndroidStudioProjects/medapp/lib/home/records_homepage.dart';
import 'package:medapp/Global_Variables.dart' as globals;
import 'package:medapp/login/signIn_screen.dart' as sign;

import 'home/records_homepage.dart';

class PersonalInformation extends StatefulWidget {
  static const String idScreen = "personal_information";
  @override
  PersonalInformationState createState() => new PersonalInformationState();

}

class PersonalInformationState extends State<PersonalInformation>
{
  String first_name;
  String last_name;
  String phone_no;
  String home_no;
  String address;
  String dob;
  //String age;

  TextEditingController first = TextEditingController();
  TextEditingController last = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController home = TextEditingController();
  TextEditingController add = TextEditingController();
  TextEditingController date_of_birth = TextEditingController();
  TextEditingController age = TextEditingController();


  final _formKey = GlobalKey<FormState>();
  bool isValidate = false;

  final db = Firestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  Future<FirebaseUser> userData = FirebaseAuth.instance.currentUser();

  String _jk1 = "";
  String _jk2 = "";
  String _jk3 = "";

  File _image;
  //String profileImage;


  @override
  Widget build(BuildContext context) {
    //String user = getCurrentUID();
    FirebaseStorage storage = FirebaseStorage(
      storageBucket : "gs://mediphile-a66a9.appspot.com/",
    );


    Future<String> uploadPicture(BuildContext context) async{
      //String filename = basename("user/profile/${first}");
      FirebaseUser userData = await FirebaseAuth.instance.currentUser();
      String uid = userData.uid;

      StorageReference firebaseStorageRef = storage.ref().child("$uid/profile");
      StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
      StorageTaskSnapshot taskSnapshot=await uploadTask.onComplete;
      var downloadUrl = await taskSnapshot.ref.getDownloadURL();

      print(downloadUrl);
      setState(() {
        print("Profile Picture uploaded");
        globals.profile_image = downloadUrl;
        print(globals.profile_image);
        //Scaffold.of(context).showSnackBar(SnackBar(content: Text('Profile Picture Uploaded')));
      });

      return globals.profile_image;
    }
    Future getImage() async{
      var image =  await ImagePicker.pickImage(source: ImageSource.gallery);

      setState(() {
        _image = image;
        print('Image path $_image');

      });
      uploadPicture(context);
    }


    print(globals.profile_image);

    String returnUrl(){
      return globals.profile_image;
    }

    Future<String> _addPathToDatabase(String fn, String ln) async {
        // Get image URL from firebase
      FirebaseUser userData = await FirebaseAuth.instance.currentUser();
      String uid = userData.uid;
        final ref = FirebaseStorage().ref().child("$uid");
        var imageString = await ref.getDownloadURL();
        return imageString;
    }

    return new Scaffold(
      appBar: new AppBar(
        //leading: new Icon(Icons.list),
        title: new Text("Personal Information"),
        backgroundColor: kPrimaryColor,
      ),
      body: ListView(
        children: <Widget>[
          new Form(
              key: _formKey,
              child: new Column(children: <Widget>[
                new Padding(
                  padding: new EdgeInsets.only(top: 20.0),
                ),
                new Center(
                  child:Stack(
                    children: [
                      CircleAvatar(
                      radius: 70,
                      backgroundColor: kPrimaryColor,
                        child: ClipOval(
                          child: new SizedBox(
                            width: 130.0,
                            height: 130.0,
                            child: (_image!=null)?Image.file(
                              _image,
                              fit: BoxFit.fill,
                            ):Image.network(
                              "https://images.pexels.com/photos/3307758/pexels-photo-3307758.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=250",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: InkWell(
                          onTap: () {
                            getImage();
                            //uploadPicture(context, first.text, last.text);
                            uploadPicture(context);


                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 3,
                                color: Theme.of(context).scaffoldBackgroundColor,
                              ),
                              color: kPrimaryColor,
                            ),

                            child: Icon(
                              Icons.photo_camera,
                              color: Colors.white,
                            ),
                          )
                      ),
                    )
                  ]
                  ),

                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 20.0),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 20.0),
                ),
                new TextFormField(
                  controller: first,
                  decoration: new InputDecoration(
                      labelText: "First Name",

                      errorText: isValidate ? 'Required': null ,
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                        )
                  ),
                  onSaved: (String value) {
                    first_name = value;
                  },
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 20.0),
                ),
                new TextFormField(
                  controller: last,
                  decoration: new InputDecoration(
                      labelText: "Last Name",
                      errorText: isValidate ? 'Required': null ,
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      )),
                  keyboardType: TextInputType.text,

                  onSaved: (String value) {
                    last_name = value;
                  },
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 20.0),
                ),
                new TextFormField(
                  enabled: false,
                  controller: sign.email_id,
                  decoration: new InputDecoration(
                      labelText: "Email",
                      errorText: isValidate ? 'Required': null ,
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      )),
                  keyboardType: TextInputType.emailAddress,
                  validator: (String value) {
                    if (!RegExp(
                        r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                        .hasMatch(value)) {
                      return 'Please enter a valid email Address';
                    }
                    if (value.isEmpty) {
                      return 'Required';
                    }
                    return null;
                  },
                  onSaved: (String value) {
                    //email = value;
                  },
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 20.0),
                ),
                new TextFormField(
                  controller: phone,
                  keyboardType: TextInputType.phone,
                  validator: (String value) {
                    if (value.length < 10) {
                      return 'Invalid Number';
                    }
                    return null;
                  },
                  decoration: new InputDecoration(
                      labelText: "Phone Number",
                      errorText: isValidate ? 'Required': null ,
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      )),
                  onSaved: (String value) {
                    phone_no = value;
                  },
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 20.0),
                ),
                new TextFormField(
                  controller: home,
                  keyboardType: TextInputType.phone,
                  validator: (String value) {
                    if (value.length < 10) {
                      return 'Invalid Number';
                    }
                    return null;
                  },
                  decoration: new InputDecoration(
                      labelText: "Emergency Contact",
                      errorText: isValidate ? 'Required': null ,
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      )),
                  onSaved: (String value) {
                    home_no = value;
                  },
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 20.0),
                ),
                new TextFormField(
                  controller: date_of_birth,
                    decoration: new InputDecoration(
                        labelText: "Date of Birth (DD/MM/YYYY)",
                        errorText: isValidate ? 'Required': null ,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(20.0),
                        )),
                    keyboardType: TextInputType.text,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Required';
                      }
                      if (!RegExp(
                          r"^(0[1-9]|[12][0-9]|3[01])\/(0[1-9]|1[0-2])\/([12][0-9]{3})$")
                          .hasMatch(value)) {
                        return 'Invalid Format, Please enter in the given format';
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      dob = value;
                    }),
                new Padding(
                  padding: new EdgeInsets.only(top: 20.0),
                ),
                new TextFormField(
                  controller: age,
                    decoration: new InputDecoration(
                        labelText: "Age",
                        errorText: isValidate ? 'Required': null ,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(20.0),
                        )),
                    keyboardType: TextInputType.number,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Required';
                      }
                      if (value.length > 3) {
                        return 'Invalid Entry';
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      dob = value;
                    }),
              ])),
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
            child: new Column(children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "      Gender",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
              new RadioListTile(
                title: Text("Female"),
                value: "Female",
                groupValue: _jk1,
                onChanged: (String value) {
                  _pilihjk1(value);
                },
                activeColor: kPrimaryColor,
              ),
              new RadioListTile(
                title: Text("Male"),
                value: "Male",
                groupValue: _jk1,
                onChanged: (String value) {
                  _pilihjk1(value);
                },
                activeColor: kPrimaryColor,
              ),
              new RadioListTile(
                title: Text("Other"),
                value: "Other",
                groupValue: _jk1,
                onChanged: (String value) {
                  _pilihjk1(value);
                },
                activeColor: kPrimaryColor,
              ),
              new RadioListTile(
                title: Text("Prefer not to say"),
                value: "Prefer not to say",
                groupValue: _jk1,
                onChanged: (String value) {
                  _pilihjk1(value);
                },
                activeColor: kPrimaryColor,
              ),
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
                  color: Colors.grey,
                )),
            child: new Column(children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "      Maritial Status",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
              new RadioListTile(
                title: Text("Unmarried"),
                value: "Unmarried",
                groupValue: _jk2,
                onChanged: (String value) {
                  _pilihjk2(value);
                },
                activeColor: kPrimaryColor,
              ),
              new RadioListTile(
                title: Text("Married"),
                value: "Married",
                groupValue: _jk2,
                onChanged: (String value) {
                  _pilihjk2(value);
                },
                activeColor: kPrimaryColor,
              ),
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
                  color: Colors.grey,
                )),
            child: new Column(children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "      Blood Group",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
              new RadioListTile(
                title: Text("A+"),
                value: "A+",
                groupValue: _jk3,
                onChanged: (String value) {
                  _pilihjk3(value);
                },
                activeColor: kPrimaryColor,
              ),
              new RadioListTile(
                title: Text("A-"),
                value: "A-",
                groupValue: _jk3,
                onChanged: (String value) {
                  _pilihjk3(value);
                },
                activeColor: kPrimaryColor,
              ),
              new RadioListTile(
                title: Text("B+"),
                value: "B+",
                groupValue: _jk3,
                onChanged: (String value) {
                  _pilihjk3(value);
                },
                activeColor: kPrimaryColor,
              ),
              new RadioListTile(
                title: Text("B-"),
                value: "B-",
                groupValue: _jk3,
                onChanged: (String value) {
                  _pilihjk3(value);
                },
                activeColor: kPrimaryColor,
              ),
              new RadioListTile(
                title: Text("AB+"),
                value: "AB+",
                groupValue: _jk3,
                onChanged: (String value) {
                  _pilihjk3(value);
                },
                activeColor: kPrimaryColor,
              ),
              new RadioListTile(
                title: Text("AB-"),
                value: "AB-",
                groupValue: _jk3,
                onChanged: (String value) {
                  _pilihjk3(value);
                },
                activeColor: kPrimaryColor,
              ),
              new RadioListTile(
                title: Text("O+"),
                value: "O+",
                groupValue: _jk3,
                onChanged: (String value) {
                  _pilihjk3(value);
                },
                activeColor: kPrimaryColor,
              ),
              new RadioListTile(
                title: Text("O-"),
                value: "O-",
                groupValue: _jk3,
                onChanged: (String value) {
                  _pilihjk3(value);
                },
                activeColor: kPrimaryColor,
              ),
              new RadioListTile(
                title: Text("Bombay Blood Group"),
                value: "Bombay Blood Group",
                groupValue: _jk3,
                onChanged: (String value) {
                  _pilihjk3(value);
                },
                activeColor: kPrimaryColor,
              ),
            ]),
          ),
          new Padding(
            padding: new EdgeInsets.only(top: 20.0),
          ),
          new TextFormField(
            controller: add,
            decoration: new InputDecoration(
                labelText: "Address",
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(20.0),
                )),
            keyboardType: TextInputType.multiline,
            onSaved: (String value) {
              //age = value;
            },
          ),
          new Padding(
            padding: new EdgeInsets.only(top: 20.0),
          ),
          ConstrainedBox(
            constraints: new BoxConstraints(
              minHeight: 60.0,
              minWidth: 20.0,
            ),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  side: BorderSide(color: kPrimaryColor)),
              child: new Text(
                "Submit",
                style: Theme.of(context).textTheme.button.apply(color: Colors.white, fontSizeDelta: 3.5),

              ),
              color: kPrimaryColor,
              onPressed: () async{



                Future.delayed(const Duration(milliseconds: 7000),(){

                  Auth().userFirstName(first.text, last.text, sign.email_id.text, phone.text, home.text, date_of_birth.text, age.text, add.text, _jk1, _jk2, _jk3, globals.profile_image);
                  print(globals.profile_image);
                  print("Waiting.......................");

                });

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return HomePageRecords();
                    },
                  ),
                );

                print(first_name);
                print(last_name);
                print(email);
                print(phone_no);
                print(home_no);
                print(dob);
                print(age);
                print(address);

                //Send to API
              },
            ),
          ),
        ],
      ),
    );
  }

  void _pilihjk1(String value) {
    setState(() {
      _jk1 = value;
    });
  }

  void _pilihjk2(String value) {
    setState(() {
      _jk2 = value;
    });
  }

  void _pilihjk3(String value) {
    setState(() {
      _jk3 = value;
    });
  }

}