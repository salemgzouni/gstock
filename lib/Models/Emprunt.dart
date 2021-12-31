class Emprunt{
  late int _id;
  late String _comp;
  late String _nom;
  late String _dateDebut;
  late String _dateFin;

  Emprunt(this._comp, this._nom, this._dateDebut,this._dateFin);

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



  String get nom => _nom;


  String get dateDebut => _dateDebut;

  set nom(String value) {
    _nom = value;
  }

  set comp(String value) {
    _comp = value;
  }

  set dateDebut(String value) {
    _dateDebut = value;
  }

  String get dateFin => _dateFin;

  set dateFin(String value) {
    _dateFin = value;
  }
}