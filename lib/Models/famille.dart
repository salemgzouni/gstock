import 'package:gstock/Models/composant.dart';

class Famille{
  late int id;
  late String des;
  late String description;


  Famille(this.des, this.description);

  late List<Composant> listComposants;



  List<Composant> get _listComposants => listComposants;


  String get _description => description;

  String get _des => des;

  int get _id => id;


  set _listComposants(List<Composant> value) {
    listComposants = value;
  }


  set _description(String value) {
    description = value;
  }

  set _des(String value) {
    des = value;
  }
  //convert famille Object to Map Object
  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["des"] = _des;
    map["description"] = _description;

    return map;
  }

  //extract composant object from Map Object
  Famille.map(dynamic obj) {

    this.des = obj['des'];
    this.description = obj['description'];

  }


}