import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:medapp/close_circle/contacts.dart';
import 'package:medapp/constants.dart';


class AddContacts extends StatefulWidget {
  @override
  _AddContactsState createState() => _AddContactsState();
}

class _AddContactsState extends State<AddContacts> {
  TextEditingController _nameController, _numberController;
  String _typeSelected = '';

  //DatabaseReference _ref;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController = TextEditingController();
    _numberController = TextEditingController();
    //_ref = FirebaseDatabase.instance.reference().child('Contacts');
  }

  Widget _buildContactType(String title) {
    return InkWell(
      child: Container(
        height: 40,
        width: 90,
        decoration: BoxDecoration(
          color: _typeSelected == title
              ? Colors.green
              : kPrimaryColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
      onTap: () {
        setState(() {
          _typeSelected = title;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Save Contact',),
        backgroundColor: kPrimaryColor,
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),

            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'Enter Name',
                prefixIcon: Icon(
                  Icons.account_circle,
                  size: 30,
                ),
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.all(15),
              ),
            ),
            SizedBox(height: 25),
            TextFormField(
              controller: _numberController,
              decoration: InputDecoration(
                hintText: 'Enter Number',
                prefixIcon: Icon(
                  Icons.phone_iphone,
                  size: 30,
                ),
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.all(15),
              ),
            ),
            SizedBox(
              height: 45,
            ),
            Container(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildContactType('Work'),
                  SizedBox(width: 10),
                  _buildContactType('Family'),
                  SizedBox(width: 10),
                  _buildContactType('Friends'),
                  SizedBox(width: 10),
                  _buildContactType('Others'),
                ],
              ),
            ),
            SizedBox(
              height: 55,
            ),
           /* Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: RaisedButton(
                child: Text(
                  'Save Contact',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onPressed: ()async {
                  saveContact(_nameController.text,_numberController.text,_typeSelected);
                },
                color: Theme.of(context).primaryColor,
              ),
            )*/

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
                    "Save Contact",
                    style: Theme.of(context)
                        .textTheme
                        .button
                        .apply(color: Colors.white, fontSizeDelta: 3.5),
                  ),
                  color: kPrimaryColor,
                  onPressed: () {
                    saveContact(_nameController.text,_numberController.text,_typeSelected);

                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> saveContact(String name, String number, String type) async {
    FirebaseUser userData = await FirebaseAuth.instance.currentUser();


   /* DatabaseReference reference = FirebaseDatabase.instance
        .reference()
        .child('users')
        .child(userData.uid)
        .child('Contacts');

    String name = _nameController.text;
    String number = _numberController.text;*/
    Firestore.instance
        .collection('Users').document(userData.uid)
        .collection('Contacts').document(name).setData({
      'name': name,
      'number': '+91 ' + number,
      'type':type,
      /*'type': _typeSelected,*/
    });
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => displaycontact()));
    //Navigator.pop(context);
    //Contacts._buildContactItem(contact);
    /*var domainList = reference.push();
    domainList.set(contact).then((value) {
      Navigator.pop(context);
    });*/
    /*_ref.push().set(contact).then((value) {
      Navigator.pop(context);
    }
    );*/
  }
}
