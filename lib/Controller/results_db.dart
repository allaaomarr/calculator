import 'package:calculator/Model/results_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class database {
 Future<Database> createDB() async {
  String dataBasePath = await getDatabasesPath();
  print(dataBasePath);
  String path = join(dataBasePath, 'results.db');
  print(path);
  return openDatabase(path,
      version: 1,
      onCreate: (Database db, int version) async {
       await db.execute(
           'CREATE TABLE calc(id INTEGER PRIMARY KEY,title TEXT, result TEXT)');
      },
      onOpen: (db) => print("table created"));
 }
 addDB(Results R)
 async {
  var DB = await createDB();
  DB.transaction((txn) async {
   await txn
       .rawInsert(
       'INSERT INTO calc(title,result) VALUES("${R.title}","${R.result}")')
       .then((value) => print('$value insert to db'));
   List<Map> list2 = await txn.rawQuery('SELECT * FROM calc');
   print(list2);
  });
 }
 Future<List<Results>> getdata() async{
  var DB = await createDB();
  List<Map<String,Object?>> datas = await DB.query("calc");
  return datas.map((e) => Results.fromMap(e)).toList();
 }
 Future<int>delete(int id) async{
  var DB = await createDB();
  return await DB.delete("calc",where: "id = ?",whereArgs: [id]);
 }
}