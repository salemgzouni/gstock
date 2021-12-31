class Membre{
  late String _id;
  late String _nom;
  late String _prenom;

  Membre(this._id, this._nom, this._prenom,);

  String get id => _id;

  String get nom => _nom;

  String get prenom => _prenom;


  set prenom(String value) {
    _prenom = value;
  }

  set nom(String value) {
    _nom = value;
  }

  //convert membre Object to Map Object
  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if(id!=null){
      map["id"] = _id;
    }
    map["nom"] = _nom;
    map["prenom"] = _prenom;
    return map;
  }
  //extract membre object from Map Object
  Membre.map(dynamic obj) {
    this._id = obj['id'];
    this._nom = obj['nom'];
    this._prenom = obj['prenom'];
  }
}