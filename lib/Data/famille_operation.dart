import 'package:gstock/Data/database_helper.dart';
import 'package:gstock/Models/famille.dart';



class FamilleOperations {
  late FamilleOperations familleOperations;

  final dbProvider = DataBaseHelper.DataBaseHelperinstance;

  createFamille(Famille famille) async {
    final db = await dbProvider.database;
    db.insert('famille', famille.toMap());
    print('famille inserted');
  }

  updateFamille(Famille famille) async {
    final db = await dbProvider.database;
    db.update('famille', famille.toMap(),
        where: "id=?", whereArgs: [famille.id]);
  }

  deleteFamille(Famille famille) async {
    final db = await dbProvider.database;
    await db.delete('famille', where: 'id=?', whereArgs: [famille.id]);
  }

  Future<List<Famille>> getAllFamilles() async {
    final db = await dbProvider.database;
    List<Map<String, dynamic>> allRows = await db.query('famille');
    List<Famille> familles = allRows.map((familles) => Famille.map(familles)).toList();
    return familles;
  }

  Future<List<Famille>> searchFamilleById(String id) async {
    final db = await dbProvider.database;
    List<Map<String, dynamic>> allRows = await db
        .query('famille', where: 'id=?', whereArgs: ['%id%']);
    List<Famille> famille =allRows.map((famille) => Famille.map(famille)).toList();
    return famille;
  }


}



//WHERE name LIKE 'keyword%'
//--Finds any values that start with "keyword"
//WHERE name LIKE '%keyword'
//--Finds any values that end with "keyword"
//WHERE name LIKE '%keyword%'
//--Finds any values that have "keyword" in any position