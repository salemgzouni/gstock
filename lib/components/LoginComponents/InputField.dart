import 'package:flutter/material.dart';
import 'package:gstock/Data/admin_operations.dart';
import 'package:gstock/Models/Admin.dart';
import 'package:gstock/Pages/ProfilePage.dart';
import 'package:gstock/Pages/home_page.dart';

class InputField extends StatelessWidget {

  final _myEmailController = TextEditingController();
  final _myPwdController = TextEditingController();

  AdminOperations adminOperations=new AdminOperations();

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
            obscureText: true,
            controller: _myPwdController,
            decoration: InputDecoration(
                hintText: "Enter your password",
                hintStyle:TextStyle(color: Colors.grey),
                border: InputBorder.none
            ),
          ),
        ),
        Container(
          height: 40,
          margin: EdgeInsets.symmetric(horizontal: 50),
          decoration: BoxDecoration(
            color: Colors.cyan[500],
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextButton(
            onPressed: () async {
              if(await adminOperations.searchAdminByEmailMdp(_myEmailController.text,_myPwdController.text)==true){
                Navigator.push(
                  context,MaterialPageRoute(builder: (context) => HomePage()),
                );
              }else{
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("invalid credentials !")));
              }
            },
            child: Text(
              'Login',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        )
      ],
    );
  }
}
