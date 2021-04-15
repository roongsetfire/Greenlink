import 'package:flutter/material.dart';
import 'package:project_bin/Signup/Signup.dart';
import 'package:project_bin/login/login_Firstpage.dart';

final Map<String, WidgetBuilder> routes = {
  '/SignUp': (BuildContext context) => SignUp(),
  '/Login': (BuildContext context) => LoginFirstPage(),
};
