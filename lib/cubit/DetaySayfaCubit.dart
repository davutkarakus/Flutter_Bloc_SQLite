import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter_bloc_sqlite/repo/Todosdao_repository.dart';

class DetaySayfaCubit extends Cubit<void>{
  DetaySayfaCubit():super(0);

  var trepo = TodosDaoRepository();

  Future<void> guncelle(int toDoId, String toDoItem,String toDoDate) async {
    await trepo.todoGuncelle(toDoId, toDoItem, toDoDate);
  }

}