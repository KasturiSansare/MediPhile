
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:medapp/Config.dart';
import 'package:medapp/Global_Variables.dart' as globals;
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class Auth{
  static const String idScreen = "auth";
  List Records;
  List<String> MyRecords = List<String>();
  List<String> media = List<String>();
  List<String> urlList = List<String>();


  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  MedicalHistoryApp _currentUser;

  Future<String> getCurrentUID() async{
    return _firebaseAuth.currentUser().toString();
  }

  Future<String> getUID() async{
    FirebaseUser userData = await FirebaseAuth.instance.currentUser();
    return userData.uid;
  }

  Future<void> saveAndLaunchFile(List<int> bytes, String fileName) async {
    final path = (await getExternalStorageDirectory()).path;
    final file = File('$path/$fileName');
    await file.writeAsBytes(bytes, flush: true);
    OpenFile.open('$path/$fileName');

  }

  /*Future<void> userSetup(String displayName, String email) async{
    CollectionReference users = await Firestore.instance.collection('Users');
    FirebaseUser userData = await _firebaseAuth.currentUser();
    users.add({
      'displayName': displayName,
      'email' : email,
      'uid': getCurrentUID(),
    });
    return;
  }*/


  Future<void> userFirstName(String firstName, String lastName, String email, String phone_no, String home_no,
      String dob, String age, String address, String gender, String status, String bg, String url) async{

    FirebaseUser userData = await FirebaseAuth.instance.currentUser();
    Firestore.instance
        .collection('Users').document(userData.uid)
        .collection('PersonalInformation').document('personal').setData({
      'FirstName': firstName,
      'LastName' : lastName,
      'Email' : email,
      'PhoneNumber' : phone_no,
      'HomeNumber' : home_no,
      'DOB' : dob,
      'Age' : age,
      'Address' : address,
      'Gender' : gender,
      'MaritialStatus' : status,
      'BloodGroup' : bg,
      'AvatarUrl': url,

    });
    return;
  }


  // ignore: missing_return
  Future<void> getMyList() async{

    FirebaseUser userData = await FirebaseAuth.instance.currentUser();

    DatabaseReference databaseReference = FirebaseDatabase.instance.reference();

    var listRef = databaseReference.child('users').child(userData.uid).child('domains');
    listRef.once().then((DataSnapshot dataSnapshot)
    {
      //print('$userData.uid');
      Map<dynamic, dynamic> map = dataSnapshot.value;

      if(map==null)
        {
          //print('---------------------------------Enter if $map--------------------------------');
          return 0;
        }
      else{

        //List<Weight> weightData = List.from(weights.map((key, value) => Weight(key, value)))
        //globals.MyRecords.add(map.e);
                //.entries.map( (entry) => (entry.value).toList());
        //print('---------------------------------Enter if $map--------------------------------');
        //map.entries.forEach((e) => globals.MyRecords.add(e.value.toString()));
        //map.entries.forEach((e) => globals.MyRecords.add(e.value));

        map.forEach((key, values) {
          MyRecords.add(values);
        });

        globals.MyRecords = MyRecords;
        //print('---------------------------------My List: --------------------------------');
      }
      print('Get-------------------$MyRecords');
    });
  }

  Future<void> createMyList(String name) async{
    FirebaseUser userData = await FirebaseAuth.instance.currentUser();

    int flag = 0;
    DatabaseReference databaseReference = FirebaseDatabase.instance.reference();
    getMyList();
    var listRef = databaseReference.child('users').child(userData.uid).child('domains');

    listRef.once().then((DataSnapshot dataSnapshot)
    {
      //print('$userData.uid       $dataSnapshot');
      Map<dynamic, dynamic> map = dataSnapshot.value;
      if(name == "General History")
        {
          var general = "AAAA";

        }

      if(map==null)
        {
          print('------------------$name');
          var domainList = listRef.push();
          domainList.set(name);
        }
      else
        {
          map.forEach((key, value) {
           if(value == name)
            {
              flag = 1;
            }
          });
          if(flag == 0)
            {
              MyRecords.add(name);
              var domainList = listRef.push();
              domainList.set(name);
            }
        }
      print('Local list ----------- $MyRecords');
      globals.MyRecords = MyRecords;
      print('Global list --------- ${globals.MyRecords}');
    });

  }

  Future<void> getMyMediaList() async{

    FirebaseUser userData = await FirebaseAuth.instance.currentUser();

    DatabaseReference databaseReference = FirebaseDatabase.instance.reference();

    var listRef = databaseReference.child('users').child(userData.uid).child('media');
    listRef.once().then((DataSnapshot dataSnapshot)
    {
      //print('$userData.uid');
      Map<dynamic, dynamic> map = dataSnapshot.value;

      if(map==null)
      {
        //print('---------------------------------Enter if $map--------------------------------');
        return 0;
      }
      else{

        //List<Weight> weightData = List.from(weights.map((key, value) => Weight(key, value)))
        //globals.MyRecords.add(map.e);
        //.entries.map( (entry) => (entry.value).toList());
        //print('---------------------------------Enter if $map--------------------------------');

        //map.entries.forEach((e) => globals.MyRecords.add(e.value.toString()));
        //map.entries.forEach((e) => globals.MyRecords.add(e.value));

        map.forEach((key, values) {
          media.add(values);
        });

        globals.Media = media;
        //print('---------------------------------My List: --------------------------------');

      }

      print('Get-------------------$media');
    });
  }

  Future<void> createMyMediaList(String name) async{
    FirebaseUser userData = await FirebaseAuth.instance.currentUser();

    int flag = 0;
    DatabaseReference databaseReference = FirebaseDatabase.instance.reference();
    getMyMediaList();
    var listRef = databaseReference.child('users').child(userData.uid).child('media');

    listRef.once().then((DataSnapshot dataSnapshot)
    {
      //print('$userData.uid       $dataSnapshot');
      Map<dynamic, dynamic> map = dataSnapshot.value;

      //print('MAP=====================================$map');

      if(map==null)
      {
        print('------------------$name');
        var domainList = listRef.push();
        domainList.set(name);
      }
      else
      {
        map.forEach((key, value) {
          if(value == name)
          {
            flag = 1;
            //MyRecords.add(name);
          }

        });
        if(flag == 0)
        {
          media.add(name);
          var domainList = listRef.push();
          domainList.set(name);
        }
      }
      print('Local Media list ----------- $media');
      globals.Media = media;
      print('Global Media list --------- ${globals.Media}');
    });
    //domainList.onChildAdded;

    /*  DocumentReference documentReference =


    Records.add(name);

    Firestore.instance.collection('Users').document(userData.uid).setData({
      'Records':Records,
    });
    //Map<List, String> records = {MyRecords:name};

    documentReference.setData(
     { "domain":Records,}
    ).whenComplete(() {
      print("$name added");
    });*/
    //return;
  }

  Future<void> getMyMediaUrlList(String name) async{

    FirebaseUser userData = await FirebaseAuth.instance.currentUser();

    DatabaseReference databaseReference = FirebaseDatabase.instance.reference();

    var listRef = databaseReference.child('users').child(userData.uid).child(name);
    listRef.once().then((DataSnapshot dataSnapshot)
    {
      Map<dynamic, dynamic> map = dataSnapshot.value;

      if(map==null)
      {
        return 0;
      }
      else
        {
        map.forEach((key, values) {
          urlList.add(values);
        });
        globals.UrlList = urlList;

      }
      print('Get-------------------$urlList');
    });
  }

  Future<void> createMediaUrlList(String name, String url) async{
    FirebaseUser userData = await FirebaseAuth.instance.currentUser();


    DatabaseReference databaseReference = FirebaseDatabase.instance.reference();

    var listRef = databaseReference.child('users').child(userData.uid).child(name);

    listRef.once().then((DataSnapshot dataSnapshot)
    {
      //print('$userData.uid       $dataSnapshot');
      Map<dynamic, dynamic> map = dataSnapshot.value;

        var domainList = listRef.push();
        domainList.set(url);


      print('Local list ----------- $urlList');
      globals.MyRecords = urlList;
      print('Global list --------- ${globals.UrlList}');
  });
    //domainList.onChildAdded;

    /*  DocumentReference documentReference =


    Records.add(name);

    Firestore.instance.collection('Users').document(userData.uid).setData({
      'Records':Records,
    });
    //Map<List, String> records = {MyRecords:name};

    documentReference.setData(
     { "domain":Records,}
    ).whenComplete(() {
      print("$name added");
    });*/
    //return;
  }

  Future<void> reminder(String pillName, String pillAmount, String type, int noOfWeeks, String form, DateTime dob, int time) async{

    FirebaseUser userData = await FirebaseAuth.instance.currentUser();
    Firestore.instance
        .collection('Users').document(userData.uid)
        .collection('Reminder').document('reminder').setData({
      'PillName': pillName,
      'PillAmount' : pillAmount,
      'Type' : type,
      'NoOfWeeks' : noOfWeeks,
      'Form' : form,
      'Date' : dob,
      'Time' : time,

    });
    return;
  }

  Future<void> generalHistory(String fullName, String weight, String height, String occupation, String noOfChildren, String insurance,
      List disease, List allergies, String alcohol, String smoking, String caffeine, String tobacco, String implants, String surgeries,
      String medications, String religiousPractices, String specificReligiousPractices, String menstrualCycle, String pregnancy, String physicalDisability, List family) async
  {
    FirebaseUser userData = await FirebaseAuth.instance.currentUser();
    Firestore.instance
        .collection('Users').document(userData.uid)
        .collection('GeneralHistory').document('GeneralHistory').setData({
      'FullName':fullName,
      'Weight':weight,
      'Height': height,
      'Occupation':occupation,
      'NoOfChildren':noOfChildren,
      'Insurance':insurance,
      'Diseases': disease,
      'Allergies': allergies,
      'AlcoholConsumption':alcohol,
      'Smoking':smoking,
      'Caffeine':caffeine,
      'Tobacco':tobacco,
      'Implants':implants,
      'Surgeries' : surgeries,
      'Meds': medications,
      'ReligiousPractices': religiousPractices,
      'SpecificReligiousPactices':specificReligiousPractices,
      'MenstrualCycle': menstrualCycle,
      'Pregnancy':pregnancy,
      'Family history' : family,
    });
  }

  FirebaseStorage storage = FirebaseStorage(
    storageBucket: "gs://mediphile-a66a9.appspot.com/",
  );

  /*Future<String> uploadPdf(File image) async {
    //String filename = basename("user/profile/${first}");
    FirebaseUser userData = await FirebaseAuth.instance.currentUser();
    String uid = userData.uid;

    StorageReference firebaseStorageRef = storage.ref().child("$uid/pdf/$image");
    StorageUploadTask uploadTask = firebaseStorageRef.putFile(image);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    var downloadUrl = await taskSnapshot.ref.getDownloadURL();

    print('-----------------------------------------------PDF-----------------------------------------');

  }*/

  Future<void> allergology(List history, String surgeries, String newProblems, String symptoms, String medications) async
  {
    print('Enter allergology');
    FirebaseUser userData = await FirebaseAuth.instance.currentUser();

    Firestore.instance
        .collection('Users').document(userData.uid)
        .collection('Allergology').document('Allergology').setData({
      'Family history' : history,
      'Surgeries' : surgeries,
      'Problems': newProblems,
      'Symptoms': symptoms,
      'Meds': medications,
    });

    /*final pdf = pw.Document();

    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Text("Hello World"),
          ); // Center
        }
        )
    ); // Page


    final file = File("allergology.pdf");
    await file.writeAsBytes(await pdf.save());

    uploadPdf(file);
*/

  }

  Future<void> cardiology(String med, String service, String family, String surgery, String newProblems,
      String symptoms, String medications, List following, List services, List familyhistory) async
  {
    FirebaseUser userData = await FirebaseAuth.instance.currentUser();
    Firestore.instance
        .collection('Users').document(userData.uid)
        .collection('Cardiology').document('Cardiology').setData({
      'Past medical history': med,
      'Medical service' : services,
      'Medical service others': service,
      'Family history' : familyhistory,
      'Extra Family History': family,
      'Any Previous Surgeries': surgery,
      'Diseases' : following,
      'Problems': newProblems,
      'Symptoms': symptoms,
      'Meds': medications,
    });
  }

  Future<void> dentistry(String gumtTreatment, String gumBleed, String brush, String floss, String previous, String surgery) async
  {
    FirebaseUser userData = await FirebaseAuth.instance.currentUser();
    Firestore.instance
        .collection('Users').document(userData.uid)
        .collection('Dentistry').document('Dentistry').setData({
      'Gum treatment' : gumtTreatment,
      'Gums Bleed' : gumBleed,
      'Brush' : brush,
      'Floss' : floss,
      'Previous Problem' : previous,
      'Surgeries' : surgery,
    });
  }


  Future<void> dermatology(String med, String skin, String family, String surgery, String water,
      String newProblems, String symptoms, String medications) async
  {
    FirebaseUser userData = await FirebaseAuth.instance.currentUser();
    Firestore.instance
        .collection('Users').document(userData.uid)
        .collection('Dermatology').document('Dermatology').setData({
      'Past medical history': med,
      'Medical Skin history': skin,
      'Family History': family,
      'Any Previous Surgeries': surgery,
      'glass of water': water,
      'Problem': newProblems,
      'Symptoms': symptoms,
      'Meds': medications,
    });
  }

  Future<void> endocrinology( String ongoing, String pain,String painMeds, String painControl, String painInducer,String painEffects, String pastSurgery,String newProblems,String symptoms, String medications) async
  {
    FirebaseUser userData = await FirebaseAuth.instance.currentUser();
    Firestore.instance
        .collection('Users').document(userData.uid)
        .collection('Endocrinology').document('Endocrinology').setData({
      'PainOngoing' : ongoing,
      'Pain Location And Intensity' : pain,
      'Pain Relief Meds' : painMeds,
      'pain control' : painControl,
      'pain inducer' : painInducer,
      'Effects of pain' : painEffects,
      'Surgeries' : pastSurgery,
      'Problems' : newProblems,
      'Symptoms' : symptoms,
      'Treatments' : medications,

    });
  }

  Future<void> gastroenterology(List present, List procedures, List screening, String newProblems, String symptoms, String medications) async
  {
    FirebaseUser userData = await FirebaseAuth.instance.currentUser();
    Firestore.instance
        .collection('Users').document(userData.uid)
        .collection('Gastroenterology').document('Gastroenterology').setData({
      'Present Medical Conditions' : present,
      'Procedures' : procedures,
      'New screenings' : screening,
      'Problems': newProblems,
      'Symptoms': symptoms,
      'Medication': medications,
    });
  }

  Future<void> gynecology(String age, String noOfDays, String flow, String tamponsADay, String discomfort, String bleed,
      String menstrualStop, String afterStop, String birthControl, String pastMethods, String length, String reason, String HPV,
      String papSmear, String mammogram, String dexa, String colonoscopy, String therapy, List ph, String pregnancies, String vaginalBirth,
      String ectopics, String abortions, String children, String cSection, String miscarriages, String prevSurgeries,
      String newProblems, String symptoms, String medications) async
  {
    FirebaseUser userData = await FirebaseAuth.instance.currentUser();
    Firestore.instance
        .collection('Users').document(userData.uid)
        .collection('Gynecology').document('Gynecology').setData({
      'First Period' : age,
      'Days you bleed' : noOfDays,
      'Menstrual Flow' : flow,
      'No of tampons' : tamponsADay,
      'Discomfort': discomfort,
      'Bleed' : bleed,
      'Menstrual Stop' : menstrualStop,
      'Bleed after menstrual stop' : afterStop,
      'Birth Control method' : birthControl,
      'Past method' : pastMethods,
      'Length' : length,
      'Reason' : reason,
      'HPV Vaccine' : HPV,
      'Pap Smear' : papSmear,
      'Mammogram' : mammogram,
      'DEXA' : dexa,
      'Colonoscopy' : colonoscopy,
      'Therapy' : therapy,
      'Personal History' : ph,
      'Pregnancies' : pregnancies,
      'Vaginal Birth' : vaginalBirth,
      'Ectopics' : ectopics,
      'Abortions' : abortions,
      'Children' : children,
      'C-Sections' : cSection,
      'Miscarriages' : miscarriages,
      'Previous Surgeries' : prevSurgeries,
      'Problems': newProblems,
      'Symptoms': symptoms,
      'Medication': medications,
    });
  }

  Future<void> hematology(String surgery, String newProblems, String symptoms, String medications) async
  {
    FirebaseUser userData = await FirebaseAuth.instance.currentUser();
    Firestore.instance
        .collection('Users').document(userData.uid)
        .collection('Hematology').document('Hematology').setData({
      'Surgery': surgery,
      'Problems': newProblems,
      'Symptoms': symptoms,
      'Medication': medications,
    });
  }

  Future<void> nephrology(String surgery, String newProblems, String symptoms, String medications) async
  {
    FirebaseUser userData = await FirebaseAuth.instance.currentUser();
    Firestore.instance
        .collection('Users').document(userData.uid)
        .collection('Nephrology').document('Nephrology').setData({
      'Surgery': surgery,
      'Problems': newProblems,
      'Symptoms': symptoms,
      'Medication': medications,
    });
  }

  Future<void> neurology(List pastProblems, String otherproblems, String pastsurgery, String newProblems,
      String symptoms, String medications) async
  {
    FirebaseUser userData = await FirebaseAuth.instance.currentUser();
    Firestore.instance
        .collection('Users').document(userData.uid)
        .collection('Neurology').document('Neurology').setData({
      'Past Problems' : pastProblems,
      'Other Problems': otherproblems,
      'Past Surgery': pastsurgery,
      'Problems': newProblems,
      'Symptoms': symptoms,
      'Medication': medications,
    });
  }

  Future<void> oncology(String surgeryDate, String surgeryType,String surgeryResult, String type, String tumorType,String stage,
      String otherProblems,String otherInfo, String newProblem, String symptoms, String medications) async
  {
    FirebaseUser userData = await FirebaseAuth.instance.currentUser();
    Firestore.instance
        .collection('Users').document(userData.uid)
        .collection('Oncology').document('Oncology').setData({

      'Surgery Date' : surgeryDate,
      'Surgery Type' : surgeryType,
      'Surgery Result' : surgeryResult,
      'Primary Cancer Type':type,
      'Tumor Type' : tumorType,
      'Stage' : stage,
      'Other Problems' : otherProblems,
      'Other Info':otherInfo,
      'Problems' : newProblem,
      'Symptoms' : symptoms,
      'Medication' : medications,

    });
  }

  Future<void> opthalmology(String glasses, String rightEye, String leftEye,  String contacts,
      String surgery, List history, String newProblems, String symptoms, String medications) async
  {
    FirebaseUser userData = await FirebaseAuth.instance.currentUser();
    Firestore.instance
        .collection('Users').document(userData.uid)
        .collection('Opthalmology').document('Opthalmology').setData({
      'Glasses' : glasses,
      'Right eye' : rightEye,
      'Left eye' : leftEye,
      'Contacts' : contacts,
      'Surgery' : surgery,
      'Eye history' : history,
      'Problems': newProblems,
      'Symptoms': symptoms,
      'Medication': medications,
    });
  }

  Future<void> orthopedics(String fracture, String fractureSpecify, String seriousInjuries,
      String injuriesSpecify, String previous, String previousSpecify, List past, String pastSpecify,
      String newProblems, String symptoms, String medications) async
  {
    FirebaseUser userData = await FirebaseAuth.instance.currentUser();
    Firestore.instance
        .collection('Users').document(userData.uid)
        .collection('Orthopedics').document('Orthopedics').setData({
      'Fracture/Dislocations' : fracture,
      'Fracture Specifications' : fractureSpecify,
      'Serious Injuries' : seriousInjuries,
      'Injuries Specify' : injuriesSpecify,
      'Previous Surgeries' : previousSpecify,
      'Past Medications' : past,
      'Past Specifications' : pastSpecify,
      'Problems': newProblems,
      'Symptoms': symptoms,
      'Medication': medications,
    });
  }

  Future<void> otaryngology(List ear, String earOther, List nose, String noseOther, List throat, String throatOther,
      String previous, String newProblems, String symptoms, String medications) async
  {
    FirebaseUser userData = await FirebaseAuth.instance.currentUser();
    Firestore.instance
        .collection('Users').document(userData.uid)
        .collection('Otaryngology').document('Otaryngology').setData({
      'Ear' : ear,
      'Ear Problem' : earOther,
      'Nose' : nose,
      'Nose Problem' : noseOther,
      'Throat' : throat,
      'Throat Problem' : throatOther,
      'Previous problems' : previous,
      'Problems': newProblems,
      'Symptoms': symptoms,
      'Medication': medications,
    });
  }

  Future<void> others(String otherproblems, String pastsurgery, String newProblems, String symptoms, String medications) async
  {
    FirebaseUser userData = await FirebaseAuth.instance.currentUser();
    Firestore.instance
        .collection('Users').document(userData.uid)
        .collection('Others').document('Others').setData({
      'Other Problems': otherproblems,
      'Past Surgery': pastsurgery,
      'Problems': newProblems,
      'Symptoms': symptoms,
      'Medication': medications,
    });
  }

  Future<void> pediatrics(String childName, String childDOB, String childGender, String childLiveWith, String parent1Name,
      String parent1Age, String parent1CurrentHealth, String parent1Race, String parent2Name,
      String parent2Age, String parent2CurrentHealth, String parent2Race, String maritialStatus, String otherChildren,
      String religiousPractices, String religiousPracticesExplain, String tobacco, List history, String otherHistory,
      List prenatalHistory, String prenatalHistoryOther, String pregnancyMedications, String pregnancyMedicationsKind,
      String fertilityTreatment, String fertilityTreatmentKind, String birthPlace, String birthTime, String earlyLate,
      String deliveryMethod, String childBirthWeight, List childCurrentProblems, String prevSurgeries, String otherproblems,
      String BCG, String polio1stDose, String hepatitisB1stDose, String DPT1stDose, String polio2ndDose, String hepatitisB2ndDose,
      String DPT2ndDose, String polio3rdDose, String DPT3rdDose, String polio4thDose, String polio5thDose, String hepatitisB3rdDose,
      String measles, String MMR, String DPT1stBoosterDose, String polio6thDose, String DPT2ndBoosterDose, String polio7thDose,
      String MMRBooster, String TD3rdBooster, String TDACellular, List optionalVaccines,
      String newProblems, String symptoms, String medications) async
  {
    FirebaseUser userData = await FirebaseAuth.instance.currentUser();
    Firestore.instance
        .collection('Users').document(userData.uid)
        .collection('Pediatrics').document('Pediatrics').setData({
      'ChildName' : childName,
      'ChildDOB' : childDOB,
      'ChildGender' : childGender,
      'ChildLiveWith' : childLiveWith,
      'Parent1Name' : parent1Name,
      'Parent1Age' : parent1Age,
      'Parent1CurrentHealth' : parent1CurrentHealth,
      'Parent1Race' : parent1Race,
      'Parent2Name' : parent2Name,
      'Parent2Age' : parent2Age,
      'Parent2CurrentHealth' : parent2CurrentHealth,
      'Parent2Race' : parent2Race,
      'MaritialStatus' : maritialStatus,
      'OtherChildren' : otherChildren,
      'ReligiousPractices' : religiousPractices,
      'ReligiousPracticesExplanation' : religiousPracticesExplain,
      'Tobacco' : tobacco,
      'History' : history,
      'OtherHistory' : otherHistory,
      'PrenatalHistory' : prenatalHistory,
      'PrenatalHistoryOther' : prenatalHistoryOther,
      'PregnancyMedications' : pregnancyMedications,
      'PregnancyMedicationsKind' : pregnancyMedicationsKind,
      'FertilityTreatment' : fertilityTreatment,
      'FertilityTreatmentKind' : fertilityTreatmentKind,
      'BirthPlace' : birthPlace,
      'BirthTime' : birthTime,
      'EarlyLate' : earlyLate,
      'DeliveryMethod' : deliveryMethod,
      'ChildBirthWeight' : childBirthWeight,
      'ChildHistory' : childCurrentProblems,
      'PreviousSurgery' : prevSurgeries,
      'Other Problems': otherproblems,
      'BCG' : BCG,
      'Polio1stDose' : polio1stDose,
      'HepatitisB1stDose' : hepatitisB1stDose,
      'DPT1stDose' : DPT1stDose,
      'Polio2stDose' : polio2ndDose,
      'HepatitisB2ndDose' : hepatitisB2ndDose,
      'DPT2ndDose' : DPT2ndDose,
      'Polio3rdDose' : polio3rdDose,
      'DPT3rdDose' : DPT3rdDose,
      'Polio4thDose' : polio4thDose,
      'Polio5thDose' : polio5thDose,
      'HepatitisB3rdDose' : hepatitisB3rdDose,
      'Measles' : measles,
      'MMR' : MMR,
      'DPT1srBooster' : DPT1stBoosterDose,
      'Polio6thDose' :polio6thDose,
      'DPT2ndBoosterDose' : DPT2ndBoosterDose,
      'Polio7thDose' : polio7thDose,
      'MMRBooster' : MMRBooster,
      'TD3rdBoosterDose' : TD3rdBooster,
      'TDACellularPertusis' : TDACellular,
      'OptionalVaccines' : optionalVaccines,
      'Problems': newProblems,
      'Symptoms': symptoms,
      'Medication': medications,
    });
  }

  Future<void> plasticsurgery(String spec, String description, String newProblems, String symptoms, String medications) async
  {
    FirebaseUser userData = await FirebaseAuth.instance.currentUser();
    Firestore.instance
        .collection('Users').document(userData.uid)
        .collection('Plastic Surgery').document('Plastic surgery').setData({
      'Specification': spec,
      'Description': description,
      'Problems': newProblems,
      'Symptoms': symptoms,
      'Meds': medications,
    });
  }

  Future<void> pregnancy(String motherName, String motherDOB, String motherBG, String fatherName, String fatherDOB, String fatherBG,
      String together, String failed, String reason, String anyHelp, String helpReason, String prevSurgeries, String doctor, String doctorFar,
      List problem, String otherproblems, String childName, String currentAge, String gender, String time, String lateEarly,
      String delivery, String labourProblems, String labourReason, String deliveryProblem, String deliveryProblemReason, String nicu, String nicuTime,
      String feedingProblems, String ongoingPregnancy, String expectedDue, List pregnancyProblems, String newProblems) async
  {
    FirebaseUser userData = await FirebaseAuth.instance.currentUser();
    Firestore.instance
        .collection('Users').document(userData.uid)
        .collection('Pregnancy').document('Pregnancy').setData({
      'Mother Name' : motherName,
      'Mother DOB' : motherDOB,
      'Mother BG' : motherBG,
      'Father Name' : fatherName ,
      'Father DOB' : fatherDOB,
      'Father BG' : fatherBG,
      'Together' : together,
      'Failed Pregnancies' : failed,
      'Reason' : reason,
      'External help' : anyHelp,
      'External help reason' : helpReason,
      'Previous Surgeries' : prevSurgeries,
      'Care of Doctor' : doctor,
      'How far' : doctorFar,
      'Pregnancy Problems' : problem,
      'Other Problems' : otherproblems,
      'Child Name' : childName,
      'Child Age' : currentAge,
      'Child Gender' : gender,
      'Born time' : time,
      'Late/Early' : lateEarly,
      'Delivery' : delivery,
      'Baby Labour Problem' : labourProblems,
      'Baby Labour Problem Reason' : labourReason,
      'Baby Delivery Problem' : deliveryProblem,
      'Baby Delivery Problem Reason' : deliveryProblemReason,
      'NICU' : nicu,
      'NICU time' : nicuTime,
      'Baby feeding problems' : feedingProblems,
      'Ongoing how far' : ongoingPregnancy ,
      'Expected Due Date' : expectedDue,
      'Ongoing Pregnancy Problems' : pregnancyProblems,
      'Problems During Pregnancy': newProblems,
    });
  }

  Future<void> psychiatry(String handedness, String psychiatricPhysician, String treatmentPeriod, String pastHospitalName,
      String pastDatesInpatient, String pastReason, String pastOutcome, String selfHarm, String suicideAttempts,
      String pastPsychiatricDiagnosis, String currentPsychiatricDiagnosis, String livingConditions, String weapons, String exercise, String traumaticEvents,
      String sourcesOfStress, String legalIssues, String leisure, List history, String otherHistory, String ptclinician,
      String ptType, String ptStarteDate, String ptEndDate, String outcome,String newProblems, String symptoms, String medications) async
  {
    FirebaseUser userData = await FirebaseAuth.instance.currentUser();
    Firestore.instance
        .collection('Users').document(userData.uid)
        .collection('Psychiatry').document('Psychiatry').setData({
      'Handedness' : handedness,
      'ReferringPsychiatricPhysician' : psychiatricPhysician,
      'Treatment' : treatmentPeriod,
      'PastHospitalName' : pastHospitalName,
      'PastDateInpatient' : pastDatesInpatient,
      'PastReason' : pastReason,
      'PastOutcome' : pastOutcome,
      'Self-Harm' : selfHarm,
      'SuicideAttempts' : suicideAttempts,
      'PastPsychiatricDiagnosis' : pastPsychiatricDiagnosis,
      'CurrentPsychiatricDiagnosis' : currentPsychiatricDiagnosis,
      'CurrentLivingConditions' : livingConditions,
      'Weapons' : weapons,
      'Exercise' : exercise,
      'TraumaticEvents' : traumaticEvents,
      'CurrentSourceofStress' : sourcesOfStress,
      'ArrestCasesLegalIssues' : legalIssues,
      'Leisure' : leisure,
      'History' : history,
      'OtherHistory' : otherHistory,
      'PTPsychologist' : ptclinician,
      'PTTypeofTherapy' : ptType,
      'PTStartDate' : ptStarteDate,
      'PTEndDate' : ptEndDate,
      'Outcome': outcome,
      'Problems': newProblems,
      'Symptoms': symptoms,
      'Medication': medications,
    });
  }

  Future<void> pulmonology(List history, String otherproblems, String pastsurgery, String newProblems, String symptoms, String medications) async
  {
    FirebaseUser userData = await FirebaseAuth.instance.currentUser();
    Firestore.instance
        .collection('Users').document(userData.uid)
        .collection('Pulmonology').document('Pulmonology').setData({
      'History' : history,
      'Other Problems': otherproblems,
      'Past Surgery': pastsurgery,
      'Problems': newProblems,
      'Symptoms': symptoms,
      'Medication': medications,
    });
  }

  Future<void> rheumatology(String fracture, String seriousInjuries, List past, String pastSpecify,
      String previousSurgeries, String newProblems, String symptoms, String medications) async
  {
    FirebaseUser userData = await FirebaseAuth.instance.currentUser();
    Firestore.instance
        .collection('Users').document(userData.uid)
        .collection('Rheumatology').document('Rheumatology').setData({
      'Fracture/Dislocations' : fracture,
      'Serious Injuries' : seriousInjuries,
      'Past' : past,
      'Past Specifications' : pastSpecify,
      'Previous Surgeries' : previousSurgeries,
      'Problems': newProblems,
      'Symptoms': symptoms,
      'Medication': medications,
    });
  }

  Future<void> urology(List history, String otherProblems, String pastSurgery, String newProblems, String symptoms, String medications) async
  {
    FirebaseUser userData = await FirebaseAuth.instance.currentUser();
    Firestore.instance
        .collection('Users').document(userData.uid)
        .collection('Urology').document('Urology').setData({
      'History' : history,
      'Other Problems': otherProblems,
      'Past Surgery': pastSurgery,
      'Problems': newProblems,
      'Symptoms': symptoms,
      'Medication': medications,
    });
  }

  Future<void> createMedia(String mediaUrl, String description, String postId, DateTime dateTime) async{
    FirebaseUser userData = await FirebaseAuth.instance.currentUser();

    Firestore.instance
        .collection('Users').document(userData.uid)
        .collection('Media').document(postId).setData({
      'postId' : postId,
      'mediaUrl':mediaUrl,
      'description': description,
      'datetime' : dateTime,

    });

  }



  Future<void> deleteMyRecords(item) async
  {
    FirebaseUser userData = await FirebaseAuth.instance.currentUser();
    DatabaseReference databaseReference = FirebaseDatabase.instance.reference();

    var docRef = Firestore.instance.collection("Users").document(userData.uid).collection(item);

    var listRef = databaseReference.child('users').child(userData.uid).child('domains');
    listRef.once().then((DataSnapshot dataSnapshot)
    {
      Map<dynamic, dynamic> map = dataSnapshot.value;
      if(map==null)
      {
        return 0;
      }
      else{
        map.forEach((key, values) {
          if(values == item)
          {
            databaseReference.child('users').child(userData.uid).child('domains').child(key).remove();
          }
        });}
    });

    docRef.document(item).delete();
  }

  Future<void> deleteMedia(item) async
  {
    FirebaseUser userData = await FirebaseAuth.instance.currentUser();
    DatabaseReference databaseReference = FirebaseDatabase.instance.reference();

    var listRef = databaseReference.child('users').child(userData.uid).child('media');
    /*StorageReference storageReference = storage.ref().child(userData.uid).child('media').child(item);

    await storageReference.delete();*/
    databaseReference.child('users').child(userData.uid).child(item).remove();
    listRef.once().then((DataSnapshot dataSnapshot)
    {
      Map<dynamic, dynamic> map = dataSnapshot.value;
      if(map==null)
      {
        return 0;
      }
      else
        {
        map.forEach((key, values) {
          if(values == item)
          {
            databaseReference.child('users').child(userData.uid).child('media').child(key).remove();
            //globals.Media.remove(value);
          }
        });
        }
    });

    //docRef.document(item).delete();
  }

  Future<void> deleteMediaFile(domainName, url) async
  {

    StorageReference storageReference = await FirebaseStorage.instance.getReferenceFromUrl(url);
    await storageReference.delete();

    FirebaseUser userData = await FirebaseAuth.instance.currentUser();
    DatabaseReference databaseReference = FirebaseDatabase.instance.reference();

    var listRef = databaseReference.child('users').child(userData.uid).child(domainName);

    listRef.once().then((DataSnapshot dataSnapshot)
    {
      Map<dynamic, dynamic> map = dataSnapshot.value;
      if(map==null)
      {
        return 0;
      }
      else
      {
        map.forEach((key, values) {
          if(values == url)
          {
            databaseReference.child('users').child(userData.uid).child(domainName).child(key).remove();
            //globals.Media.remove(value);
          }
        });
      }
    });
  }

  Future<void> deleteMyContacts(String name,String number) async
  {
    FirebaseUser userData = await FirebaseAuth.instance.currentUser();

    var docRef = Firestore.instance.collection("Users").document(userData.uid).collection('Contacts');

    docRef.document(name).delete();
    globals.recipents.remove(number);
    print(globals.recipents);
  }


/*Future<void> addMyDisplays(item) async
  {
    FirebaseUser userData = await FirebaseAuth.instance.currentUser();

    var docRef = Firestore.instance.collection("Users").document(userData.uid).collection(item);

    docRef.document(item).delete();
  }*/

 /* Future<int> closedCircle() async{
    FirebaseUser userData = await FirebaseAuth.instance.currentUser();
    DatabaseReference databaseReference = FirebaseDatabase.instance.reference();
    var listRef = databaseReference.child('users').child(userData.uid).child('closeCircle');
    listRef.once().then((DataSnapshot dataSnapshot)
    {
      Map<dynamic, dynamic> map = dataSnapshot.value;
      if(map==null)
      {
        return 0;
      }
      else{
        map.forEach((key, values) {
          MyRecords.add(values);
        });}
    });
  }*/

}

