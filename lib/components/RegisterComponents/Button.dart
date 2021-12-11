import 'package:flutter/material.dart';


class Button extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: EdgeInsets.symmetric(horizontal: 50),
      decoration: BoxDecoration(
        color: Colors.cyan[500],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text("Register",style: TextStyle(
          color:Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),),
      ),
    );
  }
}
