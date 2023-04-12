import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter_bloc_sqlite/constant/colors.dart';
import 'package:todo_flutter_bloc_sqlite/cubit/AramaKontrolCubit.dart';
import 'package:todo_flutter_bloc_sqlite/pages/AnaSayfa.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AramaKontrolCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        home: const AnaSayfa(),
      ),
    );
  }
}

