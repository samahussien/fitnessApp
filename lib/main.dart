import 'package:fitness/modules/goal_screen.dart';
import 'package:fitness/shared/bloc_observer.dart';
import 'package:fitness/shared/colors.dart';
import 'package:fitness/shared/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {
  Bloc.observer=MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..createDataBase(),

      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: mainColor,
          appBarTheme: AppBarTheme(
            elevation: 0.0,
           backgroundColor:mainColor
          ),
          primarySwatch: Colors.deepOrange,
        ),
        home: GoalScreen(),
      ),
    );
  }
}
