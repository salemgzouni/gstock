class Composant{
  late int _id;
  late String _des;
  late String _description;
  late String _qte;

  late int _famille_comp;

  Composant(this._des, this._description, this._qte);

  int get famille_comp => _famille_comp;


  String get qte => _qte;

  String get description => _description;

  String get des => _des;

  int get id => _id;

  set famille_comp(int value) {
    _famille_comp = value;
  }

  set qte(String value) {
    _qte = value;
  }

  set description(String value) {
    _description = value;
  }

  set des(String value) {
    _des = value;
  }
  //convert composant Object to Map Object
  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();

    map["des"] = _des;
    map["description"] = _description;
    map["qte"] = _qte;



    return map;
  }
  //extract composant object from Map Object
  Composant.map(dynamic obj) {
    this._id = obj['id'];
    this._des = obj['des'];
    this._description = obj['description'];
    this._qte = obj['qte'];

    this._famille_comp= obj['famille_comp'];

  }
}