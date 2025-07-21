import 'package:advance_flutter_lab/lab10/Program1/db_service.dart';
import 'package:advance_flutter_lab/lab10/Program1/user_model.dart';
import '../../utils/import_export.dart';

class UserRepo {
  DatabaseService dbService;

  UserRepo(this.dbService);

  Future<List<UserModel>> getAllUsers() async {
    Database db = await dbService.database;
    List<Map<String, Object?>> users = await db.rawQuery(
      'SELECT * FROM TBL_USER',
    );
    List<UserModel> userList = [];
    for (var element in users) {
      userList.add(UserModel().fromMap(element));
    }
    return userList;
  }

  Future<void> addUser(String tblName, UserModel model) async {
    final db = await dbService.database;
    await db.insert(tblName, {
      'USER_NAME': model.name,
    });
  }
  Future<void> deleteUser(String tblName, int id) async {
    await (await dbService.database).delete(
      tblName,
      where:"USER_ID = ?",
      whereArgs: [id],
    );
  }

  Future<void> updateUser(String tblName, UserModel model, int id) async {
    await (await dbService.database).update(
      tblName,
      {
        'USER_NAME': model.name,
      },
      where: "USER_ID = ?",
      whereArgs: [id],
    );
  }

}