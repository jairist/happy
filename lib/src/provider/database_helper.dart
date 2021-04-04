import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

// database table and column names
final String tablaLoginInfo = 'login_info';
final String columnId = '_id';
final String columnLastLoginDate = 'last_login_date';
final String columnEmail = 'email';
// tabal para guarar las evaluaciones
final String tablaEvaluacionesInfo = 'evaluaciones_info';
final String columnProveedor = 'proveedor';
final String columnFecha = 'fecha';

// data model class
class LoginInfo {
  int id;
  String lastLoginDate;
  String email;

  LoginInfo();

  // convenience constructor to create a Word object
  LoginInfo.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    email = map[columnEmail];
    lastLoginDate = map[columnLastLoginDate];
  }

  // convenience method to create a Map from this Word object
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnEmail: email,
      columnLastLoginDate: lastLoginDate
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }
}

// data model class
class EvaluacionesInfo {
  int id;
  String proveedor;
  String fecha;

  EvaluacionesInfo();

  // convenience constructor to create a Word object
  EvaluacionesInfo.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    proveedor = map[columnProveedor];
    fecha = map[columnFecha];
  }

  // convenience method to create a Map from this Word object
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{columnProveedor: proveedor, columnFecha: fecha};
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }
}

// singleton class to manage the database
class DatabaseHelper {
  // This is the actual database filename that is saved in the docs directory.
  static final _databaseName = "happy.db";
  // Increment this version when you need to change the schema.
  static final _databaseVersion = 1;

  // Make this a singleton class.
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // Only allow a single open connection to the database.
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  // open the database
  _initDatabase() async {
    // The path_provider plugin gets the right directory for Android or iOS.
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    // Open the database. Can also add an onUpdate callback parameter.
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL string to create the database
  Future _onCreate(Database db, int version) async {
    await db.execute('''
              CREATE TABLE $tablaLoginInfo (
                $columnId INTEGER PRIMARY KEY,
                $columnEmail  TEXT NOT NULL,
                $columnLastLoginDate TEXT NOT NULL
              )
              ''');
    await db.execute('''
              CREATE TABLE $tablaEvaluacionesInfo (
                $columnId INTEGER PRIMARY KEY,
                $columnProveedor  TEXT NOT NULL,
                $columnFecha TEXT NOT NULL
              )
              ''');
  }

  // Database helper methods:
  Future<int> insert(LoginInfo loginInfo) async {
    Database db = await database;
    int id = await db.insert(tablaLoginInfo, loginInfo.toMap());
    return id;
  }

  Future<int> insertEvaluacion(EvaluacionesInfo evaluacionesInfo) async {
    Database db = await database;
    int id = await db.insert(tablaEvaluacionesInfo, evaluacionesInfo.toMap());
    return id;
  }

  Future<LoginInfo> queryInfoUserById(int id) async {
    Database db = await database;
    List<Map> maps = await db.query(tablaLoginInfo,
        columns: [columnId, columnEmail, columnLastLoginDate],
        where: '$columnId = ?',
        whereArgs: [id]);
    if (maps.length > 0) {
      return LoginInfo.fromMap(maps.last);
    }
    return null;
  }

  Future<LoginInfo> queryInfoUserByEmail(String email) async {
    Database db = await database;
    List<Map> maps = await db.query(tablaLoginInfo,
        columns: [columnId, columnEmail, columnLastLoginDate],
        where: '$columnEmail = ?',
        whereArgs: [columnEmail]);
    if (maps.length > 0) {
      return LoginInfo.fromMap(maps.first);
    }
    return null;
  }

  // TODO: delete(int id)
  Future<int> deleteById(int id) async {
    Database db = await database;
    return await db
        .delete(tablaLoginInfo, where: '$columnId = ?', whereArgs: [id]);
  }

  // TODO: queryAllWords()
  Future<List<Map>> queryInfoUserAll() async {
    Database db = await database;
    List<Map> list = await db.rawQuery('SELECT * FROM $tablaLoginInfo');
    return list;
  }

  Future<LoginInfo> queryInfoUserGetLastLogin() async {
    Database db = await database;
    List<Map> maps = await db.rawQuery(
        'SELECT * FROM $tablaLoginInfo ORDER BY $columnId DESC LIMIT 1');
    if (maps.length > 0) {
      return LoginInfo.fromMap(maps.first);
    }
    return null;
  }

  Future<EvaluacionesInfo> queryEvaluacionesInfoGetLastLog() async {
    Database db = await database;
    List<Map> maps = await db.rawQuery(
        'SELECT * FROM $tablaEvaluacionesInfo ORDER BY $columnId DESC LIMIT 1');
    if (maps.length > 0) {
      return EvaluacionesInfo.fromMap(maps.first);
    }
    return null;
  }

  // TODO: update(Word word)
}
