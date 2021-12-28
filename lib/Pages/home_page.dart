// TODO Implement this library.
import 'package:flutter/material.dart';

import 'ProfilePage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
          title: Text("HomePage"),
          automaticallyImplyLeading: true,
      ),
      body: Center(
          child:  Text("Welcome, select a family please.")
      ),
      drawer: Drawer(
        child: ListView(
          children: const <Widget> [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
              ),
              child: Text(
                'list of family',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),
            ),

            ListTile(
              title: Text('test1',
                  style: TextStyle(
              color: Colors.black,
              fontSize: 18,)
              ),
            ),
            ListTile(
              title: Text('test1',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,)
              ),
            ),
            ListTile(
              title: Text('test1',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,)
              ),
            ),
          ],
        ),
      ),

    );

  }
}