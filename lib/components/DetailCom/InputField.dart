import 'package:flutter/material.dart';
import 'package:gstock/Data/admin_operations.dart';
import 'package:gstock/Data/composant_operation.dart';
import 'package:gstock/Models/Admin.dart';
import 'package:gstock/Models/composant.dart';
import 'package:gstock/Pages/LoginPage.dart';
import 'package:flutter/foundation.dart';


class InputField extends StatelessWidget {

 String x="";
 String y="";
 String z="";
 int w=0;



ComposantOperations composantOperations = ComposantOperations();


  @override
  Widget build(BuildContext context) {
    final des= ModalRoute.of(context)!.settings.arguments as String;
    print(des);

    FutureBuilder(
        future:composantOperations.searchComposantByDes(des),
        builder:(BuildContext context,AsyncSnapshot<dynamic> snapshot){
          if(snapshot.hasData) {
            final composantList = snapshot.data as Composant;
            final comp=Composant.map(composantList);
            x= comp.description;
            print(x);
            y= comp.des;
            print(y);
            z= comp.famille_comp;
            print(z);
            return ListView.builder(itemBuilder: (BuildContext context, int index) {
              return Card(
              );
              },);


          }
          else if (!snapshot.hasData){
            return const Text('empty');
          }
          else {
            return CircularProgressIndicator(); // displays while loading data
          }
        });

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

            decoration: InputDecoration(

                hintText: x,
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

            decoration: InputDecoration(

                hintText: y,
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

            decoration: InputDecoration(
                hintText: z,
                hintStyle:TextStyle(color: Colors.grey),
                border: InputBorder.none
            ),
          ),
        ),
      ],
    );
  }
}
