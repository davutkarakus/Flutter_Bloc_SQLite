
class TodosDaoRepository {
  Future<void> todoKayit(String toDoItem,String toDoDate) async {
    print("Kayıt : ${toDoItem} - ${toDoDate}");
  }

  Future<void> todoGuncelle(int toDoId, String toDoItem,String toDoDate) async {
    print("Güncelle : ${toDoId} ${toDoItem} - ${toDoDate}");
  }

}