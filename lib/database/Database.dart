import 'dart:io';
import 'dart:async';
import 'package:mora_gpa/database/Module.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper;
  static Database _database;

  String table = 'Modules';
  String colId = 'id';
  String colSemester = 'semester';
  String colName = 'name';
  String colGrade = 'grade';
  String colCredits = 'credits';

  DatabaseHelper._createInstance();

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance();
    }
    return _databaseHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    // Get the directory path
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'MoraGPA.db';

    // Open/create the database at a given path
    var MoraGPADatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return MoraGPADatabase;
  }

  //Create table in the database
  void _createDb(Database db, int newVersion) async {
    await db.execute('CREATE TABLE $table('
        '$colId STRING PRIMARY KEY,'
        '$colSemester INTEGER,'
        '$colName TEXT,'
        '$colGrade REAL,'
        '$colCredits REAL)');
  }

  // Fetch Operation: Get all modules from database
  Future<List<Map<String, dynamic>>> getAllModulesMapList() async {
    Database db = await this.database;

    var result = await db.query(table, orderBy: '$colSemester ASC');
    return result;
  }

  // Insert Operation day will be the table Name
  Future<int> insertModule(Module module) async {
    Database db = await this.database;
    var result = await db.insert(table, module.toMap());
    return result;
  }

  // Delete Operation
  Future<int> deleteSubject(String id) async {
    var db = await this.database;
    int result = await db.rawDelete('DELETE FROM $table WHERE $colId = "$id"');
    return result;
  }

  // Get number of subjects in database each day
  Future<int> getModulesBySemester(int semesterNo) async {
    Database db = await this.database;
    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT * FROM $table WHERE id=$semesterNo');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  // Get the 'Map List' [ List<Map> ] and convert it to 'Module List' [ List<Module> ]
  Future<List<Module>> getModuleList() async {
    var moduleMapList = await getAllModulesMapList();
    int count = moduleMapList.length;
    List<Module> moduleList = List<Module>();
    // For loop to create a 'module List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      moduleList.add(Module.fromMapObject(moduleMapList[i]));
    }

    return moduleList;
  }
}
