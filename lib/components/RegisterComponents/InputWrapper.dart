import 'package:flutter/material.dart';
import 'package:gstock/Pages/LoginPage.dart';
import 'package:flutter/foundation.dart';
import 'InputField.dart';

class InputWrapper extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        children: <Widget>[
          SizedBox(height:5,),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5)
            ),
            child: InputField(),
          ),
          SizedBox(height: 5,),
          InkWell(
            child: ElevatedButton(
              child: const Text('Already have an account ?'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
            ),
          ),
          SizedBox(height: 5,),
        ],
      ),
    );
  }
}
