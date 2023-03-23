import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:xpenso/DataBase/data_model.dart';

//********************* Creating DataBase and Table  *******************/

class DBConnections {
  Future<Database> setDB() async {
    var dir = await getApplicationDocumentsDirectory();
    var path = join(dir.path, 'myDB');
    var dbCon = await openDatabase(path, version: 1, onCreate: createDB);
    return dbCon;
  }

  Future createDB(Database dbCon, int version) async {
    String sql =
        'create table ledger_t (id INTEGER PRIMARY KEY, amount INTEGER, notes TEXT, categoryIndex INTEGER, categoryFlag BOOL, day TEXT,month TEXT,year TEXT,createdT TEXT,attachmentFlag BOOL,attachmentName TEXT)';
    await dbCon.execute(sql);
  }
}

//*********************** Creating Repository  *************************/

class Repository {
  late DBConnections dbConnections;
  Repository() {
    dbConnections = DBConnections();
  }

  static Database? db;
// Crating DataBase if its not created or return existing DataBase if its alreay there
  Future<Database?> get database async {
    if (db != null) {
      return db;
    } else {
      db = await dbConnections.setDB();
      return db;
    }
  }

  //Insert Data Function
  insertData(table, data) async {
    var connection = await database;
    return await connection?.insert(table, data);
  }

  //Read Data Function
  readData(table, day, mon, year) async {
    var connection = await database;
    return await connection?.rawQuery(
        'Select * from $table where day = \'${day.toString()}\' and month = \'${mon.toString()}\' and year = \'${year.toString()}\' order by createdT desc');
  }

  dayTotal(table, day, mon, year, flag) async {
    var connection = await database;
    return await connection?.rawQuery(
        'Select sum(amount) as sum from $table where day = \'${day.toString()}\' and month = \'${mon.toString()}\' and year = \'${year.toString()}\' and categoryFlag =\'${flag.toString()}\' ');
  }

  //Update Function
  updateData(table, data) async {
    var connection = await database;
    return await connection
        ?.update(table, data, where: "id=?", whereArgs: [data['id']]);
  }

  //Detete Function
  deleteFunction(table, id) async {
    var connection = await database;
    return await connection?.rawDelete('Delete from $table where id = $id');
  }
}

//************************ Creating Services ************************/

class Services {
  late Repository repo = Repository();
  Services() {
    repo = Repository();
  }

  //Insert Data
  saveData(Ledger insert) async {
    return await repo.insertData('ledger_t', insert.ledgerMap());
  }

  //Read Data
  getData(day, mon, year) async {
    return await repo.readData('ledger_t', day, mon, year);
  }

  getDayTotal(day, mon, year, flag) async {
    return await repo.dayTotal('ledger_t', day, mon, year, flag);
  }
}
