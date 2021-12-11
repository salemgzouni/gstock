import 'package:flutter/material.dart';

import 'Button.dart';
import 'InputField.dart';

class InputWrapper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Column(
        children: <Widget>[
          SizedBox(height:40,),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)
            ),
            child: InputField(),
          ),
          SizedBox(height: 40,),
          Text(
            "You don't have an account ?",
            style: TextStyle(color: Colors.black45)
          ),
          InkWell(
            child: Text("Register here",),
          ),
          SizedBox(height: 40,),
          Button()
        ],
      ),
    );
  }
}
