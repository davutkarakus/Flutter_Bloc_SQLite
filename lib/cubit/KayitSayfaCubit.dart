
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter_bloc_sqlite/repo/Todosdao_repository.dart';

class KayitSayfaCubit extends Cubit<void>{
  KayitSayfaCubit():super(0);

  var trepo = TodosDaoRepository();

  Future<void> kayit(String toDoItem,String toDoDate) async {
    await trepo.todoKayit(toDoItem, toDoDate);
  }

}