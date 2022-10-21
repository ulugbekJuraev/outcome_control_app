import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:outcome_app/providers/hive_boxes.dart';

class MonthlyLineChart extends StatefulWidget {
  const MonthlyLineChart({Key? key}) : super(key: key);

  @override
  State<MonthlyLineChart> createState() => _MonthlyLineChartState();
}

class _MonthlyLineChartState extends State<MonthlyLineChart> {
  List<FlSpot> cardGetSpots() {
    final cardbox = HiveBoxes.cardNotes.values.toList();

    List<FlSpot> spots = [];

    final nowTime = DateTime.now();
    String date = DateFormat('dd.MM.yyyy').format(nowTime);

    if (cardbox.isNotEmpty) {
      // List seventhDay = [];

      // for (var element in cardbox) {
      //   final elementDateSplit = element.date.split('').take(2).join('');
      //   final todayDatesplit = date.split('').take(2).join('');

      //   final elementMonth = element.date.substring(3, 5);
      //   final todayDatemont = date.substring(3, 5);

      //   int elementDate = int.parse(elementDateSplit);
      //   int todayDate = int.parse(todayDatesplit);

      //   int elementMonthInt = int.parse(elementMonth);
      //   int todayMonthInt = int.parse(todayDatemont);

      //   if (((todayDate - elementDate) == 6) &&
      //       (todayMonthInt - elementMonthInt) == 0) {
      //     var price = int.parse(element.price);
      //     seventhDay.add(price);
      //   }
      // }

      // if (seventhDay.isNotEmpty) {
      //   num same6 = 0;

      //   seventhDay.forEach((element) {
      //     same6 += element;
      //   });

      //   double x6 = 35;
      //   double y6 = 0;

      //   double sameDouble6 = same6.floorToDouble();
      //   if (sameDouble6 > 9999999) {
      //     sameDouble6 = 9999999;
      //   }
      //   y6 = sameDouble6;
      //   spots.add(FlSpot(x6, y6));
      // } else {
      //   double x1 = 35;
      //   double y1 = 0;
      //   spots.add(FlSpot(x1, y1));
      // }

      // //SIXDAY
      // List sixthDay = [];

      // for (var element in cardbox) {
      //   final elementDateSplit = element.date.split('').take(2).join('');
      //   final todayDatesplit = date.split('').take(2).join('');

      //   final elementMonth = element.date.substring(3, 5);
      //   final todayDatemont = date.substring(3, 5);

      //   int elementDate = int.parse(elementDateSplit);
      //   int todayDate = int.parse(todayDatesplit);

      //   int elementMonthInt = int.parse(elementMonth);
      //   int todayMonthInt = int.parse(todayDatemont);

      //   if (((todayDate - elementDate) == 5) &&
      //       (todayMonthInt - elementMonthInt) == 0) {
      //     var price = int.parse(element.price);
      //     sixthDay.add(price);
      //   }
      // }

      // if (sixthDay.isNotEmpty) {
      //   num same5 = 0;

      //   sixthDay.forEach((element) {
      //     same5 += element;
      //   });

      //   double x5 = 30;
      //   double y5 = 0;

      //   double sameDouble5 = same5.floorToDouble();
      //   if (sameDouble5 > 9999999) {
      //     sameDouble5 = 9999999;
      //   }
      //   y5 = sameDouble5;
      //   spots.add(FlSpot(x5, y5));
      // } else {
      //   double x1 = 30;
      //   double y1 = 0;
      //   spots.add(FlSpot(x1, y1));
      // }

      //FIFTHDAY
      List fifthDay = [];

      for (var element in cardbox) {
        final elementDateSplit = element.date.split('').take(2).join('');
        final todayDatesplit = date.split('').take(2).join('');

        final elementMonth = element.date.substring(3, 5);
        final todayDatemont = date.substring(3, 5);

        int elementDate = int.parse(elementDateSplit);
        int todayDate = int.parse(todayDatesplit);

        int elementMonthInt = int.parse(elementMonth);
        int todayMonthInt = int.parse(todayDatemont);

        if (((todayDate - elementDate) < 31) && ((todayDate - elementDate) > 28) &&
            (todayMonthInt - elementMonthInt) == 0) {
          var price = int.parse(element.price);
          fifthDay.add(price);
          print('FIVE DAYs == 4  $fifthDay');
        }
      }

      if (fifthDay.isNotEmpty) {
        num same4 = 0;

        fifthDay.forEach((element) {
          same4 += element;
        });

        double x4 = 25;
        double y4 = 0;

        double sameDouble4 = same4.floorToDouble();
        if (sameDouble4 > 9999999) {
          sameDouble4 = 9999999;
        }
        y4 = sameDouble4;
        spots.add(FlSpot(x4, y4));
      } else {
        double x1 = 25;
        double y1 = 0;
        spots.add(FlSpot(x1, y1));
      }

      //FOUTHDAY
      List fourthDay = [];

      for (var element in cardbox) {
        final elementDateSplit = element.date.split('').take(2).join('');
        final todayDatesplit = date.split('').take(2).join('');

        final elementMonth = element.date.substring(3, 5);
        final todayDatemont = date.substring(3, 5);

        int elementDate = int.parse(elementDateSplit);
        int todayDate = int.parse(todayDatesplit);

        int elementMonthInt = int.parse(elementMonth);
        int todayMonthInt = int.parse(todayDatemont);

        if (((todayDate - elementDate) < 28) && ((todayDate - elementDate) > 21) &&
            (todayMonthInt - elementMonthInt) == 0) {
          var price = int.parse(element.price);
          fourthDay.add(price);
          print('THree DAYs == 3  $fourthDay');
        }
      }

      if (fourthDay.isNotEmpty) {
        num same3 = 0;

        fourthDay.forEach((element) {
          same3 += element;
        });

        double x3 = 20;
        double y3 = 0;

        double sameDouble3 = same3.floorToDouble();
        if (sameDouble3 > 9999999) {
          sameDouble3 = 9999999;
        }
        y3 = sameDouble3;
        spots.add(FlSpot(x3, y3));
      } else {
        double x1 = 20;
        double y1 = 0;
        spots.add(FlSpot(x1, y1));
      }

      //THIRDDAY
      List thirdDay = [];

      for (var element in cardbox) {
        final elementDateSplit = element.date.split('').take(2).join('');
        final todayDatesplit = date.split('').take(2).join('');

        final elementMonth = element.date.substring(3, 5);
        final todayDatemont = date.substring(3, 5);

        int elementDate = int.parse(elementDateSplit);
        int todayDate = int.parse(todayDatesplit);

        int elementMonthInt = int.parse(elementMonth);
        int todayMonthInt = int.parse(todayDatemont);

        if (((todayDate - elementDate) < 21) && ((todayDate - elementDate) > 14) &&
            (todayMonthInt - elementMonthInt) == 0) {
          var price = int.parse(element.price);
          thirdDay.add(price);
          print('TWO DAYs == 2  $thirdDay');
        }
      }

      if (thirdDay.isNotEmpty) {
        num same2 = 0;

        thirdDay.forEach((element) {
          same2 += element;
        });

        double x2 = 15;
        double y2 = 0;

        double sameDouble2 = same2.floorToDouble();
        if (sameDouble2 > 9999999) {
          sameDouble2 = 9999999;
        }
        y2 = sameDouble2;
        spots.add(FlSpot(x2, y2));
      } else {
        double x1 = 15;
        double y1 = 0;
        spots.add(FlSpot(x1, y1));
      }

      //SECONDDAY
      List secondDay = [];
      num same1 = 0;

      for (var element in cardbox) {
        final elementDateSplit = element.date.split('').take(2).join('');
        final todayDatesplit = date.split('').take(2).join('');

        final elementMonth = element.date.substring(3, 5);
        final todayDatemont = date.substring(3, 5);

        int elementDate = int.parse(elementDateSplit);
        int todayDate = int.parse(todayDatesplit);

        int elementMonthInt = int.parse(elementMonth);
        int todayMonthInt = int.parse(todayDatemont);

        if (((todayDate - elementDate) < 14) && ((todayDate - elementDate) > 7) &&
            (todayMonthInt - elementMonthInt) == 0) {
          var price = int.parse(element.price);
          secondDay.add(price);
          print('ONE DAY == 1  $secondDay');
        }
      }

      if (secondDay.isNotEmpty) {
        double x1 = 10;
        double y1 = 0;

        double sameDouble1 = same1.floorToDouble();
        if (sameDouble1 > 9999999) {
          sameDouble1 = 9999999;
        }
        y1 = sameDouble1;
        secondDay.forEach((element) {
          same1 += element;

          spots.add(FlSpot(x1, y1));
        });
      } else {
        double x1 = 10;
        double y1 = 0;
        spots.add(FlSpot(x1, y1));
      }

      //SameDay
      List sameDayList = [];

      for (var element in cardbox) {
        final elementDateSplit = element.date.split('').take(2).join('');
        final todayDatesplit = date.split('').take(2).join('');

        final elementMonth = element.date.substring(3, 5);
        final todayDatemont = date.substring(3, 5);

        int elementDate = int.parse(elementDateSplit);
        int todayDate = int.parse(todayDatesplit);

        int elementMonthInt = int.parse(elementMonth);
        int todayMonthInt = int.parse(todayDatemont);

        if (((todayDate - elementDate) < 7) && ((todayDate - elementDate) > 0) &&
            (todayMonthInt - elementMonthInt) == 0) {
          int price = int.parse(element.price);
          sameDayList.add(price);
          print('SAME DAY == 0  $sameDayList');
        }
      }

      if (sameDayList.isNotEmpty) {
        num same = 0;

        sameDayList.forEach((element) {
          same += element;
        });

        double sameDouble = same.floorToDouble();
        if (sameDouble > 9999999) {
          sameDouble = 9999999;
        }
        double y = sameDouble;
        double x = 5;
        spots.add(FlSpot(x, y));
      } else {
        double x1 = 5;
        double y1 = 0;
        spots.add(FlSpot(x1, y1));
      }
    }

    return spots;
  }

  List<FlSpot> cashGetSpots() {

    final cashBox = HiveBoxes.notes.values.toList();

    List<FlSpot> spots = [];

    final nowTime = DateTime.now();
    String date = DateFormat('dd.MM.yyyy').format(nowTime);

    if (cashBox.isNotEmpty) {
    //   List seventhDay = [];

    //   for (var element in cashBox) {
    //     final elementDateSplit = element.date.split('').take(2).join('');
    //     final todayDatesplit = date.split('').take(2).join('');

    //     final elementMonth = element.date.substring(3, 5);
    //     final todayDatemont = date.substring(3, 5);

    //     int elementDate = int.parse(elementDateSplit);
    //     int todayDate = int.parse(todayDatesplit);

    //     int elementMonthInt = int.parse(elementMonth);
    //     int todayMonthInt = int.parse(todayDatemont);

    //     if (((todayDate - elementDate) == 6) &&
    //         (todayMonthInt - elementMonthInt) == 0) {
    //       var price = int.parse(element.price);
    //       seventhDay.add(price);
    //     }
    //   }

    //   if (seventhDay.isNotEmpty) {
    //     num same6 = 0;

    //     seventhDay.forEach((element) {
    //       same6 += element;
    //     });

    //     double x6 = 35;
    //     double y6 = 0;

    //     double sameDouble6 = same6.floorToDouble();
    //     if (sameDouble6 > 9999999) {
    //       sameDouble6 = 9999999;
    //     }
    //     y6 = sameDouble6;
    //     spots.add(FlSpot(x6, y6));
    //   } else {
    //     double x1 = 35;
    //     double y1 = 0;
    //     spots.add(FlSpot(x1, y1));
    //   }

    //   //SIXDAY
    //   List sixthDay = [];

    //   for (var element in cashBox) {
    //     final elementDateSplit = element.date.split('').take(2).join('');
    //     final todayDatesplit = date.split('').take(2).join('');

    //     final elementMonth = element.date.substring(3, 5);
    //     final todayDatemont = date.substring(3, 5);

    //     int elementDate = int.parse(elementDateSplit);
    //     int todayDate = int.parse(todayDatesplit);

    //     int elementMonthInt = int.parse(elementMonth);
    //     int todayMonthInt = int.parse(todayDatemont);

    //     if (((todayDate - elementDate) == 5) &&
    //         (todayMonthInt - elementMonthInt) == 0) {
    //       var price = int.parse(element.price);
    //       sixthDay.add(price);
    //     }
    //   }

    //   if (sixthDay.isNotEmpty) {
    //     num same5 = 0;

    //     sixthDay.forEach((element) {
    //       same5 += element;
    //     });

    //     double x5 = 30;
    //     double y5 = 0;

    //     double sameDouble5 = same5.floorToDouble();
    //     if (sameDouble5 > 9999999) {
    //       sameDouble5 = 9999999;
    //     }
    //     y5 = sameDouble5;
    //     spots.add(FlSpot(x5, y5));
    //   } else {
    //     double x1 = 30;
    //     double y1 = 0;
    //     spots.add(FlSpot(x1, y1));
    //   }

      //FIFTHDAY
      List fifthDay = [];

      for (var element in cashBox) {
        final elementDateSplit = element.date.split('').take(2).join('');
        final todayDatesplit = date.split('').take(2).join('');

        final elementMonth = element.date.substring(3, 5);
        final todayDatemont = date.substring(3, 5);

        int elementDate = int.parse(elementDateSplit);
        int todayDate = int.parse(todayDatesplit);

        int elementMonthInt = int.parse(elementMonth);
        int todayMonthInt = int.parse(todayDatemont);

        if (((todayDate - elementDate) < 31) && ((todayDate - elementDate) > 28) &&
            (todayMonthInt - elementMonthInt) == 0) {
          var price = int.parse(element.price);
          fifthDay.add(price);
          print('FIVE DAYs == 4  $fifthDay');
        }
      }

      if (fifthDay.isNotEmpty) {
        num same4 = 0;

        fifthDay.forEach((element) {
          same4 += element;
        });

        double x4 = 25;
        double y4 = 0;

        double sameDouble4 = same4.floorToDouble();
        if (sameDouble4 > 9999999) {
          sameDouble4 = 9999999;
        }
        y4 = sameDouble4;
        spots.add(FlSpot(x4, y4));
      } else {
        double x1 = 25;
        double y1 = 0;
        spots.add(FlSpot(x1, y1));
      }

      //FOUTHDAY
      List fourthDay = [];

      for (var element in cashBox) {
        final elementDateSplit = element.date.split('').take(2).join('');
        final todayDatesplit = date.split('').take(2).join('');

        final elementMonth = element.date.substring(3, 5);
        final todayDatemont = date.substring(3, 5);

        int elementDate = int.parse(elementDateSplit);
        int todayDate = int.parse(todayDatesplit);

        int elementMonthInt = int.parse(elementMonth);
        int todayMonthInt = int.parse(todayDatemont);

        if (((todayDate - elementDate) < 28) && ((todayDate - elementDate) > 21) &&
            (todayMonthInt - elementMonthInt) == 0) {
          var price = int.parse(element.price);
          fourthDay.add(price);
          print('THree DAYs == 3  $fourthDay');
        }
      }

      if (fourthDay.isNotEmpty) {
        num same3 = 0;

        fourthDay.forEach((element) {
          same3 += element;
        });

        double x3 = 20;
        double y3 = 0;

        double sameDouble3 = same3.floorToDouble();
        if (sameDouble3 > 9999999) {
          sameDouble3 = 9999999;
        }
        y3 = sameDouble3;
        spots.add(FlSpot(x3, y3));
      } else {
        double x1 = 20;
        double y1 = 0;
        spots.add(FlSpot(x1, y1));
      }

      //THIRDDAY
      List thirdDay = [];

      for (var element in cashBox) {
        final elementDateSplit = element.date.split('').take(2).join('');
        final todayDatesplit = date.split('').take(2).join('');

        final elementMonth = element.date.substring(3, 5);
        final todayDatemont = date.substring(3, 5);

        int elementDate = int.parse(elementDateSplit);
        int todayDate = int.parse(todayDatesplit);

        int elementMonthInt = int.parse(elementMonth);
        int todayMonthInt = int.parse(todayDatemont);

        if (((todayDate - elementDate) < 21) && ((todayDate - elementDate) > 14) &&
            (todayMonthInt - elementMonthInt) == 0) {
          var price = int.parse(element.price);
          thirdDay.add(price);
          print('TWO DAYs == 2  $thirdDay');
        }
      }

      if (thirdDay.isNotEmpty) {
        num same2 = 0;

        thirdDay.forEach((element) {
          same2 += element;
        });

        double x2 = 15;
        double y2 = 0;

        double sameDouble2 = same2.floorToDouble();
        if (sameDouble2 > 9999999) {
          sameDouble2 = 9999999;
        }
        y2 = sameDouble2;
        spots.add(FlSpot(x2, y2));
      } else {
        double x1 = 15;
        double y1 = 0;
        spots.add(FlSpot(x1, y1));
      }

      //SECONDDAY
      List secondDay = [];
      num same1 = 0;

      for (var element in cashBox) {
        final elementDateSplit = element.date.split('').take(2).join('');
        final todayDatesplit = date.split('').take(2).join('');

        final elementMonth = element.date.substring(3, 5);
        final todayDatemont = date.substring(3, 5);

        int elementDate = int.parse(elementDateSplit);
        int todayDate = int.parse(todayDatesplit);

        int elementMonthInt = int.parse(elementMonth);
        int todayMonthInt = int.parse(todayDatemont);

        if (((todayDate - elementDate) < 14) && ((todayDate - elementDate) > 7) &&
            (todayMonthInt - elementMonthInt) == 0) {
          var price = int.parse(element.price);
          secondDay.add(price);
          print('ONE DAY == 1  $secondDay');
        }
      }

      if (secondDay.isNotEmpty) {
        double x1 = 10;
        double y1 = 0;

        double sameDouble1 = same1.floorToDouble();
        if (sameDouble1 > 9999999) {
          sameDouble1 = 9999999;
        }
        y1 = sameDouble1;
        secondDay.forEach((element) {
          same1 += element;

          spots.add(FlSpot(x1, y1));
        });
      } else {
        double x1 = 10;
        double y1 = 0;
        spots.add(FlSpot(x1, y1));
      }

      //SameDay
      List sameDayList = [];

      for (var element in cashBox) {
        final elementDateSplit = element.date.split('').take(2).join('');
        final todayDatesplit = date.split('').take(2).join('');

        final elementMonth = element.date.substring(3, 5);
        final todayDatemont = date.substring(3, 5);

        int elementDate = int.parse(elementDateSplit);
        int todayDate = int.parse(todayDatesplit);

        int elementMonthInt = int.parse(elementMonth);
        int todayMonthInt = int.parse(todayDatemont);

        if (((todayDate - elementDate) < 7) && ((todayDate - elementDate) > 0) && 
            (todayMonthInt - elementMonthInt) == 0) {
          int price = int.parse(element.price);
          sameDayList.add(price);
          print('SAME DAY == 0  $sameDayList');
        }
      }

      if (sameDayList.isNotEmpty) {
        num same = 0;

        sameDayList.forEach((element) {
          same += element;
        });

        double sameDouble = same.floorToDouble();
        if (sameDouble > 9999999) {
          sameDouble = 9999999;
        }
        double y = sameDouble;
        double x = 5;
        spots.add(FlSpot(x, y));
      } else {
        double x1 = 5;
        double y1 = 0;
        spots.add(FlSpot(x1, y1));
      }
    }

    return spots;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 411,
            maxHeight: 150,
          ),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.03,
            ),
            width: width * 0.95,
            height: height * 1,
            child: LineChart(
              LineChartData(
                lineTouchData: LineTouchData(
                  touchTooltipData: LineTouchTooltipData(
                    tooltipBgColor: Color.fromARGB(255, 216, 200, 241),
                  ),
                ),
                titlesData: FlTitlesData(show: false),
                borderData: FlBorderData(show: false),
                minX: 0,
                maxX:40,
                minY: 0,
                maxY: 15000000,
                gridData: FlGridData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFFE763F2),
                        Color(0xFFE763F2),
                      ],
                    ),
                    isCurved: true,
                    barWidth: 5,
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 137, 74, 231),
                          Color.fromARGB(2, 230, 99, 242),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    spots: cardGetSpots(),
                  )
                ],
              ),
            ),
          ),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 411,
            maxHeight: 150,
          ),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.03,
            ),
            width: width * 0.97,
            height: height * 1,
            child: LineChart(
              LineChartData(
                lineTouchData: LineTouchData(
                  touchTooltipData: LineTouchTooltipData(
                    tooltipBgColor: Color.fromARGB(255, 216, 200, 241),
                  ),
                ),
                titlesData: FlTitlesData(show: false),
                borderData: FlBorderData(show: false),
                minX: 0,
                maxX: 40,
                minY: 0,
                maxY: 15000000,
                gridData: FlGridData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF9453F4),
                        Color(0xFF9453F4),
                      ],
                    ),
                    isCurved: true,
                    barWidth: 5,
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 137, 74, 231),
                          Color.fromARGB(2, 230, 99, 242),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    spots: cashGetSpots(),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}


// class LineTtiles {
//   static getTitlesData() => FlTitlesData(
//         show: true,
//         topTitles: AxisTitles(
//           sideTitles: SideTitles(
//             showTitles: false,
//           ),
//         ),
//         leftTitles: AxisTitles(
//           sideTitles: SideTitles(
//             showTitles: false,
//           ),
//         ),
//         rightTitles: AxisTitles(
//           sideTitles: SideTitles(
//             showTitles: false,
//           ),
//         ),
//         bottomTitles: AxisTitles(
//           sideTitles: SideTitles(
//             getTitlesWidget: (value, meta) {
//               switch (value.toInt()) {
                // case 2:
                //   return const Text(
                //     'Пн',
                //     style: TextStyle(
                //       fontSize: 15,
                //       fontWeight: FontWeight.bold,
                //     ),
                //   );
                // case 4:
                //   return const Text(
                //     'Вт',
                //     style: TextStyle(
                //       fontSize: 15,
                //       fontWeight: FontWeight.bold,
                //     ),
                //   );
                // case 6:
                //   return const Text(
                //     'Ср',
                //     style: TextStyle(
                //       fontSize: 15,
                //       fontWeight: FontWeight.bold,
                //     ),
//                 //   );
//                 case 8:
//                   return const Text(
//                     'График за месяц',
//                     style: TextStyle(
//                       fontSize: 15,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   );
//                 // case 10:
//                 //   return const Text(
//                 //     'График за месяц',
//                 //     style: TextStyle(
//                 //       fontSize: 15,
//                 //       fontWeight: FontWeight.bold,
//                 //     ),
//                 //   );
//                 // case 12:
//                 //   return const Text(
//                 //     'Сб',
//                 //     style: TextStyle(
//                 //       fontSize: 15,
//                 //       fontWeight: FontWeight.bold,
//                 //     ),
//                 //   );
//                 // case 14:
//                 //   return const Text(
//                 //     'Вс',
//                 //     style: TextStyle(
//                 //       fontSize: 15,
//                 //       fontWeight: FontWeight.bold,
//                 //     ),
//                 //   );
//               }
//               return const Text('');
//             },
//             reservedSize: 20,
//             showTitles: true,
//           ),
//         ),
//       );
// }
