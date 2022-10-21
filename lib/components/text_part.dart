import 'package:flutter/material.dart';

class TextPart extends StatelessWidget {
  const TextPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(vertical: height * 0.02),
      child: Text(
        'График расходов',
        style: TextStyle(
          fontSize: width * 0.04,
          color: Colors.black54,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
