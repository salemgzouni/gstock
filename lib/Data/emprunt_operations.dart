import 'package:gstock/Data/database_helper.dart';
import 'package:gstock/Models/Emprunt.dart';
class EmpruntOperations {
  late EmpruntOperations empruntOperations;

  final dbProvider = DataBaseHelper.DataBaseHelperinstance;

  creatEmprunt(Emprunt emprunt) async {
    final db = await dbProvider.database;
    db.insert('emprunt', emprunt.toMap());
    print('empruntt inserted');
  }

  updateEmprunt(Emprunt emprunt) async {
    final db = await dbProvider.database;
    db.update('emprunt', emprunt.toMap(),
        where: "id=?", whereArgs: [emprunt.id]);
  }

  deleteEmprunt(Emprunt emprunt) async {
    final db = await dbProvider.database;
    await db.delete('composant', where: 'id=?', whereArgs: [emprunt.id]);
  }

  Future <List<Emprunt>> getAllEmprunts() async {
    final db = await dbProvider.database;
    List<Map<String, dynamic>> allRows = await db.query('emprunt');
    List<Emprunt> emprunts =
    allRows.map((emprunts) => Emprunt.map(emprunts)).toList();
    return emprunts;
  }

  Future<List<Emprunt>> searchEmpruntById(String id) async {
    final db = await dbProvider.database;
    List<Map<String, dynamic>> allRows = await db
        .query('emprunt', where: 'id=?', whereArgs: ['%id%']);
    List<Emprunt> emprunt =allRows.map((emprunt) => Emprunt.map(emprunt)).toList();
    return emprunt;
  }
  Future<List<Emprunt>> searchEmpruntByDateDebut(String d) async {
    final db = await dbProvider.database;
    List<Map<String, dynamic>> allRows = await db
        .query('emprunt', where: 'dateDebut=?', whereArgs: ['%d%']);
    List<Emprunt> emprunts =allRows.map((emprunt) => Emprunt.map(emprunt)).toList();
    return emprunts;
  }
  Future<List<Emprunt>> searchEmpruntByDateFin(String d) async {
    final db = await dbProvider.database;
    List<Map<String, dynamic>> allRows = await db
        .query('emprunt', where: 'dateFin=?', whereArgs: ['%d%']);
    List<Emprunt> emprunts =allRows.map((emprunt) => Emprunt.map(emprunt)).toList();
    return emprunts;
  }
  Future<List<Emprunt>> searchEmpruntByNom(String n) async {
    final db = await dbProvider.database;
    List<Map<String, dynamic>> allRows = await db
        .query('emprunt', where: 'nom=?', whereArgs: ['%n%']);
    List<Emprunt> emprunts =allRows.map((emprunt) => Emprunt.map(emprunt)).toList();
    return emprunts;
  }
  Future<List<Emprunt>> searchEmpruntByComposant(String c) async {
    final db = await dbProvider.database;
    List<Map<String, dynamic>> allRows = await db
        .query('emprunt', where: 'comp=?', whereArgs: ['%c%']);
    List<Emprunt> emprunts =allRows.map((emprunt) => Emprunt.map(emprunt)).toList();
    return emprunts;
  }
}

//WHERE name LIKE 'keyword%'
//--Finds any values that start with "keyword"
//WHERE name LIKE '%keyword'
//--Finds any values that end with "keyword"
//WHERE name LIKE '%keyword%'
//--Finds any values that have "keyword" in any position