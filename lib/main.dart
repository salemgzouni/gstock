import 'package:flutter/material.dart';


import 'Pages/LoginPage.dart';
import 'Pages/RegisterPage.dart';
import 'Pages/ProfilePage.dart';


void main()=>runApp(MyApp());
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),

    );

  }
}