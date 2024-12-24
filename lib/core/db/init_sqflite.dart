import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class SqlDB{

  static Database? _db ;

  Future<Database?> get db async {
    if (_db == null){
      _db  = await initialDb() ;
      return _db ;
    }else {
      return _db ;
    }
  }


  initialDb() async {
    String databasePath = await getDatabasesPath() ;
    String path = join(databasePath , 'nwara.db') ;
    Database myDb = await openDatabase(path , onCreate: _onCreate , version: 1 ) ;
    return myDb ;
  }



  _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE items(
    "id" INTEGER PRIMARY KEY,
    "name" TEXT NOT NULL,
    "quantity" INTEGER NOT NULL,
    "originalPrice" REAL NOT NULL,
    "sellPrice" REAL NOT NULL

    )
    ''');
// Create the `receipts` table
    await db.execute('''
    CREATE TABLE receipts (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      originalPrice REAL ,
      sellPrice REAL ,
      netIncome REAL 
    )
  ''');

    // Create the junction table to link `items` and `receipts`
    await db.execute('''
    CREATE TABLE receipt_items (
      receiptId INTEGER NOT NULL,
    itemId INTEGER NOT NULL,
    FOREIGN KEY (receiptId) REFERENCES receipts (id) ON DELETE CASCADE,
    FOREIGN KEY (itemId) REFERENCES items (id) ON DELETE CASCADE,
    PRIMARY KEY (receiptId, itemId)
    )
    ''');

  }


  readData({required String tableName})async{
    Database? readDb = await db;
    var response = await readDb!.query(tableName);
   //var response = await readDb!.rawQuery(query);

   return response;
  }

  insertData({required String tableName,required Map<String, Object?> values})async{
    Database? insertDb = await db;
    await insertDb!.insert(tableName, values);
  }

  deleteData({required String tableName,required int id})async{
    Database? deleteDb = await db;
    await deleteDb!.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }

  updateData({required String tableName,required Map<String, Object?> values})async{
    Database? updateDb = await db;
    await updateDb!.update(
        tableName,
        values,
        where: 'id = ?',
        whereArgs: [values['id']]
    );
  }



}