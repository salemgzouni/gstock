import 'package:gstock/Data/database_helper.dart';
import 'package:gstock/Models/Admin.dart';
class AdminOperations {
  late AdminOperations adminOperations;

  final dbProvider = DataBaseHelper.DataBaseHelperinstance;

  createAdmin(Admin admin) async {
    final db = await dbProvider.database;
    db.insert('admin', admin.toMap());
    print('admin inserted');
  }

  updateAdmin(Admin admin) async {
    final db = await dbProvider.database;
    db.update('admin', admin.toMap(),
        where: "id=?", whereArgs: [admin.id]);
  }

  deleteAdmin(Admin admin) async {
    final db = await dbProvider.database;
    await db.delete('admin', where: 'id=?', whereArgs: [admin.id]);
  }

  Future <List<Admin>> getAllAdmins() async {
    final db = await dbProvider.database;
    List<Map<String, dynamic>> allRows = await db.query('admin');
    List<Admin> admins =
    allRows.map((admin) => Admin.map(admin)).toList();
    return admins;
  }

  Future<bool> searchAdminByEmailMdp(String email,String mdp) async {
    final db = await dbProvider.database;
    List<Map<String, dynamic>> maps = (await db.query('admin', where: 'email=? and mdp=?', whereArgs: [email,mdp]));
    /*List<Admin> admin =allRows.map((admin) => Admin.map(admin)).toList();*/
    if(maps.isNotEmpty){
      print(maps);
      return true;
    }else{
      return false;
    }
  }
}

//WHERE name LIKE 'keyword%'
//--Finds any values that start with "keyword"
//WHERE name LIKE '%keyword'
//--Finds any values that end with "keyword"
//WHERE name LIKE '%keyword%'
//--Finds any values that have "keyword" in any position