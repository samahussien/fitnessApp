import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:fitness/shared/colors.dart';
import 'package:fitness/shared/cubit.dart';
import 'package:fitness/shared/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

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
                    padding: const EdgeInsets.only(right: 20.0, top: 25),
                    child: IconButton(
                      icon: const Icon(Icons.more_horiz_rounded),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            body: ConditionalBuilder(
              condition: cubit.loadStatus ,
              builder: (context)=>Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          CircularPercentIndicator(
                            radius: 120,
                            lineWidth: 5,
                            backgroundColor: HexColor('#2f2b53'),
                            percent: 0.6,
                            progressColor: lineColor,
                            circularStrokeCap: CircularStrokeCap.round,
                            animation: true,
                            center: CircleAvatar(
                              radius: 45.0,
                              backgroundImage:
                              AssetImage('${cubit.users[0]['img']}'),
                            ),
                          ),
                          const SizedBox(
                            width: 80,
                          ),
                          VerticalDivider(
                            color: lightMuteColor.withOpacity(0.1),
                            thickness: 2,
                            indent: 10,
                            endIndent: 10,
                          ),
                          const SizedBox(
                            width: 44,
                          ),

                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Joined',
                                style: TextStyle(
                                    fontSize: 15, color: lightMuteColor),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '${9 - (int.parse('${9 - (int.parse(cubit.users[0]['JoinDate']))}'))}',
                                    style: const TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  ),
                                  const Text(
                                    ' mon ago',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${cubit.users[0]['firstName']}',
                          style: const TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '${cubit.users[0]['lastName']}',
                          style: TextStyle(
                            fontSize: 35,
                            color: darkMuteColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 45,
                              height: 45,
                              child: const Icon(
                                Icons.radio_button_checked,
                                color: Colors.orange,
                                size: 30,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.0),
                                color: Colors.deepOrange.withOpacity(0.3),
                              ),
                            ),
                            const Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 18.0),
                                  child: Text(
                                    'Goals',
                                    style:
                                    TextStyle(fontSize: 22, color: Colors.white),
                                  ),
                                )),
                            Container(
                              width: 45,
                              height: 45,
                              child: const Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.white,
                                size: 18,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: buttonColor.withOpacity(0.1),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 18),
                        Row(
                          children: [
                            Container(
                              width: 45,
                              height: 45,
                              child: Icon(
                                Icons.person,
                                color: HexColor('#ba7dc9'),
                                size: 30,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.0),
                                color: Colors.deepPurpleAccent.withOpacity(0.2),
                              ),
                            ),
                            const Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 18.0),
                                  child: Text(
                                    'My Body',
                                    style:
                                    TextStyle(fontSize: 22, color: Colors.white),
                                  ),
                                )),
                            Container(
                              width: 45,
                              height: 45,
                              child: const Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.white,
                                size: 18,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: buttonColor.withOpacity(0.1),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 18),
                        Row(
                          children: [
                            Container(
                              width: 45,
                              height: 45,
                              child: Icon(
                                Icons.settings_rounded,
                                color: HexColor('#99d9fd'),
                                size: 30,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.0),
                                color: HexColor('#3555a1').withOpacity(0.4),
                              ),
                            ),
                            const Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 18.0),
                                  child: Text(
                                    'Settings',
                                    style:
                                    TextStyle(fontSize: 22, color: Colors.white),
                                  ),
                                )),
                            Container(
                              width: 45,
                              height: 45,
                              child: const Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.white,
                                size: 18,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: buttonColor.withOpacity(0.1),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextButton(
                        onPressed: () {
                          cubit.insertDataBase();
                        },
                        child: Container(
                          width: 130,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: buttonColor.withOpacity(0.1),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.logout,
                                color: HexColor('#fb2858'),
                                size: 20,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                'Sign Out',
                                style:
                                TextStyle(color: Colors.white, fontSize: 17),
                              )
                            ],
                          ),
                        )),
                  ],
                ),
              ),
              fallback: (context) => Center(child: CircularProgressIndicator()),
            )
        );
      },
    );
  }
}
