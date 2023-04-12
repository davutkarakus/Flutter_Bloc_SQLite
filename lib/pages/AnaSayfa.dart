
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter_bloc_sqlite/cubit/AramaKontrolCubit.dart';
import 'package:todo_flutter_bloc_sqlite/entity/ToDos.dart';
import 'package:todo_flutter_bloc_sqlite/pages/DetaySayfa.dart';
import 'package:todo_flutter_bloc_sqlite/pages/KayitSayfa.dart';

class AnaSayfa extends StatelessWidget {
  const AnaSayfa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool aramaYapiliyorMu = false;
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<AramaKontrolCubit,bool>(
            builder: (context,kontrol) {
              return kontrol ?
              const TextField(
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => KayitSayfa()));
        //  var todo = ToDos(toDoId: 1, toDoItem: "Arabayı Yıka", toDoDate: "17/10/2023");
        //  Navigator.push(context, MaterialPageRoute(builder: (context) => DetaySayfa(todo: todo)));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
