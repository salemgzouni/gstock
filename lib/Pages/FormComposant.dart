import 'package:flutter/material.dart';

import 'package:gstock/components/FormComposant/InputWrapper.dart';
import 'package:gstock/components/FormComposant/Header.dart';

import '';
class FormComposant extends StatelessWidget {
  const FormComposant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter,colors:[
            Colors.cyan,
            Colors.blue,
            Colors.black12
          ]),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: 80,),
            Header(),
            Expanded(child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  )
              ),
              child: InputWrapper(),
            ))
          ],
        ),
      ),
    );
  }
}
