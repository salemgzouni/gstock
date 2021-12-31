import 'package:flutter/material.dart';
import 'package:gstock/Data/admin_operations.dart';
import 'package:gstock/Models/Admin.dart';
import 'package:gstock/Pages/ProfilePage.dart';
import 'package:gstock/Pages/home_page.dart';

class InputField extends StatelessWidget {

  final _myCompController = TextEditingController();
  final _myNameController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    final des= ModalRoute.of(context)!.settings.arguments as String;
    print(des);
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
            controller: _myCompController,
            decoration: InputDecoration(
                hintText: des,
                hintStyle:TextStyle(color: Colors.black),
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
            obscureText: true,
            controller: _myNameController,
            decoration: InputDecoration(
                hintText: "Enter your name",
                hintStyle:TextStyle(color: Colors.grey),
                border: InputBorder.none
            ),
          ),
        ),
        SizedBox(height: 20,),
        Container(
          height: 40,
          margin: EdgeInsets.symmetric(horizontal: 50),
          decoration: BoxDecoration(
            color: Colors.cyan[500],
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextButton(
            onPressed: () async {
            },
            child: Text(
              'Add',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        )
      ],
    );
  }
}
