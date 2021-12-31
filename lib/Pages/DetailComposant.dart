import 'package:flutter/material.dart';
import 'package:gstock/Data/composant_operation.dart';
import 'package:gstock/Models/composant.dart';



import '';
import 'add_emprunt_page.dart';
import 'home_page.dart';
class DetailComposant extends StatelessWidget {
  const DetailComposant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _myDesController = TextEditingController();
    final _myDescriptionController = TextEditingController();
    final _myQteController = TextEditingController();
    final _myFamController = TextEditingController();

    ComposantOperations composantOperations = ComposantOperations();
    final des= ModalRoute.of(context)!.settings.arguments as String;
    print(des);

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
              IconButton(onPressed: () {},
                  icon: Icon(Icons.settings, color: Colors.white))
            ]
        ),
        body: Container(

            child: FutureBuilder(
                future:composantOperations.searchComposantByDes(des),
                builder:(BuildContext context,AsyncSnapshot<dynamic> snapshot){
                  if(snapshot.hasData) {
                    final composantList = snapshot.data as List<Composant>;
                    return ListView.builder(
                        itemCount: composantList.length,
                        itemBuilder: (context, index) {
                          return Card(

                              child: Column(
                                children: <Widget>[

                                   TextField(

                                    decoration: InputDecoration(
                                        hintText: "Nom du famille",
                                        hintStyle: TextStyle(
                                            color: Colors.black),
                                        border: InputBorder.none
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(18),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey)
                                        )
                                    ),
                                    child: TextField(
                                      controller: _myFamController,
                                      decoration: InputDecoration(
                                          hintText: composantList[index].famille_comp,
                                          hintStyle: TextStyle(
                                              color: Colors.grey),
                                          border: InputBorder.none
                                      ),
                                    ),
                                  ),

                                  TextField(

                                    decoration: InputDecoration(
                                        hintText: "Designation du composant",
                                        hintStyle: TextStyle(
                                            color: Colors.black),
                                        border: InputBorder.none
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(18),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey)
                                        )
                                    ),
                                    child: TextField(
                                      controller: _myDesController,
                                      decoration: InputDecoration(
                                          hintText: composantList[index].des,
                                          hintStyle: TextStyle(
                                              color: Colors.grey),
                                          border: InputBorder.none
                                      ),
                                    ),
                                  ),

                                  TextField(

                                    decoration: InputDecoration(
                                        hintText: "Description du composant",
                                        hintStyle: TextStyle(
                                            color: Colors.black),
                                        border: InputBorder.none
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(18),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey)
                                        )
                                    ),

                                    child: TextField(
                                      controller: _myDescriptionController,
                                      decoration: InputDecoration(

                                          hintText: composantList[index].description,
                                          hintStyle: TextStyle(
                                              color: Colors.grey),
                                          border: InputBorder.none
                                      ),
                                    ),
                                  ),

                                  TextField(

                                    decoration: InputDecoration(
                                        hintText: "Quantite du composant",
                                        hintStyle: TextStyle(
                                            color: Colors.black),
                                        border: InputBorder.none
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(18),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey)
                                        )
                                    ),
                                    child: TextField(
                                      controller: _myQteController,
                                      decoration: InputDecoration(
                                          hintText: composantList[index].qte.toString(),
                                          hintStyle: TextStyle(
                                              color: Colors.grey),
                                          border: InputBorder.none
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20,),
                                  Container(
                                    height: 40,
                                    margin: EdgeInsets.symmetric(horizontal: 50),
                                    decoration: BoxDecoration(
                                      color: Colors.cyan[500],
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: TextButton(
                                      onPressed: () {
                                        int n = int.parse(_myQteController.text);
                                        final composant=Composant(
                                          composantList[index].des, _myDescriptionController.text, n,  composantList[index].famille_comp,);
                                        composantOperations.updateComposant(composant);
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()),);
                                      },
                                      child: Text(
                                        'Modifier',
                                        style: TextStyle(color: Colors.white, fontSize: 20),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20,),
                                  Container(
                                    height: 40,
                                    margin: EdgeInsets.symmetric(horizontal: 50),
                                    decoration: BoxDecoration(
                                      color: Colors.cyan[500],
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: TextButton(
                                      onPressed: () async {
                                        await composantOperations.deleteComposant(des);
                                        Navigator.push(
                                          context,MaterialPageRoute(builder: (context) => HomePage()),
                                        );
                                      },
                                      child: Text(
                                        'Supprimer',
                                        style: TextStyle(color: Colors.white, fontSize: 20),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20,),
                                  Container(
                                    height: 40,
                                    margin: EdgeInsets.symmetric(horizontal: 50),
                                    decoration: BoxDecoration(
                                      color: Colors.cyan[500],
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,MaterialPageRoute(builder: (context) => EmpruntPage(),
                                          settings: RouteSettings(
                                            arguments:des,
                                          ),
                                        ));
                                      },
                                      child: Text(
                                        'Ajout emprunt',
                                        style: TextStyle(color: Colors.white, fontSize: 20),
                                      ),
                                    ),
                                  ),
                                ],
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
