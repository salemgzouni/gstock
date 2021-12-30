class Emprunt{
  late int _id;
  late String _comp;
  late String _nom;
  late DateTime _dateDebut;
  late DateTime _dateFin;

  Emprunt(this._comp, this._nom, this._dateDebut);

  int get id => _id; //convert composant Object to Map Object
  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["comp"] = _comp;
    map["nom"] = _nom;
    map["dateDebut"] = _dateDebut;
    map["dateFin"] = _dateFin;
    return map;
  }
  //extract composant object from Map Object
  Emprunt.map(dynamic obj) {
    this._id = obj['id'];
    this._comp=obj['comp'];
    this._nom=obj['nom'];
    this._dateDebut=obj['dateDebut'];
    this._dateFin=obj['dateFin'];

  }

  String get comp => _comp;

  DateTime get dateFin => _dateFin;

  DateTime get dateDebut => _dateDebut;

  String get nom => _nom;

  set dateFin(DateTime value) {
    _dateFin = value;
  }

  set dateDebut(DateTime value) {
    _dateDebut = value;
  }

  set nom(String value) {
    _nom = value;
  }

  set comp(String value) {
    _comp = value;
  }
}