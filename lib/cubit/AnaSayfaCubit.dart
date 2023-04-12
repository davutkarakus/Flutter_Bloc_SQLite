
import 'package:flutter/animation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter_bloc_sqlite/entity/ToDos.dart';
import 'package:todo_flutter_bloc_sqlite/repo/Todosdao_repository.dart';

class AnaSayfaCubit extends Cubit<List<ToDos>> {
  AnaSayfaCubit():super(<ToDos>[]);

  var trepo = TodosDaoRepository();

  Future<void> showTodos() async {
     var liste = await trepo.showAllToDos();
     emit(liste);
  }
  Future<void> ara(String aramaKelimesi) async{
    var liste = await trepo.todoAra(aramaKelimesi);
    emit(liste);
  }
  Future<void> sil(int id) async {
    trepo.todoSil(id);
  }
}