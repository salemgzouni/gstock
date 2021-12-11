class Composant{
  late String _id;
  late String _des;
  late String _description;
  late int _qte;

  late int _famille_comp;

  Composant(this._id, this._des, this._description, this._qte,this._famille_comp);

  int get famille_comp => _famille_comp;


  int get qte => _qte;

  String get description => _description;

  String get des => _des;

  String get id => _id;

  set famille_comp(int value) {
    _famille_comp = value;
  }

  set qte(int value) {
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
    if(id!=null){
      map["id"] = _id;
    }
    map["des"] = _des;
    map["description"] = _description;
    map["qte"] = _qte;

    map["famille_comp"]=_famille_comp;

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