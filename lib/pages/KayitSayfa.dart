import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter_bloc_sqlite/cubit/KayitSayfaCubit.dart';


class KayitSayfa extends StatelessWidget {

  var tfToDoItem = TextEditingController();
  var tfToDoDate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add a New To Do"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: tfToDoItem,
                decoration: const InputDecoration(
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
                      context.read<KayitSayfaCubit>().kayit(tfToDoItem.text, tfToDoDate.text);
                    },
                    child: Text("SAVE")
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
