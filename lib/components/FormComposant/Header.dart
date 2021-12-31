import 'package:flutter/material.dart';

class Header extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 10,),
          Center(
            child: Text("Ajouter un composant",style: TextStyle(color: Colors.white,fontSize: 18),),
          )
        ],
      ),
    );
  }
}
