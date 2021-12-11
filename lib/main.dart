import 'package:flutter/material.dart';

import 'Pages/LoginPage.dart';
<<<<<<< HEAD
=======
import 'Pages/RegisterPage.dart';
>>>>>>> 55ea0b3 (interface register)

void main()=>runApp(MyApp());
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
<<<<<<< HEAD
      home: LoginPage(),
=======
      home: RegisterPage(),
>>>>>>> 55ea0b3 (interface register)
    );

  }
}