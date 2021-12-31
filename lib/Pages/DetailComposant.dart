import 'package:flutter/material.dart';
import 'package:gstock/Data/composant_operation.dart';
import 'package:gstock/Models/composant.dart';

import 'package:gstock/components/DetailCom/InputWrapper.dart';
import 'package:gstock/components/DetailCom/Header.dart';

import '';
import 'home_page.dart';
class DetailComposant extends StatelessWidget {
  const DetailComposant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                                  Container(
                                    padding: EdgeInsets.all(18),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey)
                                        )
                                    ),
                                    child: TextField(

                                      decoration: InputDecoration(
                                          hintText: composantList[index].famille_comp,
                                          hintStyle: TextStyle(
                                              color: Colors.grey),
                                          border: InputBorder.none
                                      ),
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

                                      decoration: InputDecoration(

                                          hintText: composantList[index].des,
                                          hintStyle: TextStyle(
                                              color: Colors.grey),
                                          border: InputBorder.none
                                      ),
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

                                      decoration: InputDecoration(

                                          hintText: composantList[index].description,
                                          hintStyle: TextStyle(
                                              color: Colors.grey),
                                          border: InputBorder.none
                                      ),
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

                                      decoration: InputDecoration(
                                          hintText: composantList[index].qte.toString(),
                                          hintStyle: TextStyle(
                                              color: Colors.grey),
                                          border: InputBorder.none
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
