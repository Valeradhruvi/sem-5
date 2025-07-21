import 'package:advance_flutter_lab/lab10/Program1/db_service.dart';
import 'package:advance_flutter_lab/utils/import_export.dart';

class InsertDatabase implements DatabaseService{
  Database? _db;

  Future<Database> get database async {
    _db ??= await initDatabase();
    return _db!;
  }


  Future<Database> initDatabase() async{
    if(_db != null){
      return _db!;
    }

    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path , 'UserData.db');

    _db = await openDatabase(path,
      version: 1,
      onCreate: (db, version) async{
        await db.execute('''
          CREATE TABLE TBL_USER(
            USER_ID INTEGER PRIMARY KEY AUTOINCREMENT,
            USER_NAME TEXT NOT NULL
          )
        ''');
      },
    );

    return _db!;
  }


}