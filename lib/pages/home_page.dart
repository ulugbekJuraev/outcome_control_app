import 'dart:math';
import 'package:flutter/material.dart';
import 'package:outcome_app/card_cash_ind_lines.dart';
import 'package:outcome_app/components/cardAddComps/cash_o_btn.dart';
import 'package:outcome_app/components/lineCharts/monthly_line_chart.dart';
import 'package:outcome_app/components/lineCharts/weekly_line_chart.dart';
import 'package:outcome_app/components/lineCharts/daily_line_chart.dart';
import 'package:outcome_app/components/text_part.dart';
import 'package:outcome_app/components/top_items.dart';
import '../components/cardOBtn/card_o_btn.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double value = 0.0;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double topHeight = MediaQuery.of(context).padding.top;
    double botHeight = MediaQuery.of(context).padding.bottom;
    double minus = topHeight + botHeight;

    return SingleChildScrollView(
      child: DefaultTabController(
        length: 3,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: height - minus,
            maxWidth: width,
          ),
          child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF9453F4),
                      Colors.white,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              SafeArea(
                child: Container(
                  width: 200,
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      DrawerHeader(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage('assets/avatar.jpeg'),
                          )
                        ],
                      )),
                    ],
                  ),
                ),
              ),
              TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: value),
                duration: const Duration(milliseconds: 500),
                builder: (_, double val, __) {
                  return (Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..setEntry(0, 3, 200 * val)
                      ..rotateY((pi / 6) * val),
                    child: Scaffold(
                      body: Column(
                        children: [
                          ConstrainedBox(
                            constraints: const BoxConstraints(
                              maxWidth: 411,
                              maxHeight: 300,
                            ),
                            child: Container(
                              padding: EdgeInsets.only(
                                top: height * 0.07,
                                left: width * 0.04,
                                right: width * 0.04,
                                bottom: height * 0.02,
                              ),
                              width: double.infinity,
                              height: height * 0.32,
                              decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFF9453F4),
                                      Color(0xFFE763F2),
                                    ],
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(255, 199, 192, 192),
                                      spreadRadius: 2,
                                      blurRadius: 1,
                                      offset: Offset(0, 2),
                                    )
                                  ]),
                              child: Column(
                                children: [
                                  TopItems(
                                    icon: value == 0 ? Icons.menu : Icons.close,
                                    func: () {
                                      setState(() {
                                        value == 0 ? value = 1 : value = 0;
                                      });
                                    },
                                  ),
                                  const CircleAvatar(
                                    backgroundImage:
                                        AssetImage('assets/avatar.jpeg'),
                                    radius: 50,
                                  ),
                                  SizedBox(height: height * 0.01),
                                  Text(
                                    'Ulugbek Juraev',
                                    style: TextStyle(
                                      fontSize: width * 0.06,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              const TextPart(),
                              TabBar(
                                onTap: (value) {},
                                physics: const ScrollPhysics(
                                  parent: BouncingScrollPhysics(),
                                ),
                                splashFactory: NoSplash.splashFactory,
                                indicatorColor: Colors.transparent,
                                unselectedLabelColor: const Color(0xFF9453F4),
                                indicatorSize: TabBarIndicatorSize.label,
                                indicator: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color.fromARGB(255, 187, 182, 182),
                                      spreadRadius: 2,
                                      blurRadius: 1,
                                      offset: Offset(1, 1),
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(50),
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFF9453F4),
                                      Color(0xFFE763F2),
                                    ],
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                  ),
                                ),
                                tabs: [
                                  Tab(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        border: Border.all(
                                            color: const Color(0xFF9453F4),
                                            width: 1),
                                      ),
                                      child: const Align(
                                        alignment: Alignment.center,
                                        child: Text("Месяц"),
                                      ),
                                    ),
                                  ),
                                  Tab(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        border: Border.all(
                                            color: const Color(0xFF9453F4),
                                            width: 1),
                                      ),
                                      child: const Align(
                                        alignment: Alignment.center,
                                        child: Text("Неделя"),
                                      ),
                                    ),
                                  ),
                                  Tab(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        border: Border.all(
                                            color: const Color(0xFF9453F4),
                                            width: 1),
                                      ),
                                      child: const Align(
                                        alignment: Alignment.center,
                                        child: Text("День"),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                             
                             
                             
                              ConstrainedBox(
                                constraints: const BoxConstraints(
                                  maxWidth: 411,
                                  maxHeight: 180,
                                ),
                                child: SizedBox(
                                  width: width * 1,
                                  height: height * 0.23,
                                  child: const TabBarView(
                                    children: [
                                      MonthlyLineChart(),
                                      WeeklyLineChart(),
                                      DailyLineChart(),
                                    ],
                                  ),
                                ),
                              ),
                              const CardCashIndLines(),
                              const CardOutcomeBtn(),
                              const CashOutcomeBtn2(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
