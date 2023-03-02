// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
// import 'package:foob_ok/model/class.dart';

// // khoi tao db
// class DatabaseHandler {
//   Future<Database> initializeDB() async {
//     String path = await getDatabasesPath();
//     return openDatabase(join(path, 'demo2.db'), onCreate: (db, version) async {
//       await db.execute(
//           "CREATE TABLE fruits(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, images TEXT NOT NULL, kg TEXT NOT NULL,price TEXT NOT NULL,detail TEXT NOT NULL)");
//     }, version: 1);
//   }

// //insert db
//   Future<int> insertFruit(List<Fruit> todos) async {
//     int result = 0;
//     final Database db = await initializeDB();
//     for (var todo in todos) {
//       result = await db.insert('fruits', todo.toMap());
//     }
//     return result;
//   }

//   Future<List<Fruit>> retrieveFruit() async {
//     final Database db = await initializeDB();
//     final List<Map<String, Object?>> queryResult = await db.query("fruits");
//     return queryResult.map((e) => Fruit.fromMap(e)).toList();
//   }

//   //delete db
//   Future<void> deleteFruit(int id) async {
//     final db = await initializeDB();
//     await db.delete(
//       'fruits',
//       where: "id = ?",
//       whereArgs: [id],
//     );
//   }
// }
