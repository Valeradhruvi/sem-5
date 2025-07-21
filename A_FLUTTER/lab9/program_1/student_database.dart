import 'package:advance_flutter_lab/utils/import_export.dart';
import 'package:path/path.dart';

class MyDatabase{
  Database? _database;

  Future<Database> initDatabase() async{
    if(_database != null){
      return _database!;
    }

    Directory directory = await getApplicationCacheDirectory();
    String path = join(directory.toString() , 'student.db');

    _database = await openDatabase(path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
           CREATE TABLE TBL_STUDENT(
            $STUDENT_ID INTEGER PRIMARY KEY AUTOINCREMENT,
            $STUDENT_NAMEE TEXT NOT NULL,
            $STUDENT_AGE TEXT NOT NULL,
            $STUDENT_EMAIL TEXT NOT NULL,
            $STUDENT_NUMBER TEXT NOT NULL,
            $STUDENT_CITY TEXT NOT NULL,
            $STUDENT_STATE TEXT NOT NULL,
            $STUDENT_CPI TEXT NOT NULL,
            $STUDENT_10TH_GRADE TEXT NOT NULL,
            $STUDENT_12TH_GRADE TEXT NOT NULL            
           )'''
        );
      },
    );

    return _database!;
  }
}