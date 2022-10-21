import 'package:flutter/material.dart';

class CardCashIndLines extends StatelessWidget {
  const CardCashIndLines({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: width,
        maxHeight: height * 0.05,
      ),
      child:
      
      
       Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            child: Row(
              children: [
                Container(
                  width: 20,
                  height: 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFF9453F4),
                  ),
                ),
                const SizedBox(width: 5),
                const Text('Наличные'),
              ],
            ),
          ),
          SizedBox(
            width: width * 0.12,
          ),
          SizedBox(
            child: Row(
              children: [
                Container(
                  width: 20,
                  height: 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFFE763F2),
                  ),
                ),
                const SizedBox(width: 5),
                const Text('Карта'),
              ],
            ),
          ),
        ],
      ),
   
   
   
    );
  }
}
