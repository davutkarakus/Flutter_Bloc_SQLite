
import 'package:todo_flutter_bloc_sqlite/sqlite/veritabani_yardimcisi.dart';

import '../entity/ToDos.dart';

class TodosDaoRepository {
  Future<void> todoKayit(String toDoItem,String toDoDate) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    var bilgiler = Map<String,dynamic>();
    bilgiler["todo_description"] = toDoItem;
    bilgiler["todo_date"] = toDoDate;
    await db.insert("todos", bilgiler);
  }

  Future<void> todoGuncelle(int toDoId, String toDoItem,String toDoDate) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    var bilgiler = Map<String,dynamic>();
    bilgiler["todo_description"] = toDoItem;
    bilgiler["todo_date"] = toDoDate;
    await db.update("todos", bilgiler,where: "todo_id=?",whereArgs: [toDoId]);
  }

  Future<List<ToDos>> showAllToDos() async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM todos");
    
    return List.generate(maps.length, (i) {
      var satir = maps[i];
      return ToDos(toDoId: satir["todo_id"], toDoItem: satir["todo_description"], toDoDate: satir["todo_date"]);

    });
  }

  Future<List<ToDos>> todoAra(String aramaKelimesi) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM todos WHERE todo_description like '%$aramaKelimesi%'");

    return List.generate(maps.length, (i) {
      var satir = maps[i];
      return ToDos(toDoId: satir["todo_id"], toDoItem: satir["todo_description"], toDoDate: satir["todo_date"]);
    });
  }
  Future<void> todoSil(int id) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    await db.delete("todos",where: "todo_id=?",whereArgs: [id]);
  }
}