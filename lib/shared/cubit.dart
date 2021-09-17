import 'package:bloc/bloc.dart';
import 'package:fitness/shared/colors.dart';
import 'package:fitness/shared/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

class AppCubit extends Cubit<AppStates> {
  var database;
  List<Map> users = [];

  List<WeightData> ChartData = [];
  List<WeightData> getChartData() {
    final List<WeightData> chartData = [
      WeightData(4.1, 70.5, lineColor),
      WeightData(4.2, 71, lineColor),
      WeightData(4.3, 70.8, lineColor),
      WeightData(4.4, 70.2, lineColor),
      WeightData(4.5, 70.1, lineColor),
      WeightData(4.6, 70.2, lineColor),
      WeightData(4.7, 71.1, lineColor),
      WeightData(4.8, 70, lineColor),
      WeightData(4.9, 69.8, lineColor),
      WeightData(5, 71, lineColor),
      WeightData(5.1, 71.5, lineColor),
      WeightData(5.2, 71, lineColor),
      WeightData(5.3, 72, lineColor),
      WeightData(5.4, 72.2, lineColor),
      WeightData(5.5, 72, lineColor),
      WeightData(5.6, 72.25, Colors.grey),
      WeightData(5.7, 72.5, Colors.grey),
      WeightData(5.8, 72.75, Colors.grey),
      WeightData(5.9, 73, Colors.grey),
      WeightData(6, 73.25, Colors.grey),
      WeightData(6.1, 73.5, Colors.grey),
      WeightData(6.1, 73.75, Colors.grey),
      WeightData(6.1, 74, Colors.grey),
    ];
    return chartData;
  }

  AppCubit() : super(AppInitialStates());
  static AppCubit get(context) => BlocProvider.of(context);
  void createDataBase() {
    database =
        openDatabase('fit.db', version: 1, onCreate: (database, version) {
      print('database created');
      database
          .execute(
              'CREATE TABLE users (id INTEGER PRIMARY KEY,firstName TEXT,lastName TEXT,img TEXT,JoinDate TEXT,timeToGain TEXT,startWeight DOUBLE,currentWeight DOUBLE,goalWeight DOUBLE)')
          .then((value) {
        print("table created");
      }).catchError((error) {
        print('error while creating table ${error.toString()}');
      });
    }, onOpen: (database) {
      getDataFromDatabase(database).then((value) {
        users = value;
        emit(AppGetDatabaseStates());
        print(users);
      });
      print('database opened');
    }).then((value) {
      database = value;
      emit(AppCreateDatabaseStates());
    });
  }

  void insertDataBase() {
    database.transaction((txn) {
      txn
          .rawInsert(
              'INSERT INTO users( firstName,lastName,img,JoinDate,timeToGain,startWeight,currentWeight,goalWeight) VALUES ("Sama","Hussien","assets/images/noah.jpeg","3","8","65.2","72","74")')
          .then((value) {
        print('$value inserted successfully');
        emit(AppInsertDatabaseStates());
      }).catchError((error) {
        print('error when inserting ${error.toString()}');
      });
      return null;
    });
  }

  Future<List<Map>> getDataFromDatabase(database) async {
    return await database.rawQuery('SELECT * FROM users');
  }
}

class WeightData {
  WeightData(this.month, this.weight, this.lineColor);
  final double month;
  final double weight;
  final Color lineColor;
}
