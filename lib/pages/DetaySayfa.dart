import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter_bloc_sqlite/cubit/DetaySayfaCubit.dart';
import 'package:todo_flutter_bloc_sqlite/entity/ToDos.dart';

class DetaySayfa extends StatelessWidget {

  ToDos todo;
  DetaySayfa({required this.todo});

  var tfToDoItem = TextEditingController();
  var tfToDoDate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    tfToDoItem.text = todo.toDoItem;
    tfToDoDate.text = todo.toDoDate;
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit To Do"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: tfToDoItem,
                decoration: InputDecoration(
                    hintText: "New to do item"
                ),
              ),
              TextField(
                controller: tfToDoDate,
                decoration: InputDecoration(
                    hintText: "Date"
                ),
                onTap: () {
                  showDatePicker(context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2050)
                  ).then((alinanTarih) {
                    tfToDoDate.text = "${alinanTarih!.day}/${alinanTarih.month}/${alinanTarih.year}";
                  });
                },
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: (){
                      context.read<DetaySayfaCubit>().guncelle(todo.toDoId, tfToDoItem.text, tfToDoDate.text);
                    },
                    child: Text("EDIT")
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
