import 'package:gstock/Models/composant.dart';

class Famille{
  late String _id;
  late String _des;
  late String _description;


  Famille(this._id, this._des, this._description);

  late List<Composant> _listComposants;



  List<Composant> get listComposants => _listComposants;


  String get description => _description;

  String get des => _des;

  String get id => _id;


  set listComposants(List<Composant> value) {
    _listComposants = value;
  }


  set description(String value) {
    _description = value;
  }

  set des(String value) {
    _des = value;
  }
  //convert famille Object to Map Object
  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if(id!=null){
      map["id"] = _id;
    }
    map["des"] = _des;
    map["description"] = _description;

    map["listComposants"] = _listComposants;

    return map;
  }

  //extract composant object from Map Object
  Famille.map(dynamic obj) {
    this._id = obj['id'];
    this._des = obj['des'];
    this._description = obj['description'];

    this._listComposants = obj['listComposants'];

  }


}