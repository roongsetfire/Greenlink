import 'package:flutter/material.dart';
import 'package:project_bin/Checklist/checklistpage1.dart';
import 'package:project_bin/Signup/Map_AddLocation.dart';
import 'package:project_bin/Signup/Signup.dart';
import 'package:project_bin/Widget-Other/Setting.dart';
import 'package:project_bin/Widget-Other/Notification.dart';
import 'package:project_bin/login/login_Firstpage.dart';

// ชื่อ route แต่ละตัว
final Map<String, WidgetBuilder> routes = {
  '/SignUp': (BuildContext context) => SignUp(),
  '/Login': (BuildContext context) => LoginFirstPage(),
  '/MapSignUp': (BuildContext context) => MapSignUp(),
  '/Checklist1': (BuildContext context) => Checklist1(),
  '/Setting': (BuildContext context) => Setting(),
  '/Notification': (BuildContext context) => Notificate(),
};
