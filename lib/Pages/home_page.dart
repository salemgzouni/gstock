// TODO Implement this library.
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'ProfilePage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  final titles = ["List 1", "List 2", "List 3"];
  final subtitles = [
    "Here is list 1 subtitle",
    "Here is list 2 subtitle",
    "Here is list 3 subtitle"
  ];
  final icons = [Icons.ac_unit, Icons.access_alarm, Icons.access_time];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('test test aywa aywa'),
          leading : IconButton(
            icon: Icon (
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()),);
            },
          ),
          actions:[
            IconButton(onPressed: () {}, icon: Icon(Icons.settings, color: Colors.white))
          ]
      ),
      body: Container(
          child : ListView.builder(
              itemCount: titles.length,
              itemBuilder: (context, index) {
                return Card(
                    child: ListTile(
                        onTap: () {
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text(titles[index] + ' pressed!'),
                          ));
                        },
                        title: Text(titles[index]),
                        subtitle: Text(subtitles[index]),
                        leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://images.unsplash.com/photo-1547721064-da6cfb341d50")),
                        trailing: Icon(icons[index])));
              })
      ),
    );
  }
}

