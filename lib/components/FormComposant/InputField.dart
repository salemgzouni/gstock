import 'package:flutter/material.dart';
import 'package:gstock/Data/admin_operations.dart';
import 'package:gstock/Data/composant_operation.dart';
import 'package:gstock/Models/Admin.dart';
import 'package:gstock/Models/composant.dart';
import 'package:gstock/Models/famille.dart';
import 'package:gstock/Pages/LoginPage.dart';
import 'package:flutter/foundation.dart';


class InputField extends StatelessWidget {

  final _myNameController = TextEditingController();
  final _myDescriptionController = TextEditingController();
  final _myQteController = TextEditingController();

  ComposantOperations composantOperations= ComposantOperations();

  @override
  Widget build(BuildContext context) {
    final des = ModalRoute.of(context)!.settings.arguments as String;
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
            controller: _myNameController,
            decoration: InputDecoration(

                hintText: "Saisie le nom du composant",
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
        Container(
          padding: EdgeInsets.all(18),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.grey)
              )
          ),
          child: TextField(
            controller: _myQteController,
            decoration: InputDecoration(

                hintText: "Quantite",
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
            onPressed: () {
              int n = int.parse(_myQteController.text);
              final composant=Composant(
                   _myNameController.text, _myDescriptionController.text, n, des);
              composantOperations.createCompsant(composant);

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
