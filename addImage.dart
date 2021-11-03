import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:medapp/constants.dart';
import 'package:medapp/home/media_homepage.dart';
import 'package:medapp/loading_page.dart';
import 'package:path/path.dart' as Path;
import 'package:permission_handler/permission_handler.dart';
import 'package:uuid/uuid.dart';
import 'package:share/share.dart';

import 'auth_class.dart';
import 'image_upload/progress.dart';
import 'package:medapp/Global_Variables.dart' as globals;

class AddImage extends StatefulWidget {

  final String data;
  const AddImage(
      {Key key, this.data})
      : super(key: key);

  @override
  _AddImageState createState() => _AddImageState();

}

class _AddImageState extends State<AddImage> {
  bool uploading = false;
  double val = 0;
  CollectionReference imgRef;
  //firebase_storage.Reference ref;
  //FirebaseStorage storage;



  String name;
  final picker = ImagePicker();

  String imageUrl;

  var file;
  bool isUploading = false;
  String postId = Uuid().v4();
  var getUrl;
  TextEditingController captionController = TextEditingController();
  DateTime currentPhoneDate = DateTime.now();
  bool isLoading = false;
  int mediaCount = 0;
  List<Media> medias = [];

  Future<String> k = Auth().getUID();


  /*Scaffold buildUploadForm() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            //onPressed: clearImage
        ),
        title: Text(
          "Media Upload",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          FlatButton(
            onPressed:(){
              uploadPicture(context, file);
              isUploading
                  ? null : handleSubmit();
              getProfilePosts();
            },
            child: Text(
              "Upload",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          isUploading ? linearProgress() : Text(""),
          Container(
            height: 220.0,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Center(
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: FileImage(file),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0),
          ),
          ListTile(
            title: Container(
              width: 250.0,
              child: TextField(
                controller: captionController,
                decoration: InputDecoration(
                  hintText: "Write the description",
                  border: InputBorder.none,
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }*/
  clearImage() {
    setState(() {
      file = null;
    });
  }

/*
  handleSubmit() async {
    setState(() {
      isUploading = true;
    });

    //String mediaUrl = await uploadImage(file);
    Auth().createMedia(getUrl, captionController.text, postId, currentPhoneDate);
    captionController.clear();
    //locationController.clear();
    setState(() {
      file = null;
      isUploading = false;
      postId = Uuid().v4();
    });
  }

  getProfilePosts() async {
    setState(() {
      isLoading = true;
    });
    FirebaseUser userData = await FirebaseAuth.instance.currentUser();

    QuerySnapshot snapshot = await Firestore.instance
        .collection('Users')
        .document(userData.uid)
        .collection('Media')
        .orderBy('timestamp', descending: true)
        .getDocuments();
    print("Snapp..............$snapshot");
    setState(() {
      isLoading = false;
      mediaCount = snapshot.documents.length;
      print("Count--------------------------$mediaCount");
      medias = snapshot.documents.map((doc) => Media.fromDocument(doc)).toList();
      print("Mediaaaaaaaaaaaaaaaaaa.................$medias");
    });
  }

  buildProfilePosts() {
    if (isLoading) {
      return circularProgress();
    } else if (medias.isEmpty) {
      return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //SvgPicture.asset('assets/images/no_content.svg', height: 260.0),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Text(
                "No Posts Yet",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  //fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      );
    } else  {
      return Column(
        //children: medias,
      );
      */
/* List<GridTile> gridTiles = [];
      media.forEach((media) {
        gridTiles.add(GridTile(child: MediaTile(media)));
      });
      return GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 1.0,
        mainAxisSpacing: 1.5,
        crossAxisSpacing: 1.5,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: gridTiles,
      );*/


  @override
  Widget build(BuildContext context) {

    return globals.UrlList == null ? circularProgress() :
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return MediaHP();
                  },
                ),
              );
              globals.UrlList.clear();
            },
          ),
          actions: [
            FlatButton(
                onPressed: () {
                  name = widget.data;
                  print(widget.data);
                  selectFile(context);
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


        body: ListView.builder(
          //itemCount: globals.UrlList.length,
            itemBuilder: (BuildContext context, int index){
              return Padding(
                padding: EdgeInsets.all(20),
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
                  margin: EdgeInsets.all(8.0),
                  //shape:Border.all(width: 5, ),
                  elevation: 20,

                  child: Column(
                    children: <Widget>[

                      CachedNetworkImage(
                        imageUrl: globals.UrlList[index],
                        placeholder: (context, url) => circularProgress(),
                        errorWidget: (context, url, error) => new Icon(Icons.error),
                        height: 400,
                      ),
                      /*Image.network(
                        globals.UrlList[index],
                        height: 400,
                      ),*/
                      SizedBox(height: 10,),

                      Row(
                        children: [
                          SizedBox(width: 10,),
                          IconButton(
                              icon: Icon(
                                  Icons.share_outlined,
                                  color: kPrimaryColor),
                              onPressed: (){
                                Share.share(globals.UrlList[index]);
                              }),
                          SizedBox(width: 215,),
                          IconButton(
                              icon: Icon(
                                Icons.delete,
                                color: kPrimaryColor,
                                size: 30,
                              ),
                              onPressed: (){
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: Text("Delete?"),
                                      content: Text("Are you sure you want to delete this record?"),
                                      contentTextStyle:
                                      TextStyle(fontSize: 17.0, color: Colors.grey[800]),
                                      actions: [
                                        FlatButton(
                                          splashColor: Theme.of(context).primaryColor.withOpacity(0.3),
                                          child: Text(
                                            "Cancel",
                                            style: TextStyle(color: Theme.of(context).primaryColor),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        FlatButton(
                                          splashColor: Theme.of(context).primaryColor.withOpacity(0.3),
                                          child: Text("Delete",
                                              style: TextStyle(color: Theme.of(context).primaryColor)),
                                          onPressed: () {
                                            Auth().deleteMediaFile(widget.data, globals.UrlList[index]);
                                            setState(() {
                                              globals.UrlList.removeAt(index);
                                            });
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    ));
                              }),

                        ],
                      ),
                      SizedBox(height: 10,),

                    ],
                  ),
                ),
              );
            },
          itemCount: globals.UrlList.length,
        )

    );
  }

  FirebaseStorage storage = FirebaseStorage(
    storageBucket : "gs://mediphile-a66a9.appspot.com/",
  );

  Future<String> uploadPicture(BuildContext context, File image) async{

    FirebaseUser userData = await FirebaseAuth.instance.currentUser();
    String uid = userData.uid;

    StorageReference firebaseStorageRef = storage.ref().child("$uid/media/$name/$postId.jpg");
    StorageUploadTask uploadTask = firebaseStorageRef.putFile(image);
    StorageTaskSnapshot taskSnapshot=await uploadTask.onComplete;
    var downloadUrl = await taskSnapshot.ref.getDownloadURL();

    print(downloadUrl);
    setState(() {
      print("Camera Captured Image uploaded");
      getUrl = downloadUrl;
      Auth().createMediaUrlList(name, getUrl);
      //profileImage = downloadUrl;
      //print(profileImage);
      //Scaffold.of(context).showSnackBar(SnackBar(content: Text('Profile Picture Uploaded')));
    });

    //return profileImage;
  }

  void selectFile(parentContext) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            color: Color(0xFF737373),
            height: 180.0,
            child: Container(
              decoration: BoxDecoration(
                color: Theme
                    .of(context)
                    .canvasColor,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(20),
                  topRight: const Radius.circular(20),
                ),
              ),
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.camera_alt),
                    title: Text("Camera"),
                    onTap: () => _captureImage(),
                  ),
                  ListTile(
                    leading: Icon(Icons.photo),
                    title: Text("Gallery"),
                    onTap: () => _selectFromGallery(),
                  ),

                ],
              ),
            ),
          );
        }
    );
  }

  Future _selectFromGallery() async {
    //final _storage = FirebaseStorage.instance;

    Navigator.pop(context);
    final _picker = ImagePicker();
    PickedFile image;

    //Check Permissions
    await Permission.photos.request();

    var permissionStatus = await Permission.photos.status;

    if (permissionStatus.isGranted) {
      //Select Image
      image = await _picker.getImage(source: ImageSource.gallery);
      //var file = File(image.path);

      file = File(image.path);


      if (image != null) {
        uploadPicture(context, file);

      } else {
        print('No Path Received');
      }
    } else {
      print('Grant Permissions and try again');
    }


    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LoadingPage(
            data: widget.data,
          );
        },
      ),
    );
    Future.delayed(const Duration(milliseconds: 5000),() {
      Auth().getMyMediaUrlList(widget.data);
    });

  }    @override

  Future _captureImage() async {
    Navigator.pop(context);
    final _storage = FirebaseStorage.instance;
    final _picker = ImagePicker();
    PickedFile image;

    //Check Permissions
    await Permission.camera.request();

    var permissionStatus = await Permission.camera.status;

    //if (permissionStatus.isGranted) {
    //Select Image
    image = await _picker.getImage(source: ImageSource.camera);
    file = File(image.path);

    if (image != null) {
      //Upload to Firebase
      uploadPicture(context, file);

    } else {
      print('No Path Received');
    }


    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LoadingPage(
            data: widget.data,
          );
        },
      ),
    );
    Future.delayed(const Duration(milliseconds: 17000),() {
      Auth().getMyMediaUrlList(widget.data);
    });
  }
    void initState() {
      super.initState();
      Future.delayed(const Duration(milliseconds: 7000),() {
        circularProgress();
      });
        imgRef = Firestore.instance.collection('imageURLs');
    }

}