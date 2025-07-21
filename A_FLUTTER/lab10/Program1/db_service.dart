import 'package:advance_flutter_lab/utils/import_export.dart';

abstract class DatabaseService {
  Future<Database> get database;
}

