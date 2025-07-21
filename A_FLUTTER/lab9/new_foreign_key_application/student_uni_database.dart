import 'package:advance_flutter_lab/utils/import_export.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class StudentUniDatabase{
  Database? _database;

  StudentUniDatabase._internal();

  static StudentUniDatabase _instance = StudentUniDatabase._internal();

  factory StudentUniDatabase() {
    return _instance;
  }

  @override
  Future<Database> get database async {
    _database ??= await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async{
    if(_database != null){
      return _database!;
    }

    Directory directory = await getApplicationCacheDirectory();
    String path = join(directory.toString() , "Student_University.db");

    _database = await openDatabase(path, version: 1 ,
      onCreate: (db, version) {
        db.execute('''
          CREATE TABLE UNIVERSITY(
            $UNIVERSITY_ID INTEGER PRIMARY KEY AUTOINCREMENT,
            $UNIVERSITY_NAME TEXT NOT NULL
          )
        ''');
        db.execute('''
          CREATE TABLE BRANCH(
            $BRANCH_ID INTEGER PRIMARY KEY AUTOINCREMENT,
            $BRANCH_NAME TEXT NOT NULL
          )
        ''');
        db.execute('''
          CREATE TABLE SEMESTER(
            $SEMESTER_ID INTEGER PRIMARY KEY AUTOINCREMENT,
            $SEMESTER_NAME TEXT NOT NULL
          )
        ''');
        db.execute('''
          CREATE TABLE STUDENT_UNIVERSITY(
            $STUDENT_ID INTEGER PRIMARY KEY AUTOINCREMENT,
            $STUDENT_NAMEE TEXT NOT NULL,
            $STUDENT_AGE TEXT NOT NULL,
            $STUDENT_EMAIL TEXT NOT NULL,
            $STUDENT_NUMBER TEXT NOT NULL,
            $STUDENT_CPI TEXT NOT NULL
            FOREIGN KEY ($UNIVERSITY_ID) REFERENCES UNIVERSITY($UNIVERSITY_ID),
            FOREIGN KEY ($BRANCH_ID) REFERENCES BRANCH($BRANCH_ID),
            FOREIGN KEY ($SEMESTER_ID) REFERENCES SEMESTER($SEMESTER_ID),
          )
        ''');

      },
    );

    return _database!;
  }


}