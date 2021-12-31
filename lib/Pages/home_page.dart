
// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:gstock/Data/famille_operation.dart';
import 'package:gstock/Models/composant.dart';
import 'package:gstock/Models/famille.dart';
import 'package:gstock/Pages/FormFamille.dart';
import 'ComposantPage.dart';
import 'LoginPage.dart';
import 'home_page.dart';
import 'ProfilePage.dart';
import '';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  final icons = [Icons.ac_unit, Icons.access_alarm, Icons.access_time];
  @override
  Widget build(BuildContext context) {
    FamilleOperations familleOperations= new FamilleOperations();
    //var  allFamilles= familleOperations.getAllFamilles() as List;
    final titles = ["List 1", "List 2", "List 3"];
    final subtitles = [
      "Here is list 1 subtitle",
      "Here is list 2 subtitle",
      "Here is list 3 subtitle"
    ];


    return Scaffold(
        appBar: AppBar(
            title: Text('Les familles'),
            leading : IconButton(
              icon: Icon (
                Icons.logout,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()),);
              },
            ),
            actions:[
              IconButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => FormFamille()),);
                },
                  icon: Icon(Icons.add, color: Colors.white))
            ]
        ),
        body: Container(
            child: FutureBuilder(
                future:familleOperations.getAllFamilles(),
                builder:(BuildContext context,AsyncSnapshot<dynamic> snapshot){
                  if(snapshot.hasData) {
                    final familleList = snapshot.data as List<Famille>;
                    return ListView.builder(
                        itemCount: familleList.length,
                        itemBuilder: (context, index) {
                          return Card(
                              child: ListTile(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ComposantPage(),
                                        // Pass the arguments as part of the RouteSettings. The
                                        // DetailScreen reads the arguments from these settings.
                                        settings: RouteSettings(
                                          arguments: familleList[index].des,
                                        ),
                                      ),
                                    );

                                    Scaffold.of(context).showSnackBar(SnackBar(
                                      content: Text(familleList[index].des + ' pressed!'),
                                    ));
                                  },
                                  title: Text(familleList[index].des),
                                  subtitle: Text(familleList[index].description),
                                  leading: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          "https://images.unsplash.com/photo-1547721064-da6cfb341d50")),
                               ));
                        });

                  }
                  else if (!snapshot.hasData){
                    return const Text('empty');
                  }
                  else {
                    return CircularProgressIndicator(); // displays while loading data
                  }
                })
        )
    );
  }
}

