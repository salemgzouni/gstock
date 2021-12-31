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

                hintText: "Enter your name",
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

                hintText: "Prenom",
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
                hintText: "Enter your email",
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
            controller: _myPwdController,
            obscureText: true,
            decoration: InputDecoration(
                hintText: "Enter your password",
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
           onPressed: () {
              Admin admin = Admin(_myNameController.text,_myPrenomController.text, _myEmailController.text, _myPwdController.text);
              adminOperations.createAdmin(admin);
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()),);
           },
           child: Text(
             'Register',
             style: TextStyle(color: Colors.white, fontSize: 20),
           ),
         ),
    ),
      ],
    );
  }
}
