import 'package:flutter/material.dart';

import 'package:outcome_app/providers/outcome_type_provider.dart';
import 'package:provider/provider.dart';

class ListWheel extends StatelessWidget {
  FixedExtentScrollController scrollController = FixedExtentScrollController();

  ListWheel({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<OutTypeProvider>();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxHeight: 200,
        maxWidth: 300,
      ),
      child: SizedBox(
        width: width * 0.72,
        height: height * 0.24,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(
                maxHeight: 5,
                maxWidth: 30,
              ),
              child: Container(
                margin: EdgeInsets.only(right: width * 0.01),
                width: width * 0.07,
                height: height * 0.006,
                decoration: BoxDecoration(
                  color: const Color(0xFF9453F4),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            Expanded(
              child: ListWheelScrollView.useDelegate(
                onSelectedItemChanged: (value) {},
                controller: scrollController,
                itemExtent: 25,
                physics: const FixedExtentScrollPhysics(),
                perspective: 0.005,
                squeeze: 0.7,
                childDelegate: ListWheelChildBuilderDelegate(
                  childCount: model.typeList.length,
                  builder: (context, index) =>
                      WheelItem(index: model.typeList[index]),
                ),
              ),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(
                maxHeight: 5,
                maxWidth: 30,
              ),
              child: Container(
                margin: EdgeInsets.only(left: width * 0.01),
                width: width * 0.07,
                height: height * 0.006,
                decoration: BoxDecoration(
                  color: const Color(0xFF9453F4),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WheelItem extends StatelessWidget {
  const WheelItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  final String index;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 10, maxWidth: 250),
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [
              Color(0xFF9453F4),
              Color(0xFFE763F2),
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        width: width * 0.60,
        height: height * 0.012,
        child: Center(
          child: Text(
            index,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
