import 'package:flutter/material.dart';

import 'Pages/LoginPage.dart';
import 'Pages/RegisterPage.dart';


void main()=>runApp(MyApp());
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegisterPage(),

    );

  }
}