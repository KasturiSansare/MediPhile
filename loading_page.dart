
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:medapp/addImage.dart';
import 'package:medapp/constants.dart';

import 'package:medapp/Global_Variables.dart' as globals;

class LoadingPage extends StatefulWidget {

  final String data;
  const LoadingPage(
      {Key key, this.data})
      : super(key: key);
  @override
  _LoadingPageState createState() => _LoadingPageState();

}

class _LoadingPageState extends State<LoadingPage> {

  @override
  Widget build(BuildContext context) {

    return globals.UrlList == null ? circularProgressLoadingPage() :
    Scaffold(
        appBar: AppBar(
          title: Text(widget.data , textAlign: TextAlign.center,),
          backgroundColor: kPrimaryColor,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
              //globals.UrlList.clear();
            },
          ),
          actions: [

            FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                  /* Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return GeneralHistory();
                      },
                    ),
                  );*/
                },
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ))
          ],
        ),


        body: Container(
          child: circularProgressLoadingPage(),

    //Future.delayed(const Duration(milliseconds: 7000),(){

    )

    );
  }


  circularProgressLoadingPage(){
    return InkWell(
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          //border: Border.all(color: Theme.of(context).accentColor,)
        ),
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
          valueColor: AlwaysStoppedAnimation(kPrimaryColor),
        ),

      ),
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return AddImage(
                data: widget.data,
              );
            },
          ),
        );
      },
    );

  }

  Future load() async{
    Future.delayed(const Duration(milliseconds: 7000),()
    {
      circularProgressLoadingPage();
    });
    }

  void initState() {
    super.initState();
  }

}