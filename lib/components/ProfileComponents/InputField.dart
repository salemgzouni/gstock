import 'package:flutter/material.dart';
import 'package:gstock/Data/admin_operations.dart';
import 'package:gstock/Models/Admin.dart';
import 'package:gstock/Pages/LoginPage.dart';
import 'package:flutter/foundation.dart';


class InputField extends StatelessWidget {

  final _myNameController = TextEditingController();
  final _myPrenomController = TextEditingController();
  final _myEmailController = TextEditingController();
  final _myPwdController = TextEditingController();


  AdminOperations adminOperations=AdminOperations();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(18),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.grey)
              )
          ),
          child: TextField(
            controller: _myNameController,
            decoration: InputDecoration(

                hintText: "This is your name",
                hintStyle:TextStyle(color: Colors.grey),
                border: InputBorder.none
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(18),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.grey)
              )
          ),
          child: TextField(
            controller: _myPrenomController,
            decoration: InputDecoration(

                hintText: "This is your surname",
                hintStyle:TextStyle(color: Colors.grey),
                border: InputBorder.none
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(18),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.grey)
              )
          ),
          child: TextField(
            controller: _myEmailController,
            decoration: InputDecoration(
                hintText: "This is your email",
                hintStyle:TextStyle(color: Colors.grey),
                border: InputBorder.none
            ),
          ),
        ),
      ],
    );
  }
}
