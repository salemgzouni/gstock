import 'package:sqfentity_gen/sqfentity_gen.dart';


class Admin{
  late int id;
  late String nom;
  late String prenom;
  late String email;
  late String mdp;

  Admin(this.nom, this.prenom, this.email, this.mdp);

  int get _id => id;

  String get _nom => nom;

  String get _prenom => prenom;

  String get _email => email;

  String get _mdp => mdp;

  set _mdp(String value) {
    mdp = value;
  }

  set _email(String value) {
    email = value;
  }

  set _prenom(String value) {
    prenom = value;
  }

  set _nom(String value) {
    nom = value;
  }

  //convert Admin Object to Map Object
  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["nom"] = nom;
    map["prenom"] = prenom;
    map["email"] = email;
    map["mdp"]=mdp;
    return map;
  }
  //extract admin object from Map Object
  Admin.map(dynamic obj) {
    this.id = obj['id'];
    this.nom = obj['nom'];
    this.prenom = obj['prenom'];
    this.email = obj['email'];
    this.mdp= obj['mdp'];
  }
}