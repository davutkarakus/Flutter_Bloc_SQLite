
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter_bloc_sqlite/constant/colors.dart';
import 'package:todo_flutter_bloc_sqlite/cubit/AramaKontrolCubit.dart';
import 'package:todo_flutter_bloc_sqlite/entity/ToDos.dart';
import 'package:todo_flutter_bloc_sqlite/pages/DetaySayfa.dart';
import 'package:todo_flutter_bloc_sqlite/pages/KayitSayfa.dart';

class AnaSayfa extends StatelessWidget {
  const AnaSayfa({Key? key}) : super(key: key);

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
  @override
  Widget build(BuildContext context) {
    bool aramaYapiliyorMu = false;
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: BlocBuilder<AramaKontrolCubit,bool>(
            builder: (context,kontrol) {
              return kontrol ?
               TextField(
                 style: TextStyle(color: Colors.white),
                onChanged: (aramaSonucu){
                  print("Arama sonucu : $aramaSonucu");
                },
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(color: Colors.white54),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white54)
                  )
                ),

              ) :
              const Text("All ToDos");
            }
            ),
        actions: [
          BlocBuilder<AramaKontrolCubit,bool>(
              builder: (context,kontrol){
                return kontrol ?
                IconButton(
                    onPressed: (){
                      context.read<AramaKontrolCubit>().aramaKontrol(aramaYapiliyorMu);

                    },
                    icon: Icon(Icons.cancel)) :
                IconButton(
                    onPressed: (){
                      context.read<AramaKontrolCubit>().aramaKontrol(aramaYapiliyorMu);
                    },
                    icon: Icon(Icons.search)
                );
              }
          ),
        ],
      ),
      body: FutureBuilder<List<ToDos>>(
        future: showAllToDos(),
        builder: (context,snapshot){
          if (snapshot.hasData){
            var todoList = snapshot.data;
            return ListView.builder(
                itemCount: todoList!.length,
                itemBuilder: (context,indeks){
                  var todo = todoList[indeks];
                  return Padding(
                    padding: const EdgeInsets.only(top: 15,left: 10,right: 10),
                    child: SizedBox(
                      height: 100,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13)
                        ),
                        color: cardColor,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(todo.toDoItem,style: const TextStyle(fontSize: 17,color: Colors.white),),
                                  Text(todo.toDoDate,style: const TextStyle(color: Colors.white54),),
                                ],
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(10))
                                ),
                                child: IconButton(
                                    onPressed: (){
                                      print("${todo.toDoItem} silindi");
                                    },
                                    icon: const Icon(Icons.delete_outline,color: Colors.red,)
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }
            );
          }else {
            return const Center();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => KayitSayfa()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
