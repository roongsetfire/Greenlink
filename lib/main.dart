import 'package:flutter/material.dart';
import 'package:project_bin/router.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // Root of Application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routes,
      initialRoute: '/Login',
    );
  }
}
