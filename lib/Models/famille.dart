import 'package:gstock/Models/composant.dart';

class Famille{
  late String _id;
  late String _des;
  late String _description;
<<<<<<< HEAD

  Famille(this._id, this._des, this._description);
=======
  late List<Composant> _listComposants;

  Famille(this._id, this._des, this._description, this._listComposants);

  List<Composant> get listComposants => _listComposants;
>>>>>>> 55ea0b3 (interface register)

  String get description => _description;

  String get des => _des;

  String get id => _id;


<<<<<<< HEAD

=======
  set listComposants(List<Composant> value) {
    _listComposants = value;
  }
>>>>>>> 55ea0b3 (interface register)

  set description(String value) {
    _description = value;
  }

  set des(String value) {
    _des = value;
  }
  //convert composant Object to Map Object
  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if(id!=null){
      map["id"] = _id;
    }
    map["des"] = _des;
    map["description"] = _description;
<<<<<<< HEAD
=======
    map["listComposants"] = _listComposants;
>>>>>>> 55ea0b3 (interface register)
    return map;
  }
  //extract composant object from Map Object
  Famille.map(dynamic obj) {
    this._id = obj['id'];
    this._des = obj['des'];
    this._description = obj['description'];
<<<<<<< HEAD
=======
    this._listComposants = obj['listComposants'];
>>>>>>> 55ea0b3 (interface register)
  }
}