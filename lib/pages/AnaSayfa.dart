
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter_bloc_sqlite/constant/colors.dart';
import 'package:todo_flutter_bloc_sqlite/cubit/AramaKontrolCubit.dart';
import 'package:todo_flutter_bloc_sqlite/entity/ToDos.dart';
import 'package:todo_flutter_bloc_sqlite/pages/DetaySayfa.dart';
import 'package:todo_flutter_bloc_sqlite/pages/KayitSayfa.dart';

import '../cubit/AnaSayfaCubit.dart';

class AnaSayfa extends StatelessWidget {
  const AnaSayfa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool aramaYapiliyorMu = false;
    context.read<AnaSayfaCubit>().showTodos();
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: BlocBuilder<AramaKontrolCubit,bool>(
            builder: (context,kontrol) {
              return kontrol ?
              TextField(
                style: const TextStyle(color: Colors.white),
                onChanged: (aramaSonucu){

                  context.read<AnaSayfaCubit>().ara(aramaSonucu);

                },
                decoration: const InputDecoration(
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
                      context.read<AnaSayfaCubit>().showTodos();
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
      body: BlocBuilder<AnaSayfaCubit,List<ToDos>>(
        builder: (context,todoList){
          if (todoList.isNotEmpty){
            return ListView.builder(
                itemCount: todoList.length,
                itemBuilder: (context,indeks){
                  var todo = todoList[indeks];
                  return Padding(
                    padding: const EdgeInsets.only(top: 15,left: 10,right: 10),
                    child: SizedBox(
                      height: 100,
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => DetaySayfa(todo: todo)));
                        },
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
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content: Text("${todo.toDoItem} silinsin mi?"),
                                            action: SnackBarAction(
                                                label: "Evet",
                                                onPressed: (){
                                                  context.read<AnaSayfaCubit>().sil(todo.toDoId);
                                                }
                                            ),
                                          ),
                                        );
                                      },
                                      icon: const Icon(Icons.delete_outline,color: Colors.red,)
                                  ),
                                )
                              ],
                            ),
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
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => KayitSayfa()));
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
