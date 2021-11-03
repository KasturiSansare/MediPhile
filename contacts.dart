import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medapp/close_circle/add_contacts.dart';
import 'package:medapp/Global_Variables.dart' as globals;
import 'package:medapp/constants.dart';
import 'package:medapp/home/records_homepage.dart';

import '../auth_class.dart';


class displaycontact extends StatelessWidget {
  static const String idScreen = "display";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Close Circle'),
        backgroundColor: kPrimaryColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>HomePageRecords()));
          },
        ),
      ),
      body: Container(
        child: StreamBuilder(
            stream: getUsersStreamSnapshots(context),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Text("Loading...");
              }
              return new ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (BuildContext context, int index) =>
                      buildCard(context, snapshot.data.documents[index]));
            }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) {
              return AddContacts();
            }),
          );
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Stream<QuerySnapshot> getUsersStreamSnapshots(BuildContext context) async* {
    final uid = await FirebaseAuth.instance.currentUser();
    yield* Firestore.instance
        .collection('Users')
        .document(uid.uid)
        .collection('Contacts')
        .orderBy('name')
        .snapshots();
  }

  Widget buildCard(BuildContext context, DocumentSnapshot data) {
    //final List<dynamic> tags = data['Family history'];
    if (!globals.recipents.contains(data['number']))
      {
        globals.recipents.add(data['number']);
      }


    Color getTypeColor(String type) {
      Color color = Theme.of(context).accentColor;

      if (type == 'Work') {
        color = Colors.brown;
      }

      if (type == 'Family') {
        color = Colors.green;
      }

      if (type == 'Friends') {
        color = Colors.teal;
      }
      return color;
    }

    Color typeColor = getTypeColor(data['type']);
    return Container(

      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(10),
      height: 130,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Row(
            children: [
              Icon(
                Icons.person,
                color: kPrimaryColor,
                size: 20,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                data['name'],
                style: TextStyle(
                    fontSize: 16,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w600),
              ),

            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Icon(
                Icons.phone_iphone,
                color: kPrimaryColor,
                size: 20,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                data['number'],
                style: TextStyle(
                    fontSize: 16,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(width: 15),
              Icon(
                Icons.group_work,
                color: typeColor,
                size: 20,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                data['type'],
                style: TextStyle(
                    fontSize: 16,
                    color: typeColor,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [


              SizedBox(
                width: 20,
              ),
             
              GestureDetector(
                onTap: () {
                  _showDeleteDialog(data['name'],data['number'], context);
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.delete,
                      color: Colors.red[700],
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text('Delete',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.red[700],
                            fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
              SizedBox(
                width: 20,
              ),
            ],
          )
        ],
      ),
    );



  }

   _showDeleteDialog(String name,String number, BuildContext context) {
    showDialog(
      context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Delete $name'),
            content: Text('Are you sure you want to delete?'),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel')),
              FlatButton(
                  onPressed: () {
                   Auth().deleteMyContacts(name,number);
                   Navigator.pop(context);
                  },
                  child: Text('Delete'))
            ],
          );
        },
    );
  }


}
