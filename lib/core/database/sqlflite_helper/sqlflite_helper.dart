import 'package:sqflite/sqflite.dart';
import 'package:todoapp/feature/task/data/model/task_model.dart';
class SqfliteHelper{
late Database db;
void initDB()async{
  await openDatabase('task.db',version: 1,
  onOpen: (db)=>print("database open"),
  onCreate: ( Database db, int v) async{
    await db.execute('''
 CREATE TABLE Tasks(
 id INTEGER PRIMARY KEY AUTOINCREMENT,
 title TEXT,
 notes TEXT,
 date TEXT,
 startTime TEXT,
 endTime TEXT,
 color INTEGER,
isCompleted INTEGER
);
''').then((value)=> print("db create success"));
  },).then((value)=>db =value).catchError((e){
    print(e.toString());
  });

}

Future <List<Map<String,dynamic>>> getFromDB()async{
  return await db.rawQuery('SELECT * FROM Tasks');
}
 
 Future<int>  insertToDB(TaskModel model)async{
 return await db.rawInsert('''
INSERT INTO Tasks( title ,
 notes ,
 date ,
 startTime ,
 endTime ,
 color ,isCompleted) VALUES ('${model.title}',
 '${model.note}',
 '${model.date}','${model.startTime}','${model.endTime}','${model.color}','${model.isCompleted}')
''');
}
 
Future<int> updateDb(int id)async{
  return await db.rawUpdate('''
UPDATE Tasks  SET isCompleted =?
WHERE id =?
''',[1,id]);
}


Future<int> deleteFromDb(int id)async{
  return await db.rawDelete('''
DELETE FROM Tasks WHERE id =?
''',[id]);
}
}