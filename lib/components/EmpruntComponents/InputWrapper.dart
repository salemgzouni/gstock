import 'package:flutter/material.dart';

import 'package:gstock/Pages/RegisterPage.dart';
import 'package:gstock/Pages/home_page.dart';

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

          InkWell(
            child: ElevatedButton(
              child: const Text('Annuler '),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
          ),
          SizedBox(height: 40,),
        ],
      ),
    );
  }
}
