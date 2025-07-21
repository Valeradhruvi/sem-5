import 'package:advance_flutter_lab/lab9/program_1/student_database.dart';
import 'package:get/get.dart';
import '../../utils/import_export.dart';

class StudentGetController extends GetxController{
  MyDatabase myDatabase = MyDatabase();

  Future<RxList<Map<String, dynamic>>> getAllStudent() async {
    Database db = await myDatabase.initDatabase();
    final List<Map<String, Object?>> result = await db.query("TBL_STUDENT");
    final RxList<Map<String, dynamic>> data = result.obs;
    return data;
  }

  Future<void> addStudent(Map<String , dynamic> map) async{
    Database db = await myDatabase.initDatabase();
    await db.insert("TBL_STUDENT", map);
  }

  Future<void> deleteStudent(int id) async{
    Database db = await myDatabase.initDatabase();
    await db.delete("TBL_STUDENT", where: "$STUDENT_ID = ?", whereArgs: [id]);
  }

  Future<void> editGetStudent(int id , Map<String , dynamic> map) async{
    Database db = await myDatabase.initDatabase();
    await db.update("TBL_STUDENT" , map , where: "$STUDENT_ID = ?" , whereArgs: [map[id]]);
  }

}