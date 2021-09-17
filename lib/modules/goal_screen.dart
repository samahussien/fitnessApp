import 'package:fitness/shared/colors.dart';
import 'package:fitness/shared/cubit.dart';
import 'package:fitness/shared/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GoalScreen extends StatelessWidget {
  const GoalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);

        return Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(80.0),
              child: AppBar(
                toolbarHeight: 70,
                leading: Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20.0),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () {},
                  ),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0, top: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.blue,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.mark_chat_unread_rounded),
                        iconSize: 20,
                        onPressed: () {},
                      ),
                    ),
                  )
                ],
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 15.0, bottom: 15),
                    child: Text(
                      'Goals',
                      style: TextStyle(
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'Gain Weight',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: SizedBox(
                          width: 50,
                          child: StepProgressIndicator(
                            totalSteps: 3,
                            size: 1,
                            currentStep: 1,
                            selectedColor: Colors.white,
                            unselectedColor:
                                buttonColor.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                '${cubit.users[0]['currentWeight']}',
                                style: const TextStyle(
                                    fontSize: 40, color: Colors.white),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 20.0),
                                child: Text('kg',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20)),
                              ),
                            ],
                          ),
                          Text(
                            'Current',
                            style: TextStyle(
                              fontSize: 16,
                              color: darkMuteColor,
                            ),
                          )
                          // Text()
                        ],
                      ),
                      const SizedBox(
                        width: 60,
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: darkMuteColor,
                        size: 30,
                      ),
                      const SizedBox(
                        width: 60,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                '${cubit.users[0]['goalWeight']}',
                                style: const TextStyle(
                                    fontSize: 40, color: Colors.white),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 20.0),
                                child: Text('kg',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20)),
                              ),
                            ],
                          ),
                          Text(
                            'Goal',
                            style: TextStyle(
                              fontSize: 16,
                              color: darkMuteColor,
                            ),
                          )

                          // Text()
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 50,
                    child: Row(
                      children: [
                        VerticalDivider(
                          color: lightMuteColor.withOpacity(0.1),
                          thickness: 2,

                          // thickness: 5,
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 15.0, right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(
                                  Icons.flag_outlined,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '${9 - (int.parse(cubit.users[0]['JoinDate']))}',
                                      style: const TextStyle(
                                          fontSize: 22, color: Colors.white),
                                    ),
                                    const Text(
                                      ' mon',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        VerticalDivider(
                          color: lightMuteColor.withOpacity(0.1),
                          thickness: 2,

                          // thickness: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, right: 15),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '~ ${(int.parse(cubit.users[0]['timeToGain'])) - (int.parse('${9 - (int.parse(cubit.users[0]['JoinDate']))}'))}',
                                style: TextStyle(
                                    fontSize: 22, color:darkMuteColor),
                              ),
                              Text(
                                ' mon',
                                style: TextStyle(
                                    fontSize: 15, color: darkMuteColor),
                              ),
                            ],
                          ),
                        ),
                        VerticalDivider(
                          color: lightMuteColor.withOpacity(0.1),
                          thickness: 2,

                          // thickness: 5,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 7.0, left: 7),
                    child: SizedBox(
                      height: 150,
                      child: SfCartesianChart(
                        plotAreaBorderWidth: 0,
                        margin: EdgeInsets.zero,
                        borderColor: lightMuteColor.withOpacity(0.1),
                        borderWidth: 2,
                        series: <ChartSeries>[
                          LineSeries<WeightData, double>(
                            dataSource: cubit.getChartData(),
                            xValueMapper: (WeightData weight, _) =>
                                weight.month,
                            yValueMapper: (WeightData weight, _) =>
                                weight.weight,
                            pointColorMapper: (WeightData weight, _) =>
                                weight.lineColor,
                          ),
                        ],
                        primaryXAxis: NumericAxis(isVisible: false),
                        primaryYAxis: NumericAxis(isVisible: false),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 90,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        VerticalDivider(
                          color: lightMuteColor.withOpacity(0.1),
                          thickness: 2,

                          // thickness: 5,
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 15.0, right: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '${(cubit.users[0]['currentWeight'] - cubit.users[0]['startWeight']).toStringAsFixed(1)}',
                                      style: const TextStyle(
                                          fontSize: 25, color: Colors.white),
                                    ),
                                    const Text(
                                      ' kg',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white),
                                    ),
                                  ],
                                ),
                                Text('Gained',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: darkMuteColor))
                              ],
                            ),
                          ),
                        ),
                        VerticalDivider(
                          color: lightMuteColor.withOpacity(0.1),
                          thickness: 2,

                          // thickness: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, right: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '${(cubit.users[0]['goalWeight'] - cubit.users[0]['currentWeight']).toStringAsFixed(1)}',
                                    style: const TextStyle(
                                        fontSize: 25, color: Colors.white),
                                  ),
                                  const Text(
                                    ' kg  ',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white),
                                  ),
                                ],
                              ),
                              Text(
                                ' left',
                                style: TextStyle(
                                    fontSize: 18, color: darkMuteColor),
                              ),
                            ],
                          ),
                        ),
                        VerticalDivider(
                          color: lightMuteColor.withOpacity(0.1),
                          thickness: 2,

                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ));
      },
    );
  }
}

