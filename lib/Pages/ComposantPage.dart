// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:gstock/Data/composant_operation.dart';
import 'package:gstock/Data/famille_operation.dart';
import 'package:gstock/Models/composant.dart';
import 'package:gstock/Pages/FormComposant.dart';
import 'home_page.dart';
import 'ProfilePage.dart';

class ComposantPage extends StatefulWidget {
  @override
  _ComposantPageState createState() => _ComposantPageState();

}

class _ComposantPageState extends State<ComposantPage> {

  final icons = [Icons.ac_unit, Icons.access_alarm, Icons.access_time];
  @override
  Widget build(BuildContext context) {
    final des = ModalRoute.of(context)!.settings.arguments as String;
    print(des);

    ComposantOperations composantOperations = new ComposantOperations();



    return Scaffold(
        appBar: AppBar(
            title: Text(des),
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
              IconButton(onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FormComposant(),
                    // Pass the arguments as part of the RouteSettings. The
                    // DetailScreen reads the arguments from these settings.
                    settings: RouteSettings(
                      arguments:des,
                    ),
                  ),
                );
              },
                  icon: Icon(Icons.add, color: Colors.white))
            ]
        ),
        body: Container(
            child: FutureBuilder(
                future:composantOperations.searchComposantByFamille(des),
                builder:(BuildContext context,AsyncSnapshot<dynamic> snapshot){
                  if(snapshot.hasData) {
                    final composantList = snapshot.data as List<Composant>;
                    return ListView.builder(
                        itemCount: composantList.length,
                        itemBuilder: (context, index) {
                          return Card(
                              child: ListTile(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => FormComposant(),
                                      // Pass the arguments as part of the RouteSettings. The
                                      // DetailScreen reads the arguments from these settings.
                                      settings: RouteSettings(
                                        arguments: des,

                                      ),
                                    ),
                                  );
                                },
                                title: Text(composantList[index].des),
                                subtitle: Text(composantList[index].description),
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

