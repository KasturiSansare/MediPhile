import 'package:meta/meta.dart';

class NotificationSetting {
  String title;
  bool value;
  String val;   //add a field String val here

  NotificationSetting({
    @required this.title,
    this.value = false,
    this.val,     //this as well
  });
}
