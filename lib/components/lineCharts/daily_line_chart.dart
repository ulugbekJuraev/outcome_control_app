import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:outcome_app/providers/hive_boxes.dart';

class DailyLineChart extends StatefulWidget {
  const DailyLineChart({Key? key}) : super(key: key);

  @override
  State<DailyLineChart> createState() => _DailyLineChartState();
}

class _DailyLineChartState extends State<DailyLineChart> {
  List<FlSpot> cardGetSpots() {
    final cardbox = HiveBoxes.cardNotes.values.toList();

    List<FlSpot> cardSpots = [];

    final nowTime = DateTime.now();
    String date = DateFormat('dd.MM.yyyy').format(nowTime);

    List elements = [];

    for (var element in cardbox) {
      if (element.date == date) {
        elements.add(element.price);
      }
    }

    if (elements.length <= 15) {
      double x = 0;
      for (var i = 0; i < elements.length; i++) {
        x = x + 1.0;
        double y = 0;
        double res = double.parse(elements[i]);
        y = res;
        cardSpots.add(FlSpot(x, y));
      }
    } else if (elements.length > 15 && elements.length <= 19) {
      double x = 0;

      for (var i = 0; i < elements.length; i++) {
        x = x + 0.8;
        double y = 0;
        double res = double.parse(elements[i]);
        y = res;
        cardSpots.add(FlSpot(x, y));
      }
    } else if (elements.length > 19 && elements.length <= 25) {
      double x = 0;

      for (var i = 0; i < elements.length; i++) {
        x = x + 0.6;
        double y = 0;
        double res = double.parse(elements[i]);
        y = res;
        cardSpots.add(FlSpot(x, y));
      }
    } else if (elements.length > 25) {
      double x = 0;

      for (var i = 0; i < elements.length; i++) {
        x = x + 0.4;
        double y = 0;
        double res = double.parse(elements[i]);
        y = res;
        cardSpots.add(FlSpot(x, y));
      }
    }

    return cardSpots;
  }

  List<FlSpot> cashGetSpots() {
    final cashBox = HiveBoxes.notes.values.toList();

    List<FlSpot> cashSpots = [];

    final nowTime = DateTime.now();
    String date = DateFormat('dd.MM.yyyy').format(nowTime);

    List elements = [];

    for (var element in cashBox) {
      if (element.date == date) {
        elements.add(element.price);
      }
    }

    if (elements.length <= 15) {
      double x = 0;
      for (var i = 0; i < elements.length; i++) {
        x = x + 1.0;
        double y = 0;
        double res = double.parse(elements[i]);
        y = res;
        cashSpots.add(FlSpot(x, y));
      }
    } else if (elements.length > 15 && elements.length <= 19) {
      double x = 0;

      for (var i = 0; i < elements.length; i++) {
        x = x + 0.8;
        double y = 0;
        double res = double.parse(elements[i]);
        y = res;
        cashSpots.add(FlSpot(x, y));
      }
    } else if (elements.length > 19 && elements.length <= 25) {
      double x = 0;

      for (var i = 0; i < elements.length; i++) {
        x = x + 0.6;
        double y = 0;
        double res = double.parse(elements[i]);
        y = res;
        cashSpots.add(FlSpot(x, y));
      }
    } else if (elements.length > 25) {
      double x = 0;

      for (var i = 0; i < elements.length; i++) {
        x = x + 0.4;
        double y = 0;
        double res = double.parse(elements[i]);
        y = res;
        cashSpots.add(FlSpot(x, y));
      }
    }

    return cashSpots;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Stack(
      alignment: Alignment.center,
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
            width: width * 0.97,
            height: height * 1,
            child: LineChart(
              LineChartData(
                lineTouchData: LineTouchData(
                  touchTooltipData: LineTouchTooltipData(
                    tooltipBgColor: const Color.fromARGB(255, 216, 200, 241),
                  ),
                ),
                titlesData: FlTitlesData(show: false),
                borderData: FlBorderData(show: false),
                minX: 0,
                maxX: 15,
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
                    tooltipBgColor: const Color.fromARGB(255, 216, 200, 241),
                  ),
                ),
                titlesData: FlTitlesData(show: false),
                borderData: FlBorderData(show: false),
                minX: 0,
                maxX: 15,
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
