import 'package:gstock/Data/database_helper.dart';
import 'package:gstock/Models/composant.dart';
class ComposantOperations {
  late ComposantOperations adminOperations;

  final dbProvider = DataBaseHelper.DataBaseHelperinstance;

  createCompsant(Composant composant) async {
    final db = await dbProvider.database;
    db.insert('composant', composant.toMap());
    print('composant inserted');
  }

  updateComposant(Composant composant) async {
    final db = await dbProvider.database;
    db.update('composant', composant.toMap(),
        where: "des=?", whereArgs: [composant.des]);
  }
  updateQtiteComposant(String des, int myQte) async {
    final db = await dbProvider.database;
    await db.rawUpdate('UPDATE composant SET qte=qte-? WHERE des=?',[myQte,des]
    );
  }

  deleteComposant(String des) async {
    final db = await dbProvider.database;
    await db.delete('composant', where: 'des=?', whereArgs: [des]);
  }

  Future <List<Composant>> getAllComposants() async {
    final db = await dbProvider.database;
    List<Map<String, dynamic>> allRows = await db.query('composant');
    List<Composant> composants =
    allRows.map((composants) => Composant.map(composants)).toList();
    return composants;
  }

  Future<List<Composant>> searchComposantById(int id) async {
    final db = await dbProvider.database;
    List<Map<String, dynamic>> allRows = await db
        .query('composant', where: 'id=?', whereArgs: [id]);
    List<Composant> composant =allRows.map((composant) => Composant.map(composant)).toList();
    return composant;
  }
  Future<List<Composant>> searchComposantByFamille(String fam) async {
    final db = await dbProvider.database;
    List<Map<String, dynamic>> allRows = await db
        .query('composant', where: 'famille_comp=?', whereArgs: [fam]);
    List<Composant> composant =await allRows.map((composant) => Composant.map(composant)).toList();
    return composant;
  }

  Future<List<Composant>> searchComposantByDes(String des) async {
    final db = await dbProvider.database;
    List<Map<String, dynamic>> allRows = await db
        .query('composant', where: 'des=?', whereArgs: [des]);
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