import 'package:flutter/material.dart';
import 'package:project_bin/login_screen/login_Firstpage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // Root of Application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Login First Page",
      debugShowCheckedModeBanner: false,
      home: LoginFirstPage(),
    );
  }
}
