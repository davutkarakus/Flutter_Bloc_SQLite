
import '../entity/ToDos.dart';

class TodosDaoRepository {
  Future<void> todoKayit(String toDoItem,String toDoDate) async {
    print("Kayıt : ${toDoItem} - ${toDoDate}");
  }

  Future<void> todoGuncelle(int toDoId, String toDoItem,String toDoDate) async {
    print("Güncelle : ${toDoId} ${toDoItem} - ${toDoDate}");
  }

  Future<List<ToDos>> showAllToDos() async {
    var todosList = <ToDos>[];
    var t1 = ToDos(toDoId: 1, toDoItem: "Arabayı Yıka", toDoDate: "17/10/2022");
    var t2 = ToDos(toDoId: 2, toDoItem: "Java Öğren", toDoDate: "12/02/2021");
    var t3 = ToDos(toDoId: 3, toDoItem: "Bitirme Projene Önem Ver", toDoDate: "01/04/2023");
    todosList.add(t1);
    todosList.add(t2);
    todosList.add(t3);
    return todosList;
  }

  Future<List<ToDos>> todoAra(String aramaKelimesi) async {
    var todosList = <ToDos>[];
    var t1 = ToDos(toDoId: 1, toDoItem: "Arabayı Yıka", toDoDate: "17/10/2022");;
    todosList.add(t1);
    return todosList;
  }
  Future<void> todoSil(int id) async {
    print("Kişi sil : $id");
    await showAllToDos();
  }
}