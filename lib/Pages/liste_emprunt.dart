import 'package:flutter/material.dart';
import 'package:gstock/Data/emprunt_operations.dart';
import 'package:gstock/Models/Emprunt.dart';
import 'package:gstock/components/EmpruntComponents/Header.dart';
import 'package:gstock/components/EmpruntComponents/InputWrapper.dart';
import '';
import 'home_page.dart';
class listeemprunt extends StatelessWidget {
  const listeemprunt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    EmpruntOperations empruntOperations = EmpruntOperations();

    return Scaffold(
        appBar: AppBar(
            title: Text("Liste des emprunts"),
            leading : IconButton(
              icon: Icon (
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()),);
              },
            ),
        ),
        body: Container(
            child: FutureBuilder(
                future:empruntOperations.getAllEmprunts(),
                builder:(BuildContext context,AsyncSnapshot<dynamic> snapshot){
                  if(snapshot.hasData) {
                    final empruntList = snapshot.data as List<Emprunt>;
                    return ListView.builder(
                        itemCount: empruntList.length,
                        itemBuilder: (context, index) {
                          return Card(
                              child: ListTile(
                                onTap: () {},
                                title: Text(empruntList[index].comp),
                                subtitle: Text(empruntList[index].nom),
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
