import 'package:flutter/material.dart';
import 'package:gstock/Data/admin_operations.dart';
import 'package:gstock/Data/emprunt_operations.dart';
import 'package:gstock/Models/Admin.dart';
import 'package:gstock/Models/Emprunt.dart';
import 'package:gstock/Pages/ProfilePage.dart';
import 'package:gstock/Pages/home_page.dart';
import 'package:intl/intl.dart';

class InputField extends StatelessWidget {

  final _myCompController = TextEditingController();
  final _myNameController = TextEditingController();
  EmpruntOperations empruntOperations = new EmpruntOperations();



  @override
  Widget build(BuildContext context) {
    final des= ModalRoute.of(context)!.settings.arguments as String;
    print(des);
    final DateFormat formatter = DateFormat('MM/dd/yyyy');
    String todayDate = formatter.format(DateTime.now());
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
            obscureText: false,
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
                Emprunt emprunt= Emprunt(_myCompController.text, _myNameController.text, todayDate.toString(),"");
                empruntOperations.creatEmprunt(emprunt);
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()),);
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
