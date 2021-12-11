import 'package:flutter/material.dart';

class InputField extends StatelessWidget {

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
            decoration: InputDecoration(

                hintText: "Enter your password",
                hintStyle:TextStyle(color: Colors.grey),
                border: InputBorder.none
            ),
          ),
        )
      ],
    );
  }
}
