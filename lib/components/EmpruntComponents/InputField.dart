import 'package:flutter/material.dart';
import 'package:gstock/Data/admin_operations.dart';
import 'package:gstock/Data/composant_operation.dart';
import 'package:gstock/Data/emprunt_operations.dart';
import 'package:gstock/Models/Admin.dart';
import 'package:gstock/Models/Emprunt.dart';
import 'package:gstock/Models/composant.dart';
import 'package:gstock/Pages/ProfilePage.dart';
import 'package:gstock/Pages/home_page.dart';
import 'package:intl/intl.dart';

class InputField extends StatelessWidget {

  final _myCompController = TextEditingController();
  final _myNameController = TextEditingController();
  final _myQteController = TextEditingController();
  EmpruntOperations empruntOperations = new EmpruntOperations();
  ComposantOperations composantOperations= new ComposantOperations();


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
            readOnly: true,
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
        Container(
          padding: EdgeInsets.all(18),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.grey)
              )
          ),
          child: TextField(
            obscureText: false,
            controller: _myQteController,
            decoration: InputDecoration(
                hintText: "Enter the quantity",
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
                Emprunt emprunt= Emprunt(des, _myNameController.text, todayDate.toString(),"");
                //Composant comp= Composant.map(composantOperations.searchComposantByDes(des));
                int myQte= int.parse(_myQteController.text);
                  empruntOperations.creatEmprunt(emprunt);
                  composantOperations.updateQtiteComposant(des, myQte);
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
