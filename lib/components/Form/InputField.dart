import 'package:flutter/material.dart';
import 'package:gstock/Data/admin_operations.dart';
import 'package:gstock/Data/famille_operation.dart';
import 'package:gstock/Models/Admin.dart';
import 'package:gstock/Models/famille.dart';
import 'package:gstock/Pages/LoginPage.dart';
import 'package:flutter/foundation.dart';


class InputField extends StatelessWidget {

  final _myNameController = TextEditingController();
  final _myDescriptionController = TextEditingController();

FamilleOperations familleOperations= FamilleOperations();

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

                hintText: "Saisie le nom du famille",
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
            controller: _myDescriptionController,
            decoration: InputDecoration(

                hintText: "Description",
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
              final famille=Famille(
                  _myNameController.text, _myDescriptionController.text);
              familleOperations.createFamille(famille);

            },
            child: Text(
              'Add',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ],
    );
  }
}
