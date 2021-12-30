import 'package:gstock/Data/database_helper.dart';
import 'package:gstock/Models/composant.dart';
class ComposantOperations {
  late ComposantOperations composantOperations;

  final dbProvider = DataBaseHelper.DataBaseHelperinstance;

  createCompsant(Composant composant) async {
    final db = await dbProvider.database;
    db.insert('composant', composant.toMap());
    print('composant inserted');
  }

  updateComposant(Composant composant) async {
    final db = await dbProvider.database;
    db.update('composant', composant.toMap(),
        where: "id=?", whereArgs: [composant.id]);
  }

  deleteComposant(Composant composant) async {
    final db = await dbProvider.database;
    await db.delete('composant', where: 'id=?', whereArgs: [composant.id]);
  }

  Future <List<Composant>> getAllComposants() async {
    final db = await dbProvider.database;
    List<Map<String, dynamic>> allRows = await db.query('composant');
    List<Composant> composants =
    allRows.map((composants) => Composant.map(composants)).toList();
    return composants;
  }

  Future<List<Composant>> searchComposantById(String id) async {
    final db = await dbProvider.database;
    List<Map<String, dynamic>> allRows = await db
        .query('composant', where: 'id=?', whereArgs: ['%id%']);
    List<Composant> composant =allRows.map((composant) => Composant.map(composant)).toList();
    return composant;
  }
  Future<List<Composant>> searchComposantByFamille(String fam) async {
    final db = await dbProvider.database;
    List<Map<String, dynamic>> allRows = await db
        .query('composant', where: 'famille_comp=?', whereArgs: ['%fam%']);
    List<Composant> composant =allRows.map((composant) => Composant.map(composant)).toList();
    return composant;
  }
}

//WHERE name LIKE 'keyword%'
//--Finds any values that start with "keyword"
//WHERE name LIKE '%keyword'
//--Finds any values that end with "keyword"
//WHERE name LIKE '%keyword%'
//--Finds any values that have "keyword" in any position